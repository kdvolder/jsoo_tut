Source material:
================

https://hackmd.io/@Swerve/HyhrqnFeF

Setting up project from scratch
===============================

Assumption: you have opam installed, that's where we start.

Step 1: create a local switch

```
opam switch create .
eval $(opam env)
```

Step 2: install dune

```
opam install dune
```

Step 3: create dune project scaffold

```
dune init proj jsoo_tut
```
