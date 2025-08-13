# Image name to build
IMAGE_NAME ?= lineageos-builder

# LineageOS version to use
LINEAGEOS_VERSION ?= lineage-22.0

# Build directory
BUILD_DIRECTORY ?= $(abspath build)

.PHONY: all
all: build

.PHONY: image
image:
	@docker build builder -t $(IMAGE_NAME)

.PHONY: build
build: image
	@docker run --rm --tty -v "$(BUILD_DIRECTORY):/root/android/lineage" -e "LINEAGEOS_VERSION=$(LINEAGEOS_VERSION)" --hostname localhost $(IMAGE_NAME)
