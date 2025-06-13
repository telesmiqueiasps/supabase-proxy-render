#!/bin/sh

# Resolva o domínio sempre que subir
TARGET_IP=$(getent hosts $TARGET_HOST | awk '{ print $1 }')

echo "Iniciando socat: escutando na porta ${LISTEN_PORT}, redirecionando para ${TARGET_HOST}:${TARGET_PORT} (${TARGET_IP})"

# Iniciar o socat
exec socat TCP-LISTEN:${LISTEN_PORT},fork,reuseaddr TCP:${TARGET_HOST}:${TARGET_PORT}
