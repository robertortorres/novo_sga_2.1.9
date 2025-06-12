#!/bin/bash

CONTAINER_NAME="sga-novosga-1"
CRON_JOB='@daily /usr/local/bin/php /var/www/html/bin/console novosga:reset > /var/log/novosga-reset.log 2>&1'

# Verifica se o container está rodando
if ! docker ps --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
  echo "❌ Container '${CONTAINER_NAME}' não está rodando."
  exit 1
fi

# Verifica se o cronjob já existe
EXISTS=$(docker exec "$CONTAINER_NAME" crontab -l 2>/dev/null | grep -F "$CRON_JOB")

if [ -n "$EXISTS" ]; then
  echo "✅ Cron job já está configurado no container '${CONTAINER_NAME}'."
else
  # Adiciona a nova entrada no crontab
  docker exec "$CONTAINER_NAME" sh -c "crontab -l 2>/dev/null; echo '$CRON_JOB'" | docker exec -i "$CONTAINER_NAME" crontab -
  echo "✅ Cron job adicionado com sucesso ao container '${CONTAINER_NAME}'."
fi
