#!/usr/bin/env python

import sys
import re

color = sys.argv[1]
print color
if color[0] == "#":
    color = color[1:]

hex = re.compile(r"([0-9a-fA-F]{6})")

red255 = None

if hex.match(color):
    red = color[0:2]
    green = color[2:4]
    blue = color[4:6]

    red255 = int(red,16)
    green255 = int(green,16)
    blue255 = int(blue,16)

    red1 = red255 / 255.0
    green1 = green255 / 255.0
    blue1 = blue255 / 255.0

print "%d, %d, %d" % (red255, green255, blue255)
print "%f, %f, %f" % (red1, green1, blue1)

