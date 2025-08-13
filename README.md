# LineageOS Builder

Think of this as a modern alternative to Android x86.

This project aims to streamline the build process of LineageOS virtio_x86_64 images.

This repository implements the guide provided by LineageOS [here](https://wiki.lineageos.org/libvirt-qemu) using Docker.

## Usage

Use `make image` to build the Docker build container image.

Use `make build` to initiate a build using the built Docker image.

You can provide the following parameters:

-   `LINEAGEOS_VERSION` - Branch of lineage to use, defaults to `lineage-22.0`
-   `BUILD_DIRECTORY` - Directory to mount into the container to store the build state, defaults to `./build`

### Example usage

```bash
make build BUILD_DIRECTORY=/home/user/Documents/Lineage
```
