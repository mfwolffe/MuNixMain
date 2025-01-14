#!/bin/bash

set -x

remote_remover () {
  rm -rf "${1}"
  git config -f .gitmodules --remove-section "submodule.${1}"
  git add .gitmodules
  git config -f .git/config --remove-section "submodule.${1}"
  rm -rf ".git/modules/${1}"
  git rm --cached "${1}"
}

if [ $# -eq 0 ]; then 
  printf "\nmissing submodule to remove\n" >&2
  exit 1
fi

module="${1}"
shift

if [ ! -d "${module}" ]; then 
  printf "\nnonexistant module\n" >&2
  exit 1
fi

printf "This script will remove submodule "
tput bold
tput setaf 4
printf "%s" $module
tput sgr0

echo ""
tput bold
tput setaf 2
printf "Proceed?\n\n"
tput sgr0

tput setaf 3
select yn in "Yes" "No"; do
  case $yn in
    Yes ) remote_remover $module; break;;
    No ) exit;;
  esac
done
tput sgr0

tput bold
tput setaf 1
printf "\nModule removed. Please double check status and contents then commit changes.\n" 
tput sgr0

exit 0

