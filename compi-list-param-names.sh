#!/bin/bash

function printHelp {
  echo "Usage: `basename $0` [ </path/to/pipeline.xml> ]"
  echo -e "\tIf no path is provided, the script uses \"pipeline.xml\" as Compi XML file"
}

if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ $# -gt 1 ]; then
  printHelp
  exit 0
fi

FILE=${1:-pipeline.xml}

if [ -f $FILE ]; then
	cat $FILE | grep '<param' | grep -o -e 'name=".*' | sed 's#name="##g' | sed 's#".*##g'
else
	echo "$FILE does not exist"
fi
