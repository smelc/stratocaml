open Ppx_yojson_conv_lib.Yojson_conv.Primitives

type person =
  { name : string
  ; age : int
  }
[@@deriving yojson]

let print_person person =
  let open Yojson.Safe in
  let yojson_person = yojson_of_person person in
  let yojson_string = to_string yojson_person in
  print_endline yojson_string