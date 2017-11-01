#!/bin/bash

dirs=();
script="";
params=();

for i in $(seq 1 $#); do
	arg="${!i}"
	if [[ -L $arg && -d $arg ]]; then
		dirs+=($arg)
	else
		if [[ $script == "" ]]; then
			script=$arg;
		else
			params+=($arg)
		fi
	fi
done

echo "Applying $script with params [${params[*]}] to"
echo "${dirs[*]}" | tr ' ' '\n'

echo ""

echo ${dirs[*]} | tr ' ' '\n' | xargs -L 1 $script ${params[*]}
