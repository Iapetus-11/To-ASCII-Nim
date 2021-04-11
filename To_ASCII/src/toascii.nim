import os

import ./asciifier

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
  let params = commandLineParams()
