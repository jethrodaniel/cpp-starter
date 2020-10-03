#include <iostream>
#include <string>

#include <app.hpp>

int main(int  /*argc*/, char ** /*argv*/) {
  std::cout << "yo" << std::endl;
  auto i = foo();
  return i;
}
