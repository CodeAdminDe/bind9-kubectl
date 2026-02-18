FROM internetsystemsconsortium/bind9:9.21@sha256:a9ab53184e456a0227daefade02fc9fca811908a851310a570d49b4e726f7765

RUN apk add --no-cache curl coreutils

# renovate: datasource=custom.k8s depName=kubectl
ENV KUBECTL_VERSION=v1.35.1

RUN curl -LO "https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl" && \
    curl -LO "https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl.sha256"

RUN echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check - && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    rm kubectl.sha256
