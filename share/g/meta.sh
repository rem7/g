#!/usr/bin/env bash

function setProjectDir {
    # iterate until we find golangdeps file
    # and set that dir to $PROJECT_DIR

    PRJECT_FOUND=false
    PROJECT_DIR=$(pwd)

    while [[ !$PROJECT_FOUND ]]; do

      CURRENT_DIR=$(pwd)

      if [[ $CURRENT_DIR == "/" ]]; then
        echo "No project found in path"
        exit 1
      fi

      if [[ -e golangdeps ]]; then
        PROJECT_FOUND=true
        PROJECT_DIR=$CURRENT_DIR
        eval "export PROJECT_DIR=$CURRENT_DIR"
        break
      fi

      cd ..

    done


}
export setProjectDir

function setGoPath {
    setProjectDir
    GOPATH=$PROJECT_DIR/_vendor:$PROJECT_DIR
}
export setGoPath


function addDependency {
  
  setGoPath

  while read line; do
      # echo $line
      stringarray=($line)
      URL=${stringarray[0]}
      # COMMIT=${stringarray[1]}
      if [[ $URL == $1 ]]; then
        # if the dependency already exists don't add it
        return
      fi
  done < golangdeps

  # We got this far, means the dependency doesn't exist
  echo $* >> golangdeps
}
export addDependency