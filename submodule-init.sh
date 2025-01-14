#!/bin/bash

# show execution
set -x

# do not follow symlinks
set -P

# for each dir here..
for d in */ ; do
	# go into the dir but redirect 
	# popd stdout to dev null
	# but DON'T redirect stderr
	# (I could also just check if stack directory 
	#  things have a quiet flag???) (as it turns out
	#  there actually is no quiet flag)
	pushd "${d}" >/dev/null ;
	
	# initialize repo
	if [ ! -d ".git" ]; then
		git init -b trunk ;
	fi

	if [ ! -f "README.md" ]; then
		touch README.md ;
		echo "### ${d}" > Readme.md ;
	fi

	# need a commit to create submod
	# but this approach will not work and I don't
	# feel like being robust rn
	#
	# commits=$(git rev-list --count HEAD) ;

	# commit something if no commits have been made
	# TODO @mfwolffe edge case coverage for this cond.
	# if [ "$commits" -eq 0 ]; then
		git add . ;
		git commit -m "initialize submodule" ;
	# fi
	
	# go back from whence ye came
	# (and do the same redirection)
	popd >/dev/null ;

	git submodule add "./${d}" ;
done ;

git submodule init
git submodule update
