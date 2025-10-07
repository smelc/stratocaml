(* type check_results_object_v4 = {
  object_addr : string; [@key "object_addr"]
  status : string; [@key "status"]
  failure_messages : string list; [@key "failure_messages"] [@default []]
} *)

(* open Stratocaml *)
open Melange_json.Primitives

type pair = { fst : string; snd : string } [@@deriving json]

let test_pair_json_json () =
  let test_json =
    {|
    {
      "wrong": "field",
      "snd:": "correct"
    } 
|}
  in
  let melange_json = Yojson.Basic.from_string test_json in
  let _state_result = pair_of_json melange_json in
  ()

let () = test_pair_json_json ()
