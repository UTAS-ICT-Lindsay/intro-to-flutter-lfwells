# Start from the base image
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install dependencies, including git-lfs, then clean up
RUN sudo apt-get -o Acquire::ForceIPv4=true update && \
    sudo apt-get install -y --no-install-recommends \
    -o Acquire::ForceIPv4=true \
    git \
    curl \
    unzip \
    cmake \
    ninja-build \
    build-essential \
    clang \
    pkg-config \
    libgtk-3-dev \
    git-lfs \
    && sudo rm -rf /var/lib/apt/lists/*

# Clone Flutter
RUN git clone https://github.com/flutter/flutter.git --depth 1 --branch stable /opt/flutter

# Set up the PATH for all users
ENV PATH="/opt/flutter/bin:${PATH}"

# Change ownership of the flutter directory to the 'vscode' user
RUN sudo chown -R vscode /opt/flutter