#!/bin/bash

module_name=$1
echo $module_name

if [ ! -d "${module_name}" ]; then
  mkdir "${module_name}" ;
fi

pushd "${module_name}" >/dev/null ;

touch README.md
echo '### ${module_name}' > README.md

git init -b trunk
git add .
git commit -m "initialize submodule"

popd >/dev/null

git submodule add "./${module_name}"
git submodule update

