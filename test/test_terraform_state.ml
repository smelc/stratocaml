open Stratocaml

(* let of_yojson_result deserializer state =
  try deserializer state |> Result.ok
  with Ppx_yojson_conv_lib.Yojson_conv.Of_yojson_error (Failure what, json) ->
    Result.Error (what ^ " in " ^ Yojson.Safe.to_string json) *)

let try_deserialize deserializer state =
  try deserializer state |> Result.ok
  with Melange_json.Of_json_error (Melange_json.Json_error err) ->
    Result.Error err

let test_deserialize_state () =
  let json_string =
    In_channel.with_open_text "example.tfstate" In_channel.input_all
  in
  let yojson = Yojson.Basic.from_string json_string in
  let state_result = try_deserialize Terraform_state.state_v4_of_json yojson in
  match state_result with
  | Ok state ->
      Alcotest.(check int) "version" 4 state.version;
      Alcotest.(check string)
        "terraform_version" "1.0.0" state.terraform_version
  | Error e -> Alcotest.(fail e)

let test_deserialize_complex_state () =
  let json_string =
    In_channel.with_open_text "complex.tfstate" In_channel.input_all
  in
  let yojson = Yojson.Basic.from_string json_string in
  let state_result = try_deserialize Terraform_state.state_v4_of_json yojson in
  match state_result with
  | Ok state ->
      Alcotest.(check string)
        "terraform_version" "1.2.3" state.terraform_version;
      Alcotest.(check int) "resource count" 1 (List.length state.resources)
  | Error e -> Alcotest.(fail e)

let () =
  let open Alcotest in
  run "terraform_state"
    [
      ( "deserialization",
        [
          test_case "deserialize_example_state" `Quick test_deserialize_state;
          test_case "deserialize_complex_state" `Quick
            test_deserialize_complex_state;
        ] );
    ]
