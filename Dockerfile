FROM alpine:latest

# Instalar socat e bind-tools (para DNS)
RUN apk add --no-cache socat bind-tools

# Variáveis de ambiente para o destino
ENV TARGET_HOST=suabase_db_host
ENV TARGET_PORT=5432
ENV LISTEN_PORT=5432

# Script de entrada
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
