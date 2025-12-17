FROM internetsystemsconsortium/bind9:9.21@sha256:9f5e90c4f522920d921498acc75cd8b00288f6e0f084910bb3be5387d43e7981

RUN apk add --no-cache curl coreutils

# renovate: datasource=custom.k8s depName=kubectl
ENV KUBECTL_VERSION=v1.34.3

RUN curl -LO "https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl" && \
    curl -LO "https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl.sha256"

RUN echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check - && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    rm kubectl.sha256
