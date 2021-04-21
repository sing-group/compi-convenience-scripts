#!/bin/bash

function printHelp {
  echo "Usage: `basename $0` </path/to/compi.log>"
}

if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ ! $# -eq 1 ]; then
  printHelp
  exit 0
fi

cat $1 | grep -e 'Started task' -e 'Started loop task' | sed 's#.*task ##g' | sort -u
