[![shellcheck](https://github.com/smelc/template/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/smelc/template/actions/workflows/shellcheck.yml) 
[![actionlint](https://github.com/smelc/template/actions/workflows/actionlint.yml/badge.svg)](https://github.com/smelc/template/actions/workflows/actionlint.yml)

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
