import strformat
import imageman
import strutils
import system
import tables
import os

import ./asciifier
import ./palettes

const INVALID_ARGS: string = """Invalid arguments inputted. See below for proper usage:
asciify <type> <source> <scale> [width stretch] [gradient] [loop]
Arguments:
type            The type of content, either IMAGE, VIDEO, or LIVE.
source          The source, either a file path or video device.
scale           Used to scale down the image to fit in your console, recommended value is 0.1.
width stretch   Used to account for console characters being taller than they are wide, default value is 2.0.
gradient        The gradient used, one of BLOCK, HIGH, LOW, or a custom gradient as a string.
loop            If "loop" is the 5th argument, the displayed ASCII video will loop until interrupted.
Required arguments are surrounded in <>, optional arguments are surrounded in [].
"""

when isMainModule:
  let args = commandLineParams()

  if not (args.len in [2, 3, 4]):
    echo INVALID_ARGS
    quit 1

  # let sourceType: string = args[0].toLowerAscii
  #
  # if not (sourceType in ["image"]):
  #   echo INVALID_ARGS
  #   quit 1

  let source: string = args[0]

  if not fileExists(source):
    echo &"File {source} does not exist."
    quit 1

  var scale: float

  try:
    scale = args[1].parseFloat
  except ValueError:
    echo INVALID_ARGS
    quit 1


  var widthStretch: float

  try:
    widthStretch = args[2].parseFloat
  except ValueError:
    widthStretch = 2.0

  let palette: string = Palettes.getOrDefault(args[3].toUpperAscii, Palettes["BLOCK"])

  let image = loadImage[ColorRGBF](source)
  echo image.scaleDownToMax((scale * image.height.float).int).stretchWidth(widthStretch).asciify(palette)
