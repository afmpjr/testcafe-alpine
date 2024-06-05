#!/usr/bin/env bash

testcafe() {
    local source=""
    local browser=""
    local target=""
    local output=""
    local reporter=""

    while [[ $# -gt 0 ]]; do
        case "$1" in
            -source)
                source="$2"
                shift 2
                ;;
            -browser)
                browser="$2"
                shift 2
                ;;
            -target)
                target="$2"
                shift 2
                ;;
            -output)
                output="$2"
                shift 2
                ;;
            *)
                echo "Error: Unknown argument - $1"
                return 1
                ;;
        esac
    done

    if [[ -z $source || -z $browser || -z $target || -z $output ]]; then
        echo "Error: You must provide the arguments -source, -browser, -target, and -output"
        return 1
    fi

    case "$output" in
        *.xml)
            reporter="--reporter spec,xunit:/testcafe/report.xml"
            ;;
        *.json)
            reporter="--reporter spec,json:/testcafe/report.json"
            ;;
        *)
            echo "Error: Unknown output file extension - $output"
            return 1
            ;;
    esac

    eval docker run -it --rm -v $source:/testcafe/ testcafe-alpine testcafe --color $browser /testcafe/$target $reporter
}
