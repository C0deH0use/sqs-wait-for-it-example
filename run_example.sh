#!/bin/bash

run="run --rm --use-aliases"
dc="-f docker-compose.build-environment.yml -f docker-compose.run-example.yml"
params="<test|down>"


function usage {
    echo "Usage: $0 [-r ${params}]"
    exit 1
} >&2

if [[ -z "$@" ]]; then
    usage
fi

while getopts "r:" opt; do
    case $opt in
        r)
         case "$OPTARG" in
                test)
                    docker-compose ${dc} ${run} test
                    ;;
                down)
                    docker-compose ${dc} down
                    ;;
                *)
                    usage
                    ;;
                esac
            ;;
        ?)
            usage
            ;;
        *)
            usage
            ;;
    esac >&2
done

