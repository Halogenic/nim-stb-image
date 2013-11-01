import stbimage

when isMainModule:
  let img = load("richard-model-face.png")

  echo($img.width)
  echo($img.height)
  echo($img.depth)

  free(img)
