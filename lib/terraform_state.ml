(* Inspired from https://github.com/hashicorp/terraform/blob/main/internal/states/statefile/version4.go *)

open Ppx_yojson_conv_lib.Yojson_conv.Primitives

type check_results_object_v4 = {
  object_addr : string; [@key "object_addr"]
  status : string; [@key "status"]
  failure_messages : string list; [@key "failure_messages"] [@default []]
}
[@@deriving yojson]

type check_results_v4 = {
  object_kind : string; [@key "object_kind"]
  config_addr : string; [@key "config_addr"]
  status : string; [@key "status"]
  objects : check_results_object_v4 list; [@key "objects"]
}
[@@deriving yojson]

type instance_object_state_v4 = {
  index_key : [ `Int of int | `String of string ] option;
      [@key "index_key"] [@default None]
  status : string option; [@key "status"] [@default None]
  deposed : string option; [@key "deposed"] [@default None]
  schema_version : int64; [@key "schema_version"]
  (* attributes_raw: Yojson.Safe.t option [@key "attributes"] [@default None]; *)
  attributes_flat : (string * string) list option;
      [@key "attributes_flat"] [@default None]
  (* attribute_sensitive_paths: Yojson.Safe.t option [@key "sensitive_attributes"] [@default None]; *)
  identity_schema_version : int64; [@key "identity_schema_version"]
  (* identity_raw: Yojson.Safe.t option [@key "identity"] [@default None]; *)
  private_raw : string option; [@key "private"] [@default None]
  dependencies : string list option; [@key "dependencies"] [@default None]
  create_before_destroy : bool option;
      [@key "create_before_destroy"] [@default None]
}
[@@deriving yojson]

type resource_state_v4 = {
  module_path : string option; [@key "module"] [@default None]
  mode : string; [@key "mode"]
  type_ : string; [@key "type"]
  name : string; [@key "name"]
  each_mode : string option; [@key "each"] [@default None]
  provider_config : string; [@key "provider"]
  instances : instance_object_state_v4 list; [@key "instances"]
}
[@@deriving yojson]

type output_state_v4 = {
  (* value_raw: Yojson.Safe.t [@key "value"];
     value_type_raw: Yojson.Safe.t [@key "type"]; *)
  sensitive : bool; [@key "sensitive"] [@default false]
}
[@@deriving yojson]

type state_v4 = {
  version : int; [@key "version"]
  terraform_version : string; [@key "terraform_version"]
  serial : int64; [@key "serial"]
  lineage : string; [@key "lineage"]
  root_outputs : (string * output_state_v4) list; [@key "outputs"]
  resources : resource_state_v4 list; [@key "resources"]
  check_results : check_results_v4 list option;
      [@key "check_results"] [@default None]
}
[@@deriving yojson]
