import imageman
import math

proc scaleDownToMax*(image: Image, maxDim: int): Image =
  if image.width > image.height:
    return image.resizedTrilinear(maxDim, ((image.height.float / image.width.float) * maxDim.float).int)
  elif image.width < image.height:
    return image.resizedTrilinear(((image.width.float / image.height.float) * maxDim.float).int, maxDim)
  else:
    return image.resizedTrilinear(maxDim, maxDim)

proc stretchWidth*(image: Image, factor: float): Image =
  return image.resizedTrilinear((image.width.float * factor.float).int, image.height)

proc asciifyPixel(palette: string, p: ColorRGBF): char =
  let lumi = 0.2126 * p.r + 0.7152 * p.g + 0.0722 * p.b
  let index = ceil((palette.len - 1).float * lumi).int

  return palette[index]

proc asciify*(image: Image[ColorRGBF], palette: string): string =
  for i, p in image.data:
    if i mod image.width == 0:
      result &= '\n'

    result &= palette.asciifyPixel(p)
