let test_person_serialization () =
  let person = { Stratocaml.name = "Bob"; age = 42 } in
  let yojson = Stratocaml.yojson_of_person person in
  let expected_yojson = `Assoc [ ("name", `String "Bob"); ("age", `Int 42) ] in
  Alcotest.(check (module Yojson.Safe)) "person yojson" expected_yojson yojson

let () =
  let open Alcotest in
  run
    "Stratocaml"
    [ ( "person"
      , [ test_case "Serialization" `Quick test_person_serialization ] )
    ]
