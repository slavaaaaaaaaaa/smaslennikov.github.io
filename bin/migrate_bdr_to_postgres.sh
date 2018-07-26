#!/bin/bash

export PGREQUIRESSL=0
export PGSSLMODE=allow
export PGSSLROOTCERT=certs/server-ca.pem
export PGSSLCERT=certs/client-cert.pem
export PGSSLKEY=certs/client-key.pem

export SRC_HOST=db01
export SRC_PORT=5432
export SRC_USER=postgres
export SRC_PASS=certs/src_pgpass

export DEST_HOST=db02
export DEST_PORT=5432
export DEST_USER=postgres
export DEST_PASS=certs/dest_pgpass

export DBS="onedb twodb threedb"

export EXTRA_FLAGS="--no-owner --no-acl --no-password"

set -e

function help {
	echo "Read the script for necessary flags"
	exit 0
}

while [[ $# -gt 0 ]]; do
	key="$1"
	case $key in
		--sslrootcert)
		export PGSSLROOTCERT="$2"
		shift
		shift
		;;
		--sslcert)
		export PGSSLCERT="$2"
		shift
		shift
		;;
		--sslkey)
		export PGSSLKEY="$2"
		shift
		shift
		;;
		-dbs|--databases)
		export DBS="$2"
		shift
		shift
		;;
		-sh|--source-host)
		export SRC_HOST="$2"
		shift
		shift
		;;
		-sp|--source-port)
		export SRC_PORT="$2"
		shift
		shift
		;;
		-su|--source-user)
		export SRC_USER="$2"
		shift
		shift
		;;
		-sw|--source-pass)
		export SRC_PASS="$2"
		shift
		shift
		;;
		-dh|--dest-host)
		export DEST_HOST="$2"
		shift
		shift
		;;
		-dp|--dest-port)
		export DEST_PORT="$2"
		shift
		shift
		;;
		-du|--dest-user)
		export DEST_USER="$2"
		shift
		shift
		;;
		-dw|--dest-pass)
		export DEST_PASS="$2"
		shift
		shift
		;;
		-h|--help)
		help
		shift
		;;
		*)
		echo "Unknown option $1"
		exit 1
		;;
	esac
done


function verify_files_hosts {
	for file in ${PGSSLROOTCERT} ${PGSSLCERT} ${PGSSLKEY} ${DEST_PASS} ${SRC_PASS}; do
		if [ ! -f ${file} ]; then
			echo "${file} does not exist but should!"
			exit 1
		fi
	done

	echo "-- Testing hosts' connectivity"
	if ! pg_isready -h ${SRC_HOST} -p ${SRC_PORT} || ! pg_isready -h ${DEST_HOST} -p ${DEST_PORT}; then
		echo "One of the hosts isn't accessible!"
		exit 1
	fi
}

function lock_db {
	DB_NAME=${1}
	LIST_FILE=${2}
	DUMP_FILE=${3}

	echo "-- Checking processes on database"
	PGPASSFILE=${SRC_PASS} psql \
						-h ${SRC_HOST} \
						-p ${SRC_PORT} \
						-U ${SRC_USER} -w \
						-d ${DB_NAME} \
						<< EOF
SELECT usename,application_name,client_addr,backend_start,state \
	FROM pg_stat_activity \
	WHERE datname = '${DB_NAME}';
EOF

	read -p "Proceed with terminating existing connections and locking out the database? " -n 1 -r
	echo
	if [[ ! $REPLY =~ ^[Yy]$ ]]
	then
		echo "-- Exiting"
		exit 0
	fi

	echo "-- Locking out the database and setting connection limit to 1"
	PGPASSFILE=${SRC_PASS} psql \
						-h ${SRC_HOST} \
						-p ${SRC_PORT} \
						-U ${SRC_USER} -w \
						-d ${DB_NAME} \
						<< EOF
UPDATE pg_database \
	SET datallowconn = false, \
		datconnlimit = '1' \
	WHERE datname = '${DB_NAME}';
SELECT pg_terminate_backend(pid) \
	FROM pg_stat_activity \
	WHERE datname = '${DB_NAME}' \
		AND pid <> pg_backend_pid(); \
UPDATE pg_database \
	SET datallowconn = true \
	WHERE datname = '${DB_NAME}';
EOF
}

function dump_db {
	DB_NAME=${1}
	LIST_FILE=${2}
	DUMP_FILE=${3}

	echo "-- Running dump command"
	PGPASSFILE=${SRC_PASS} pg_dump \
						-h ${SRC_HOST} \
						-p ${SRC_PORT} \
						-U ${SRC_USER} \
						-Fc \
						${DB_NAME} \
						${EXTRA_FLAGS} \
					> ${DUMP_FILE}
}

function sanitize_dump {
	DB_NAME=${1}
	LIST_FILE=${2}
	DUMP_FILE=${3}

	echo "-- Setting up TOC"
	pg_restore --list ${DUMP_FILE} | sed -e 's/.*EXTENSION/;&/g' \
						-e 's/.*TABLE DATA bdr/;&/g' \
						-e 's/.*SECURITY LABEL/;&/g' \
					> ${LIST_FILE}
}

function prepare_dest {
	DB_NAME=${1}
	LIST_FILE=${2}
	DUMP_FILE=${3}

	echo "-- Creating database on destination host"
	PGPASSFILE=${DEST_PASS} createdb \
						-h ${DEST_HOST} \
						-p ${DEST_PORT} \
						-U ${DEST_USER} -w \
					${DB_NAME}

	echo "-- Creating needed extensions on destination database"
	for extension in $(grep "EXTENSION -" ${LIST_FILE} | sed -e 's/^.* - //' | grep -v bdr); do
		echo "-- Creating extension: $extension"
		PGPASSFILE=${DEST_PASS} psql \
						-h ${DEST_HOST} \
						-p ${DEST_PORT} \
						-U ${DEST_USER} -w \
						-d ${DB_NAME} \
						<< EOF
CREATE EXTENSION ${extension};
EOF
	done
}

function restore_dump {
	DB_NAME=${1}
	LIST_FILE=${2}
	DUMP_FILE=${3}

	echo "-- Running restore command"
	PGPASSFILE=${DEST_PASS} pg_restore \
						-h ${DEST_HOST} \
						-p ${DEST_PORT} \
						-U ${DEST_USER} \
						--use-list ${LIST_FILE} \
						${DUMP_FILE} \
						${EXTRA_FLAGS} \
						--dbname=${DB_NAME}
}

function migrate_db {
	DB_NAME=${1}

	echo "-- Running on database: ${DB_NAME}"

	LIST_FILE=/tmp/${DB_NAME}_dump.custom.list
	DUMP_FILE=/tmp/${DB_NAME}_dump.custom

	for file in ${LIST_FILE} ${DUMP_FILE}; do
		if [ -f ${file} ]; then
			echo "${file} exists but should not!"
			exit 1
		fi
	done

	lock_db ${DB_NAME} ${LIST_FILE} ${DUMP_FILE}
	dump_db ${DB_NAME} ${LIST_FILE} ${DUMP_FILE}
	sanitize_dump ${DB_NAME} ${LIST_FILE} ${DUMP_FILE}
	prepare_dest ${DB_NAME} ${LIST_FILE} ${DUMP_FILE}
	restore_dump ${DB_NAME} ${LIST_FILE} ${DUMP_FILE}

	echo "Done migrating ${db}!"
}

for db in ${DBS}; do
	verify_files_hosts
	migrate_db ${db}
done
