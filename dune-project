(lang dune 3.12)
(name stratocaml)
(generate_opam_files true)
(source (github churlin/stratocaml))
(authors "Clément Hurlin <clement.hurlin@tweag.io>")
(maintainers "Clément Hurlin <clement.hurlin@tweag.io>")

(package
 (name stratocaml)
 (synopsis "JSON for Terraform files")
 (description "JSON for Terraform files")
 (depends
  dune
  ocaml
  odoc
  odoc-parser
  melange-json-native
  (yojson (= 2.2.2))
  ppx_deriving_yojson
  (alcotest :with-test)
  (ocamlformat :with-dev-setup)
  (ocaml-lsp-server :with-dev-setup)))
