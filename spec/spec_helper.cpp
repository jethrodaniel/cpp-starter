/*

#include <sstream>
#include <fstream>

// Returns a file as a string
static std::string to_s(std::string filename) {
  std::ifstream ifs(filename);
  std::stringstream buffer;

  buffer << ifs.rdbuf();
  return buffer.str();
}

*/
