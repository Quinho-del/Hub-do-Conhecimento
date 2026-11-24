# Deploy na Vercel com Supabase

O projeto fica dividido em dois projetos Vercel:

- `back`: API Express serverless.
- `front`: aplicação React/Vite.

## 1. Supabase

1. Crie um projeto no Supabase.
2. No SQL Editor, execute `supabase/schema.sql`.
3. Opcionalmente execute `supabase/seed.sql` para inserir questões de exemplo.
4. Em **Settings > Database > Connection string**, copie a URI do modo Session.

## 2. Projeto backend

Na Vercel, importe o repositório e configure **Root Directory** como `back`.

Adicione estas variáveis em **Settings > Environment Variables** para Production:

```text
DATABASE_URL=postgresql://postgres.<project-ref>:SENHA@aws-0-REGION.pooler.supabase.com:5432/postgres
DB_SSL=true
JWT_SECRET=um-segredo-longo-e-aleatorio
AUTH_USER=admin@seudominio.com
AUTH_PASSWORD=uma-senha-forte
NODE_ENV=production
```

Faça o deploy e copie a URL gerada, por exemplo `https://hub-api.vercel.app`.
Teste `https://hub-api.vercel.app/health` antes de configurar o frontend.

## 3. Projeto frontend

Crie outro projeto Vercel usando o mesmo repositório e configure **Root Directory** como `front`.

Adicione, em Production, a variável:

```text
VITE_API_URL=https://hub-api.vercel.app
```

O comando de build é `npm run build` e o diretório de saída é `dist`.

Depois do deploy, abra o frontend, faça login com `AUTH_USER` e `AUTH_PASSWORD` e teste a lista de questões.

## Desenvolvimento local

No backend, copie `back/.env.example` para `back/.env` e preencha a `DATABASE_URL` do Supabase. No frontend, deixe `VITE_API_URL` vazio para usar o proxy local do Vite.

```powershell
cd back
npm install
npm start

# em outro terminal
cd front
npm install
npm run dev
```

Nunca publique `back/.env` nem coloque `DATABASE_URL`, `JWT_SECRET` ou `AUTH_PASSWORD` no frontend.

## Render (API)

Se a API for hospedada no Render, crie um **Web Service** apontando para este repositório e use:

- **Root Directory:** `back`
- **Build Command:** `npm install`
- **Start Command:** `npm start`
- **Health Check Path:** `/health/db`

Em **Environment**, adicione `DATABASE_URL`, `DB_SSL=true`, `JWT_SECRET`, `AUTH_USER`, `AUTH_PASSWORD` e `NODE_ENV=production`. Para o Render, use a URI do Supabase em **Connect > Session pooler**, normalmente com a porta `5432`. Não use a URI de exemplo sem substituir a senha real.

Depois do deploy, teste:

```text
https://sua-api.onrender.com/health
https://sua-api.onrender.com/health/db
```

O segundo endpoint deve retornar `{"status":"ok","database":"connected"}`.
