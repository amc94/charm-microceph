#!/bin/bash
set -euo pipefail
APP=$1
MODEL=$2
juju status -m "${MODEL}" "${APP}" --format=json | jq -r '"{\"endpoint\": \"" + (.applications | .'"$APP"'.units[] | select(.leader==true) | ."public-address") + "\"}"'
