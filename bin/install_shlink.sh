#!/bin/bash
#
# install backends and storage
#

CURL="curl -L --retry 15 --retry-delay 2" # retry for up to 30 seconds

function fetch_shlink_dist() {
    local location="$1"
    local version="$2"
    echo "Shlink backend installed"
    local dist="shlink"
    local dist_url="https://github.com/calcom/cal.com/archive/refs/tags/${version}.tar.gz"
    if [ -f "${CACHE_DIR}/dist/${dist}" ]; then
        echo "File is already downloaded"
    else
        ${CURL} -o "${CACHE_DIR}/dist/${dist}" "${dist_url}"
    fi
    tar xzf "$CACHE_DIR/dist/${dist}" -C "$location"
    rm -rf "$CACHE_DIR/dist/${dist}"
}
