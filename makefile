# This makefile builds and manages the project.
CPP = g++

CPP_FLAGS  = -std=c++17
CPP_FLAGS += -g
CPP_FLAGS += -pedantic
CPP_FLAGS += -Wall
CPP_FLAGS += -Wextra
CPP_FLAGS += -Werror

SPEC_FLAGS  = -std=c++17
SPEC_FLAGS += -Wall
SPEC_FLAGS += -I./spec/Catch2

PROGRAM_NAME = package

SOURCES    := $(shell find src -name '*.cpp')
SPEC_SETUP := './spec/setup.cpp'
SPECS      := $(shell find ./spec -name '*.cpp'            \
                                  -not -path '*Catch2*'    \
                                  -not -name "*setup.cpp")

.PHONY: usage
usage:
	@echo "Usage\n"
	@echo "  make COMMAND"
	@echo "\nCOMMANDS\n"
	@echo "  build       Compiles the source code into an executable"
	@echo "  clean       Removes generated files, except .setup.o and .spec.out"
	@echo "  lint        Runs the linter"
	@echo "  style       Formats source and spec files to adhere to project standards"
	@echo "  spec        Runs the specs"
	@echo "  purge       Removes all generated files"
	@echo

.PHONY: build
build:
	@echo "Compiling source code into ./$(PROGRAM_NAME)"
	@$(CPP) $(CPP_FLAGS) $(SOURCES) -o $(PROGRAM_NAME)

.PHONY: clean
clean:
	@echo "Removing generated files, except .setup.o and .spec.out"
	rm -rf $(PROGRAM_NAME) tmp

.PHONY: lint
lint:
	@echo "Running the linter"
ifeq ( , $(shell which cppcheck))
	$(error Please install cppcheck to run the linter)
else
	cppcheck --enable=all --suppress=missingIncludeSystem $(SOURCES)
endif

PHONY: style
style:
ifeq ( , $(shell which astyle))
	$(error Please install astyle to run the formatter)
else
	@echo "Formating source and spec files"
	astyle --project=.astylerc $(SOURCES) $(SPECS)
endif

.PHONY: spec
spec: .spec.out
	@echo "Running the specs..."
	./.spec.out

.spec.out: .setup.o $(SPECS)
	$(CPP) $(SPEC_FLAGS) .setup.o $(SPECS) -o .spec.out

.setup.o:
	$(CPP) $(SPEC_FLAGS) -c $(SPEC_SETUP) -o .setup.o

PHONY: purge
purge:
	@echo "Removing all generated files"
	rm -rf $(PROGRAM_NAME) tmp *.o *.out .spec.out .setup.o

