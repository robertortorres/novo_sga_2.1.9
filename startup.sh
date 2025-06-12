#!/bin/bash

# Nome do arquivo docker-compose
COMPOSE_FILE="docker-compose.yml"

# Verifica se o docker está instalado
if ! command -v docker &> /dev/null; then
    echo "❌ Docker não está instalado. Instale antes de continuar."
    exit 1
fi

# Verifica se o docker compose está disponível
if ! docker compose version &> /dev/null; then
    echo "❌ Docker Compose (plugin) não está disponível. Verifique sua instalação."
    exit 1
fi

echo "✅ Iniciando os serviços com ${COMPOSE_FILE}..."
docker compose -f "$COMPOSE_FILE" up -d

echo "✅ Todos os serviços foram iniciados com sucesso!"
echo ""
echo "🌐 Acesse os serviços em:"
echo "  - Novo SGA        => http://SEU_IP"
echo "  - File Browser    => http://SEU_IP:8081"
echo "  - phpMyAdmin      => http://SEU_IP:8082"
echo "  - Painel Senhas   => http://SEU_IP:8083"
echo "  - Triagem         => http://SEU_IP:8084"
