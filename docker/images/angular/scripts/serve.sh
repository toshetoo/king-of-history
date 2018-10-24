#!/usr/bin/env bash

echo -ne "\n\e[33mRun $SERVE_COMMAND command ...\e[0m\n\n"

command=($SERVE_COMMAND)
"${command[@]}"
