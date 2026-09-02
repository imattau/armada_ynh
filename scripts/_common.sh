#!/bin/bash

# Common helpers and package-wide variables.
app_root="${install_dir:-/var/www/$app}"
build_dir="$app_root/dist"

build_armada() {
    ynh_script_progression --message="Installing Armada frontend dependencies..." --weight=2
    pushd "$app_root" >/dev/null
    npm ci --ignore-scripts

    ynh_script_progression --message="Building Armada frontend..." --weight=3
    VITE_APP_NAME="$app_name" \
    VITE_APP_RELAYS="$app_relays" \
    VITE_SEARCH_RELAYS="$search_relays" \
    VITE_PLATFORM_RELAYS="$platform_relays" \
    npm run build
    popd >/dev/null
    chown -R www-data: "$app_root"
}
