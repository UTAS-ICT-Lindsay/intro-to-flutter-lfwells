# Start from the base image
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install system dependencies, then clean up
RUN sudo apt-get -o Acquire::ForceIPv4=true update && \
    sudo apt-get install -y --no-install-recommends \
    -o Acquire::ForceIPv4=true \
    git curl unzip cmake ninja-build build-essential clang pkg-config libgtk-3-dev git-lfs \
    && sudo rm -rf /var/lib/apt/lists/*

# Clone and configure Flutter SDK
RUN git clone https://github.com/flutter/flutter.git --depth 1 --branch stable /opt/flutter
ENV PATH="/opt/flutter/bin:${PATH}"
RUN flutter precache --web --linux
RUN sudo chown -R vscode /opt/flutter

# Switch to the non-root 'vscode' user
USER vscode

# Set the working directory to where your project will live
WORKDIR /workspaces/intro_to_flutter

# --- MODIFICATION START ---
# Copy pubspec from the parent directory (the project root)
COPY --chown=vscode ../pubspec.yaml .
# --- MODIFICATION END ---

RUN flutter pub get

# --- MODIFICATION START ---
# Copy the entire project (the parent directory) into the workdir
COPY --chown=vscode .. .
# --- MODIFICATION END ---