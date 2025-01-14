#!/bin/bash

set -x

if [ ! $# -eq 2 ]; then 
  printf "\nmissing new module name\n" >&2 ;
  exit 1 ;
fi

module_ref="${1}"
shift

case "${1}" in
  "ssh" | "SSH")
    module_url="git@github.com:mfwolffe/${module_ref}.git" ;;
  "https" | "HTTPS")
    module_url="https://github.com/mfwolffe/${module_ref}.git" ;;
esac

git submodule add "${module_url}"

# --init flag will clone the repo too
# --recursive will do the same for any sub-submodules
git submodule update --init --recursive

git add "${module_ref}"

