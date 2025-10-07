(* type check_results_object_v4 = {
  object_addr : string; [@key "object_addr"]
  status : string; [@key "status"]
  failure_messages : string list; [@key "failure_messages"] [@default []]
} *)

(* open Stratocaml *)

type pair = { fst : string; snd : string } [@@deriving yojson]

let () =
  let test_json =
    {|
    {
      "wrong": "field",
      "snd:": "correct"
    } 
|}
  in
  let state_result = pair_of_yojson (Yojson.Safe.from_string test_json) in
  match state_result with
  | Ok _state -> print_endline "Success"
  | Error e -> print_endline @@ "Error: " ^ e
