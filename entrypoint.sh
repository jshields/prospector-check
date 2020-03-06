#!/bin/sh
set -ax

# json data file
json_file="/tmp/prospector.json"

# get prospector version
prospector --version

# run prospector, save exit code
prospector -o json:"$json_file" -o text
exit_code=$?

# analyze json
python github.py "$json_file"

exit $exit_code
