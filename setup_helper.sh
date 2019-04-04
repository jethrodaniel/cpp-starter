#!/bin/bash

this_dir=$(dirname $(readlink -f $0))

# Asks a yes or no question, defaulting to no
#
# $1 - the question to ask (no need for a `?`)
ask() {
  local choice=''
  echo "${cyan}$1${reset}?"
  echo "  default is no"
  read -p '  (y/n): ' choice
  [[ $choice =~ ^[yY][eE][sS]|[yY]$ ]]
}

# Uses sed to find and replace text in the given file
#
# $1 - the text to replace
# $2 - the text to replace with
# $3 - the file
replace_in_file() {
  # sed works differently on OS X
  if [[ "$(uname -a)" = *"Darwin"* ]] ; then
    sed -i '' "s/$1/$2/g" "$PWD/$3"
  else
    sed -i "s/$1/$2/g" "$PWD/$3"
  fi
}

# Uses sed to delete all lines in a file after a match
#
# $1 - the text to match (will be removed)
# $2 - the file
delete_after_match() {
  sed -i "/^$1$/Q" "$PWD/$2"
}

# Uses sed to delete all lines in a file that match the expression
#
# $1 - the text to match (will be removed)
# $2 - the file
delete_matching() {
  sed -i "/$1/d" "$PWD/$2"
}

