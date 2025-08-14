FROM ubuntu:22.04

# Never get prompts during installations
ENV DEBIAN_FRONTEND=noninteractive

# Install required dependencies for Android platform-tools
RUN apt update && \
	apt install -y git git-lfs wget unzip && \
	rm -r /var/lib/apt/lists

# Install Android platform-tools
RUN wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip && \
	unzip platform-tools-latest-linux.zip -d . && \
	rm platform-tools-latest-linux.zip

# Install Google repo tool
RUN wget https://storage.googleapis.com/git-repo-downloads/repo -O /usr/local/bin/repo && \
	chmod a+x /usr/local/bin/repo

# Configure git options
RUN	git config --global user.name "Root" && \
	git config --global user.email "root@localhost" && \
	git config --global color.ui false && \
	git config --global trailer.changeid.key "Change-Id"

# Install git lfs
RUN git lfs install

# Install build dependencies
RUN apt update && \
	apt install -y bc bison ninja-build build-essential ccache curl flex g++-multilib gcc-multilib gnupg gperf imagemagick protobuf-compiler python3-protobuf lib32readline-dev lib32z1-dev libdw-dev libelf-dev lz4 libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev glslang-tools python3-mako python-is-python3 python3-yaml openjdk-11-jdk python3-pip && \
	pip3 install meson==1.8.3 --no-cache-dir && \
	rm -r /var/lib/apt/lists

# Copy the entrypoint script
COPY entrypoint.sh /root/entrypoint.sh

# Enter build directory
WORKDIR /root/android/lineage

# Change the command of the container
CMD [ "/root/entrypoint.sh" ]