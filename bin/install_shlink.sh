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
    
    # local dist_url="https://github.com/shlinkio/shlink/archive/refs/tags/${version}.tar.gz"
    local dist_url="https://github.com/shlinkio/shlink/releases/download/${version}/shlink${version}_php8.1_dist.zip"
    echo "${dist_url}"
    if [ -f "${CACHE_DIR}/dist/${dist}" ]; then
        echo "File is already downloaded"
    else
        ${CURL} -o "${CACHE_DIR}/dist/${dist}" "${dist_url}"
    fi
    #tar xzf "$CACHE_DIR/dist/${dist}" -C "$location"
    unzip "$CACHE_DIR/dist/${dist}" -d "$location"
    rm -rf "$CACHE_DIR/dist/${dist}"
}
