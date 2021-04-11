# To-ASCII-Nim
A command line tool for converting images to ASCII!

## Compiling / Building
```
nimble install
```
or
```
nim compile src/toascii.nim
```

## Usage
```
asciify <source> <scale> [width stretch] [palette]
```
### Arguments:
*Required arguments are surrounded in <>, optional arguments are surrounded in [].*
- source - *The source, either a file path or video device.*
- scale - Used to scale down the image to fit in your console, recommended value is 0.1.
- width stretch - Used to account for console characters being taller than they are wide, default value is 2.0.
- palette - The palette used, one of BLOCK, HIGH, LOW, or a custom palette as a string.
*Required arguments are surrounded in <>, optional arguments are surrounded in [].*
