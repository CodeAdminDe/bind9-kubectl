FROM internetsystemsconsortium/bind9:9.21

RUN apk add --no-cache curl coreutils

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

RUN echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check - && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

RUN rm kubectl.sha256
