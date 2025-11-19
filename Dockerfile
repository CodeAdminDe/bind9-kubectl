FROM internetsystemsconsortium/bind9:9.21@sha256:1666e4a826d04dc6b057c3176ffaad5911eacabc077aa8d0611150d747433d21

RUN apk add --no-cache curl coreutils

# renovate: datasource=custom.k8s depName=kubectl
ENV KUBECTL_VERSION=v1.34.2

RUN curl -LO "https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl" && \
    curl -LO "https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl.sha256"

RUN echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check - && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    rm kubectl.sha256
