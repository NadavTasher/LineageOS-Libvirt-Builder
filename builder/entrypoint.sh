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

# Setup build target
breakfast virtio_x86_64

# Start build
m espimage-install

# Create ISO file
m isoimage-install