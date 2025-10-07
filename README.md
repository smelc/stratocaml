[![OCaml build](https://github.com/smelc/stratocaml/actions/workflows/ocaml.yml/badge.svg)](https://github.com/smelc/stratocaml/actions/workflows/ocaml.yml) 
[![shellcheck](https://github.com/smelc/stratocaml/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/smelc/stratocaml/actions/workflows/shellcheck.yml) 
[![actionlint](https://github.com/smelc/stratocaml/actions/workflows/actionlint.yml/badge.svg)](https://github.com/smelc/stratocaml/actions/workflows/actionlint.yml)

# Stratocaml

Faifthful representation of Terraform JSON files in OCaml, starting with the [v4 state file](./lib/terraform_state.ml)

## Development instructions

Install dependencies:

```
opam install . --deps-only
```

Build as usual:

```
dune build
```

Test as usual:

```
dune runtest
```

When adding a dependency to `dune-project`:

```
dune pkg lock
dune build stratocaml.opam
opam install . --deps-only
```

When adding a `with-dev-setup` dependency to `dune-project`:

```
dune pkg lock
dune build stratocaml.opam
opam install . --with-dev-setup
```

Launch binary:

```
dune exec stratocaml
```
