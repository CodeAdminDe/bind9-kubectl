FROM internetsystemsconsortium/bind9:9.21

RUN apk add --no-cache curl coreutils

# renovate: datasource=custom.k8s packageName=kubectl
ENV KUBECTL_VERSION=v1.33.1

RUN curl -LO "https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl" && \
    curl -LO "https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl.sha256"

RUN echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check - && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    rm kubectl.sha256
