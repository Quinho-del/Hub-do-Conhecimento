# Hub do Conhecimento (Vestibular+)

**Projeto Final — Curso Técnico em Desenvolvimento de Sistemas**

Evolução do portal de questões de Matemática/Vestibular para arquitetura em produção:

| Pilar | Tecnologia |
|-------|------------|
| Banco de dados em nuvem | **Supabase** (PostgreSQL + RLS) |
| Hospedagem Web + API | **Vercel** (CI/CD + HTTPS) |
| Domínio personalizado | DNS A/CNAME → Vercel |
| App mobile | **React Native (Expo)** consumindo a API de produção |
| Documentação + usabilidade | Pasta `docs/` |

## Estrutura

```
Hub-do-Conhecimento/
├── back/          # API Express (auth + busca de questões)
├── front/         # React (Vite) — interface web
├── mobile/        # React Native (Expo)
├── supabase/      # schema.sql + seed.sql
└── docs/          # Documentação técnica e relatório de usabilidade
```

## 1. Banco de Dados (Supabase)

1. Crie um projeto em [supabase.com](https://supabase.com).
2. SQL Editor → execute `supabase/schema.sql`.
3. (Opcional) Execute `supabase/seed.sql` para dados de exemplo.
4. Em **Settings → Database**, copie a **Connection string (URI)**.
5. Cole em `back/.env` como `DATABASE_URL=...` e `DB_SSL=true`.

> O código mantém compatibilidade com PostgreSQL local (variáveis `DB_USER`, `DB_HOST`, etc.).

## 2. Backend

```bash
cd back
cp .env.example .env   # preencha DATABASE_URL, JWT_SECRET, AUTH_USER, AUTH_PASSWORD
npm install
npm start              # http://localhost:3000
```

Rotas principais:

| Método | Rota | Auth | Descrição |
|--------|------|------|-----------|
| POST | `/auth/login` | Não | Login → JWT |
| GET | `/auth/validate` | Sim | Valida token |
| GET | `/busca` | Sim | Lista todas as questões |
| GET | `/busca/id/:id` | Sim | Por ID |
| GET | `/busca/topicos-lista` | Sim | Lista tópicos |
| GET | `/busca/topicos/:topico` | Sim | Filtra por tópico |
| GET | `/busca/resposta/:id` | Sim | Gabarito + explicação |
| GET | `/health` | Não | Health check |

## 3. Frontend Web

```bash
cd front
npm install
npm run dev            # http://localhost:5173 (proxy → :3000)
```

### Deploy Vercel

1. Conecte o repositório GitHub.
2. Projeto **backend**: root = `back`, env vars do `.env`.
3. Projeto **frontend**: root = `front`, ajuste `vercel.json` com a URL do backend.
4. Domínio personalizado: painel Vercel → Domains → configure DNS no registrador.

## 4. App Mobile

```bash
cd mobile
# Em src/config.js (ou EXPO_PUBLIC_API_URL) coloque a URL de PRODUÇÃO
npm install
npx expo start
```

O app usa as mesmas rotas `/auth/login` e `/busca` do backend em produção.

## 5. Segurança

- **Nunca** commite o arquivo `.env` (já está no `.gitignore`).
- Use `DATABASE_URL` do Supabase com SSL.
- JWT com `JWT_SECRET` forte.
- HTTPS automático na Vercel.

## Grupo

Alexandre · Giovanna Pires · Pablo Neres · Marcos · Leide

## Entregáveis do PDF

- [x] Repositório Web/API documentado  
- [x] Repositório / pasta Mobile documentada  
- [x] Schema e integração Supabase  
- [x] Configuração para Vercel + domínio  
- [x] Documentação técnica (`docs/DOCUMENTACAO_TECNICA.md`)  
- [x] Relatório de testes de usabilidade (`docs/RELATORIO_USABILIDADE.md`)  
