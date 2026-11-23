# Documentação Técnica — Hub do Conhecimento

## 1. Arquitetura

```
[ Mobile Expo ] ──HTTPS──┐
                         ├──► [ Domínio próprio / Vercel ]
[ Browser Web ] ──HTTPS──┘           │
                                     ├── Frontend (React/Vite)
                                     └── API (Express) ──► Supabase (PostgreSQL)
```

- Autenticação: JWT emitido em `/auth/login` (credenciais em variáveis de ambiente).
- Questões: tabelas `questao`, `topico`, `vestibular`, `resposta` no Supabase.
- Frontend e Mobile consomem a **mesma API de produção**.

## 2. Modelagem (compatível com o código original)

```
topico (idt, nome, descricao)
vestibular (idv, nome, ano)
resposta (idr, resposta_correta, explicacao)
questao (idq, enunciado, referencias, nivel_de_dificuldade,
         idtopico → topico, vestibular → vestibular, idresposta → resposta)
```

Arquivo: `supabase/schema.sql`.

## 3. Endpoints

Ver README.md (tabela completa).

## 4. Variáveis de ambiente (back)

| Variável | Uso |
|----------|-----|
| `DATABASE_URL` | Connection string Supabase (preferencial) |
| `DB_SSL` | `true` em produção |
| `JWT_SECRET` | Assinatura do token |
| `AUTH_USER` / `AUTH_PASSWORD` | Login administrativo |
| `PORT` | Porta local (padrão 3000) |

## 5. Deploy

1. **Supabase** — criar projeto, rodar schema + seed, copiar URI.
2. **Vercel (API)** — root `back`, env vars, domínio ou subdomínio.
3. **Vercel (Web)** — root `front`, rewrites para a API, domínio personalizado + DNS.
4. **Mobile** — `API_URL` apontando para o domínio de produção; Expo Go ou build APK.

## 6. Execução local

```bash
# Terminal 1
cd back && cp .env.example .env && npm i && npm start

# Terminal 2
cd front && npm i && npm run dev
```

## 7. Grupo

Alexandre · Giovanna Pires · Pablo Neres · Marcos · Leide
