---
type: posts
tag: reference
layout: post
title: "Monoprice Select v2.1 modifications"
author: "Svyatoslav I. Maslennikov"
---

I made a terrible choice of buying a [Monoprice Select v2](https://www.amazon.com/gp/product/B018GZBC3Y) for $229.99+tax

You can't know which you'll get, apparently: I got v2.1 with knurled bed adjusting rings instead of winged ones. The following are mods I've performed, gauged by necessity. AFAIK all v2s need these, not just v2.1.

<!-- toc -->

- [Mosfet bed heater upgrade](#mosfet-bed-heater-upgrade)
- [Better fan and cooler](#better-fan-and-cooler)
- [Bed leveling](#bed-leveling)
    * [Replacing the Y carriage plate](#replacing-the-y-carriage-plate)
    * [Three point leveling](#three-point-leveling)
- [Printable additions](#printable-additions)
- [Filament used](#filament-used)
- [Operation](#operation)

<!-- tocstop -->

## Mosfet bed heater upgrade

Apparently if you don't do this, you'll fry the connectors that go to the motherboard. Use [this](https://letsprint3d.net/2017/01/29/guide-installing-a-mosfet-board-maker-select-v2/) tutorial and

- print [this thing](https://www.thingiverse.com/thing:2295820),

and buy:

- [the board itself](https://www.amazon.com/gp/product/B01HEQVQAK) - $6.99
- [a set of hex screws and nuts](https://www.amazon.com/gp/product/B071KBVZVV) that you'll need for other mods, too. And for screws you lose - $22.99
- [spade terminal connectors](https://www.amazon.com/gp/product/B005HQ4VWU) - $6.19
- [extra wire](https://www.amazon.com/gp/product/B017U6PGLO) that I don't think I needed - $5.48

## Better fan and cooler

The original fan is weak and its metal case doesn't place air everywhere you want it, I guess.

- print one of [these](https://www.thingiverse.com/thing:1025471) (you probably want the `DiiiCooler_Rev3-21-V2-1_Beta3.STL` but read his instructions, don't listen to me)
- buy one of [these](https://www.amazon.com/gp/product/B07DB6132Q) and throw the second one away - $20
   - or buy them for a third of the price on aliexpress and wait a year for it to ship

## Bed leveling

After unpacking and leveling the bed, stuff printed great for a while. Then, it didn't. Here's a list of fixes I implemented and what they're supposed to fix (it makes sense to do this whole section at once, as many things are at play and everything sucks):

- a [glass bed](https://www.amazon.com/gp/product/B07B2YLWF9) will remain level, but don't clip it on, just place it on top of a thermal pad (below). This will ensure you have a perfectly level surface - $25.99
- just one of [these pads](https://www.amazon.com/gp/product/B01N9HGKR1) will be enough. I removed the black surface sticker that came with the printer, you might not have to. This makes sure that your glass surface will get as much heat as possible - $7.99

### Replacing the Y carriage plate

...the original of which is apparently too weak.

Follow [this](https://letsprint3d.net/2017/11/19/3-point-bed-level-conversion-maker-select-v2/) vaguely. You'll need:

- [a new Y carriage plate](https://www.amazon.com/gp/product/B07B251KBS) - $27.99

### Three point leveling

This will:

- allow for easier leveling
- ensure you don't bend another Y carriage plate by over-tightening opposite screws

If you got the glass above, you'll need to drill a hole for the third adjustment screw. Great. Get these:

- [diamond drill bits](https://www.amazon.com/gp/product/B00ODSS5NO) - $6.99
- [drill chuck adapter for hex](https://www.amazon.com/gp/product/B0051AE85W) if you've got a lame drill - $11.54

Drill slowly, add water to lubricate. Prostrats: tape cardboard on top of the proposed hole to keep the bit in place.

## Printable additions

These are nice to have:

- [a tool holder](https://www.thingiverse.com/thing:2131776)

I guess there aren't any more nice things.

## Filament used

I read nonsense about how PLA+ (Premium PLA) is better and have been buying these [Inland rolls](https://www.amazon.com/gp/product/B07FMKNGWD) almost exclusively. They've been great and cheap! Except now they're mostly gone from Amazon stock.

## Operation

My tactics for operating this printer are as follows:

1. Use [Cura](https://ultimaker.com/software/ultimaker-cura) (though better alternatives that I haven't tried apparently exist)
2. Select the proper printer preset (make sure the dimensions correlate to that of reality, 200x200x180mm)
3. Historically I used much higher temperature presets:
    - default build plate temperature: `80C`
4. Both fans are upgraded, so they should be tuned to lower speeds:
    - extruder fan speed: `75`
    - extruder regular fan speed at height: `0.5`
5. Ensure supports are present at sharper angles, etc. Realize how a 3D printer prints: in circles, top to bottom. Bridges, for example, are difficult when things are out of tune.
6. Slice the model, save to an SD card, insert SD card into printer
7. Clean the bed up with the scraper
8. Adjust the bed by:
    1. Setting the extruder to height `0`,
    2. Shutting off the printer,
    3. Moving the extruder manually to each of the three adjustable areas and adjusting bed height there while sliding a piece of paper between the bed and the extruder. You should feel slight resistance in pulling paper through.
    4. Continue step 3 until the paper test works well on all corners. I usually prefer to err on the side of having the extruder *too low* rather than too high: that way, the first layer may be squeezed on, but it'll stick better than if it's too high.
9. Print! If things turn up weird, you may need to adjust the Z axis - especially where it's reinforced with the rods.
