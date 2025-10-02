open Stratocaml

let test_deserialize_state () =
  let json_string =
    In_channel.with_open_text "example.tfstate" In_channel.input_all
  in
  let yojson = Yojson.Safe.from_string json_string in
  let state = Terraform_state.state_v4_of_yojson yojson in
  Alcotest.(check int) "version" 4 state.version;
  Alcotest.(check string) "terraform_version" "1.0.0" state.terraform_version

let test_deserialize_complex_state () =
  let json_string =
    In_channel.with_open_text "complex.tfstate" In_channel.input_all
  in
  let yojson = Yojson.Safe.from_string json_string in
  let state = Terraform_state.state_v4_of_yojson yojson in
  Alcotest.(check string) "terraform_version" "1.2.3" state.terraform_version;
  Alcotest.(check int) "resource count" 1 (List.length state.resources)

let () =
  let open Alcotest in
  run "Terraform State"
    [
      ( "deserialization",
        [
          test_case "Deserialize example state" `Quick test_deserialize_state;
          test_case "Deserialize complex state" `Quick
            test_deserialize_complex_state;
        ] );
    ]
