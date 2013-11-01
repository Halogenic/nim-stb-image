import unsigned

# FFI procs

const
  Lib = "libstb_image.so"

type
  PUChar = ptr cchar

proc stbi_load(filename: cstring, x, y, comp: var cint, req_comp: int): PUChar
  {.cdecl, importc: "stbi_load", dynlib: Lib.}

proc stbi_image_free(data: PUChar)
  {.cdecl, importc: "stbi_image_free", dynlib: Lib.}

proc failure_reason*(): cstring
  {.cdecl, importc: "stbi_failure_reason", dynlib: Lib.}

# Higher level wrappers

type
  TImage* = object
    width*: cint
    height*: cint
    depth*: cint
    data*: PUChar

proc load*(filename: string): TImage =
  var
    width: cint
    height: cint
    depth: cint

  let data = stbi_load(filename, width, height, depth, 0)

  result = TImage(
    width: width,
    height: height,
    depth: depth,
    data: data
  )

proc free*(img: TImage) =
  stbi_image_free(img.data)
