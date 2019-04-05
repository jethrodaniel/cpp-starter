# cpp-starter

This a basic starter template for c++ code.

## Installation

```
git clone --recurse-submodules https://github.com/jethrodaniel/cpp-starter.git your-project-name

cd your-project-name

./setup
```

It's that easy.

## What it do

It sets you up with:

  - A Makefile with basic project commands
  - BDD-style specs using [Catch2](https://github.com/catchorg/Catch2)

```
Usage

  make COMMAND

COMMANDS

  build       Compiles the source code into an executable
  clean       Removes generated files, except .setup.o and .spec.out
  spec        Runs the specs (c++)
  test        Runs the unit tests (sh)
  purge       Removes all generated files

```
