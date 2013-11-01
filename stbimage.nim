import unsigned

# FFI procs

type
  PUChar* = ptr cchar

proc stbi_load(filename: cstring, x, y, comp: var cint, req_comp: int): PUChar
  {.cdecl, importc: "stbi_load", dynlib: "libstb_image.so".}


# Public interface

type
  TImage* = object
    width*: cint
    height*: cint
    depth*: cint
    data*: uint8

proc load*(filename: string) =
  var
    width: cint
    height: cint
    depth: cint

  let data = stbi_load(filename, width, height, depth, 0)

#  TImage(width: int(width), height: int(height), depth: int(depth), data: uint8(data))
