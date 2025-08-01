ARG BUILD_FROM=ghcr.io/hassio-addons/base:18.0.3
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
ARG BLOCKY_VERSION="v0.26.2"

COPY --from=spx01/blocky:${BLOCKY_VERSION} /app/blocky /app/blocky 
