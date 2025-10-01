[![OCaml build](https://github.com/smelc/stratocaml/actions/workflows/ocaml.yml/badge.svg)](https://github.com/smelc/stratocaml/actions/workflows/ocaml.yml) 
[![shellcheck](https://github.com/smelc/stratocaml/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/smelc/stratocaml/actions/workflows/shellcheck.yml) 
[![actionlint](https://github.com/smelc/stratocaml/actions/workflows/actionlint.yml/badge.svg)](https://github.com/smelc/stratocaml/actions/workflows/actionlint.yml)

# Development instructions

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
