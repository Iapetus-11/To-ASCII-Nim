# Package

version       = "1.0.0"
author        = "Milo Weinberg"
description   = "A command line tool for converting images to ASCII!"
license       = "MIT"
srcDir        = "src"
bin           = @["toascii"]


# Dependencies

requires "nim >= 1.4.4"
requires "imageman >= 0.8.2"
