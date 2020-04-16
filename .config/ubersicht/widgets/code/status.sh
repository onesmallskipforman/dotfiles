#!/bin/bash

DIRNAME=$(dirname "$0")

FIRST='true'
for SCRIPT in battery date wifi geo ; do
    [[ "$FIRST" == 'true' ]] || echo '|'
    "$DIRNAME/${SCRIPT}.sh"
    FIRST='false'
done
