#!/usr/bin/env bash
set -euo pipefail

# $1: exit status   $2: message
die() {
    echo "${2:-}" >&2 && exit "${1:-1}"
}

SHORTOPT=blp:u:
LONGOPTS=batch,local,password:,username:

! PARSED=$(getopt --options=${SHORTOPT} --longoptions=${LONGOPTS} --name "$0" -- "$@")
[[ ${PIPESTATUS[0]} -ne 0 ]] && die 2
eval set -- "$PARSED"

while true; do
    case $1 in
        -b|--batch)
            batch=1
            shift
            ;;
        -l|--local)
            local=1
            shift
            ;;
        -p|--password)
            DOCKER_PASSWORD=$2
            shift 2
            ;;
        -u|--username)
            DOCKER_USERNAME=$2
            shift 2
            ;;
        --)
            shift
            break
            ;;
        *)
            die 2 "Error while parsing arguments"
    esac
done

if [ -z ${local+x} ]; then
    [ -v batch ] && : "${DOCKER_PASSWORD?Missing value; use -p|--password flag or export the environment variable.}"
    : "${DOCKER_USERNAME?Missing value; use -u|--username flag or export the environment variable.}"
fi

# $1: directory to process
mkimage() {
    echo "hadolint $1"
    docker run --rm -i lukasmartinelli/hadolint < "$1/Dockerfile"

    echo "docker build $1"
    tag=$DOCKER_USERNAME/$1
    docker build --tag "$tag" "$1"

    echo "docker run"
    uuid=$(docker run -td "$tag")
    docker stop "$uuid"
}

docker_login() {
    if [ -v DOCKER_PASSWORD ]; then
        echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
    else
        docker login -u "$DOCKER_USERNAME"
    fi

    loggedin=1
}

# $1: image name
deploy() {
    [ -v loggedin ] || docker_login
    docker push "$DOCKER_USERNAME/$1"
}


[ $# -lt 1 ] && set -- clang* gcc*

for dir in "$@"; do
    [ -d "$dir" ] || die 3 "\"$dir\" is not a valid directory"
done

echo "The following images will be built: $*"

for dir in "$@"; do
    mkimage "$dir"
    [ -z ${local+x} ] && deploy "$dir"
done

