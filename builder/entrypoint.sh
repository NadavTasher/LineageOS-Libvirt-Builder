#!/bin/bash

# Exit on failure
set -e

# Trace commands
set -x

# Update the path
export PATH="$HOME/platform-tools:$PATH"

# Clone the manifest
repo init -u https://github.com/LineageOS/android.git -b ${LINEAGEOS_VERSION:-lineage-22.0} --git-lfs --no-clone-bundle

# Sync all changes
repo sync

# Setup build environment
source build/envsetup.sh

# Check root directory
croot

# Variables for build
export AB_OTA_UPDATER=false

# Build for arm64
breakfast virtio_arm64only
m espimage-install

# Build for x86_64
breakfast virtio_x86_64
m espimage-install
m isoimage-install