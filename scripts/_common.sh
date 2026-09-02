#!/bin/bash

# Common helpers and package-wide variables.
app_root="${install_dir:-/var/www/$app}"
build_dir="$app_root/dist"

build_armada() {
    pushd "$app_root" >/dev/null
    npm ci --ignore-scripts

    VITE_APP_NAME="$app_name" \
    VITE_APP_RELAYS="$app_relays" \
    VITE_SEARCH_RELAYS="$search_relays" \
    VITE_PLATFORM_RELAYS="$platform_relays" \
    npm run build
    popd >/dev/null
    chown -R www-data: "$app_root"
}
