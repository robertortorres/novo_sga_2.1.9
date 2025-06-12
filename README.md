
# 📦 Novo SGA + Serviços Web (Docker Compose)

Este ambiente contém múltiplos serviços integrados via Docker Compose para facilitar a implantação do sistema **Novo SGA**, com acesso administrativo, painel de senhas, triagem, gerenciamento de arquivos e banco de dados.

---

## ▶️ Como subir os serviços

```bash
sudo docker compose up -d
```
Acessar o banco de dados MySQL como root:
```bash
docker-compose exec mysqldb sh -c  'mysql -uroot -p'
```
Dar permissão de acesso para o usuário da aplicação:
```bash
GRANT ALL ON novosga2.* TO 'novosga'@'%' IDENTIFIED BY 'MySQL_App_P4ssW0rd';
quit
```
---

## 🌐 Serviços disponíveis

| Serviço         | URL                     | Descrição |
|----------------|--------------------------|-----------|
| Novo SGA       | http://SEU_IP            | Interface principal do sistema |
| File Browser   | http://SEU_IP:8081       | Gerenciador de arquivos web |
| phpMyAdmin     | http://SEU_IP:8082       | Interface para administração do banco MySQL |
| Painel de Senhas | http://SEU_IP:8083     | Painel de visualização de chamadas de senhas |
| Triagem        | http://SEU_IP:8084       | Interface de triagem para atendimento |

Substitua `SEU_IP` pelo IP ou domínio do seu servidor.

---

## 🔐 Acesso ao MySQL

- **Host**: `mysqldb` (resolução interna no Docker)
- **Porta**: `3306`
- **Usuário**: `root`
- **Senha**: `MySQL_r00t_P4ssW0rd`

---

## 💾 Volumes persistentes

- `painel-data` → Dados persistentes do painel de senhas (`/app/data`)
- `triage-data` → Dados persistentes da triagem (`/app/data`)

---

## 🛠️ Manutenção

### Ver crontab no container do Novo SGA:

```bash
docker exec -it novosga crontab -l
```

### Adicionar automaticamente o job de reset:

```bash
./add_novosga_cron.sh
```

---

## 📁 Estrutura sugerida

```plaintext
.
├── docker-compose.yml
├── add_novosga_cron.sh
└── README.md
```

---
