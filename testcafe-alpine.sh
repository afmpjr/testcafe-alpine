#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

testcafe() {
    local no_color=0
    local extra_params=()

    while [[ $# -gt 0 ]]; do
        case "$1" in
            -no-color)
                no_color=1
                shift
                ;;
            -v)
                shift 2
                ;;
            *)
                extra_params+=("$1")
                shift
                ;;
        esac
    done

    if [ $no_color -eq 1 ]; then
        RED=''
        GREEN=''
        YELLOW=''
        BLUE=''
        WHITE=''
        NC=''
    fi

    local docker_command="docker run -it --rm -v $(pwd):/testcafe/ testcafe-alpine testcafe ${extra_params[*]}"

    echo -e "${YELLOW}❯ ${docker_command}${NC}"

    eval $docker_command
}
