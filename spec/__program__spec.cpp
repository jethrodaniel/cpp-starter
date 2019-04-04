#include "../vendor/Catch2/include/catch.hpp"

#include "spec_helper.cpp"

#include "../src/__program__.hpp"

SCENARIO("__program__") {
  GIVEN("a __program__") {
    __program__::__program_upcase__ example;

    REQUIRE(example.example() == 1);

    WHEN( "" ) {
      THEN( "" ) {
        REQUIRE(true == true);
      }
    }
  }
}
