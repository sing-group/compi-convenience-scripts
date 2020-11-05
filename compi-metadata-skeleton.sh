#!/bin/bash

function printHelp {
  echo "Usage: `basename $0` [ </path/to/pipeline.xml> ]"
  echo -e "\tIf no path is provided, the script uses \"pipeline.xml\" as Compi XML file"
}

if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ $# -gt 1 ]; then
  printHelp
  exit 0
fi

compi-list-task-names.sh "$@" | awk '
	BEGIN{
		printf "\t<metadata>\n"
	}
	{
		printf "\t\t<task-description id=\"%s\">.</task-description>\n", $1
	}
	END{
		printf "\t</metadata>\n"
	}'
