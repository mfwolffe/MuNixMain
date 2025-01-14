#!/bin/bash

remote_adder () {
	git remote add origin "${1}"
	git push -u origin trunk
}

# TODO @mfwolffe  need to iterate through submodules proper, 
#                 not directories. This still works for 
#                 adding remotes to modules w.out
#                 but will begin to have unexpected behavior 
#                 once directories are introduced which are *not*
#                 submodules
for d in */ ; do
	# chop off trailing slash and store remote name
	remote=`echo "${d}" | sed "s/\/$//"`
	remote="git@github.com:mfwolffe/${remote}.git"
	
	pushd "${d}" >/dev/null

	printf "Sanitizing yielded remote: "
	tput bold;
	tput setaf 5;
	printf "%s\n" $remote ;
	tput sgr0;
	
	printf "Add this remote for current repository: " ;
	tput bold;
	tput setaf 6;
	printf "%s\n" $d
	tput sgr0
	
	select yn in "Yes" "No"; do
    case $yn in
      Yes ) remote_adder $remote; break;;
      No ) exit;;
    esac
	done

	popd >/dev/null

done ;
