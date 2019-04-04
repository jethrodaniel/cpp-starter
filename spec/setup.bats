#!/usr/bin/env bats

setup() {
  this_dir=$(dirname $(readlink -f $0))
  source "${this_dir}/../../../../setup_helper.sh"
}

@test "it should eventually test the setup script" {
  run echo "testing, 1, 2, 3"
  [ $status -eq 0 ]
  [ "${lines[0]}" == "testing, 1, 2, 3" ]
}
