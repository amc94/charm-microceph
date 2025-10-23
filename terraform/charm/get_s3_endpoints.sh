#!/bin/bash
set -euo pipefail
APP=$1
MODEL=$2
juju status -m "${MODEL}" "${APP}"/leader --format=json | jq -r '"{\"endpoint\": \"http://" + (.applications | .[].units | .[] | .["public-address"] // .address) + "\"}"'
