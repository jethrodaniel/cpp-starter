#include <catch.hpp>
#include "../src/app.hpp"

SCENARIO("app", "[app]") {
  GIVEN("something") {
    WHEN("something happens") {
      THEN("we get this") {
        REQUIRE(foo() == 0);
      }
    }
  }
}
