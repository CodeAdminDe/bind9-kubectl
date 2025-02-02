FROM bitnami/kubectl:1.32.1 AS builder

# Stage 2: Final Stage
FROM internetsystemsconsortium/bind9:9.21

# Kopiere kubectl aus dem Builder-Image
COPY --from=builder /usr/local/bin/kubectl /usr/local/bin/kubectl

# Setze die Berechtigungen, falls erforderlich
RUN chmod +x /usr/local/bin/kubectl
