(* type check_results_object_v4 = {
  object_addr : string; [@key "object_addr"]
  status : string; [@key "status"]
  failure_messages : string list; [@key "failure_messages"] [@default []]
} *)

open Stratocaml

let () =
  let test_json = {|
    {
      "object_addr": "module.hello.null_resource.test",
      "status": "success",
      "failure_messages": []
    } 
|} in
  let state_result = Terraform_state.yojson_of_check_results_v4 yojson in
  match state_result with
    | Ok state ->
        Alcotest.(check int) "version" 4 state.version;
        Alcotest.(check string) "terraform_version" "1.0.0" state.terraform_version
    | Error e ->
        Alcotest.(fail e)
