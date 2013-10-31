# FFI procs

proc stbi_load(filename: cstring, x: int, y: int, comp: int, req_comp: int): cstring
  {.cdecl, importc, dynlib: "libstb_image.so".}


# Public interface

type
  TImage* = object of TObject
    width*: int
    height*: int
    depth*: int
    data*: int8

proc load*(filename: string) =
  var
    width = 0
    height = 0
    depth = 0

  let data = stbi_load(filename, width, height, depth, 0)