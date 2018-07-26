#!/usr/bin/env bash

echo -ne "\n\e[33mRun $BUILD_COMMAND command ...\e[0m\n\n"

command=($BUILD_COMMAND)
"${command[@]}"
