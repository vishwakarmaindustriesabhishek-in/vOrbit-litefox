#!/usr/bin/env bash

set -e

fetch_and_extract() {
    rm -rf version source_release
    wget -q -O version "https://codeberg.org/vorbit/source/raw/branch/main/version"
    wget -q -O source_release "https://codeberg.org/vorbit/source/raw/branch/main/release"
    
    rm -f "vorbit-$(cat version)-$(cat source_release).source.tar.gz"
    wget -O "vorbit-$(cat version)-$(cat source_release).source.tar.gz" "https://codeberg.org/api/packages/vorbit/generic/vorbit-source/$(cat version)-$(cat source_release)/vorbit-$(cat version)-$(cat source_release).source.tar.gz"
    
    rm -rf vorbit-$(cat version)
    tar xf vorbit-$(cat version)-$(cat source_release).source.tar.gz

    # here would be a great spot to insert system dependent stuff like mozconfig/patches.
}

build() {
    cd vorbit-$(cat version)
      ./mach build
      ./mach package
    cd ..
}

artifacts() {
    # ... Here we do system dependent stuff like builing rpm's, setup.exe or other formats we distribute in
}

build_all() {
    fetch_and_extract
    build
    artifacts
}

build_all
