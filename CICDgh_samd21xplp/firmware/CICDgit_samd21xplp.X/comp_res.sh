#!/bin/bash

status=x

if [[ "`find ./dist -name *.elf`" != "" ]]; then
	echo "Resultfile `find ./dist -name *.elf` -> compile successful"
	status=0
else
	echo "no resultfile -> compile failed"
	status=1
fi

exit $status
