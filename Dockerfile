FROM internetsystemsconsortium/bind9:9.21@sha256:e6ba256146041cae3ef7452b3841d676c6409e4f6300c3e9f59070f63f57d38c

RUN apk add --no-cache curl coreutils

# renovate: datasource=custom.k8s depName=kubectl
ENV KUBECTL_VERSION=v1.34.2

RUN curl -LO "https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl" && \
    curl -LO "https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl.sha256"

RUN echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check - && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    rm kubectl.sha256
