# Guía de contribución — VOCES UNIDAS

## Estructura del monorepo

```
VOCES-UNIDAS/
├── apps/
│   ├── server/     # Backend Go (API + SQLite + WebSocket)
│   ├── pwa/        # Frontend Svelte (PWA offline-first)
│   └── landing/    # Landing page estática
├── packages/
│   └── proto/      # Definición protobuf compartida
├── nixpacks.toml   # Configuración de build para Railway
└── railway.json    # Configuración de deploy para Railway
```

---

## Remotes de Git

Este proyecto tiene **dos remotes** y ambos deben recibir push en cada cambio:

| Remote | URL | Propósito |
|--------|-----|-----------|
| `origin` | `https://github.com/W1ndl0ve/VOCES-UNIDAS.git` | Repo principal del equipo |
| `fork` | `https://github.com/Edavi11/VOCES-UNIDAS.git` | Fork conectado a Railway |

### Verificar que los remotes están configurados

```powershell
git remote -v
```

Si falta el remote `fork`, agrégalo:

```powershell
git remote add fork https://github.com/Edavi11/VOCES-UNIDAS.git
```

---

## Flujo de trabajo obligatorio

### 1. Trabajar siempre en la rama `erick`

```powershell
git checkout erick
```

### 2. Hacer los cambios y commit

```powershell
git add <archivos>
git commit -m "descripción del cambio"
```

### 3. Push a AMBOS remotes — sin excepción

```powershell
git push origin erick        # repo del equipo
git push fork erick:main     # Railway redeploya automáticamente
```

> **Importante:** Railway escucha la rama `main` del fork `Edavi11/VOCES-UNIDAS`.
> Si solo haces push a `origin`, Railway NO redeploya.

---

## Cambios en la PWA (Svelte)

Después de modificar cualquier archivo en `apps/pwa/src/`, hay que recompilar antes del push:

```powershell
cd apps/pwa
npm run build
cd ../..
git add apps/server/static/app/
git commit -m "build: actualizar PWA compilada"
git push origin erick
git push fork erick:main
```

El build de la PWA va a `apps/server/static/app/` — que es lo que el servidor Go embebe y sirve en `/app/`.

---

## Cambios en el servidor Go

Después de modificar archivos en `apps/server/`, Railway recompila Go automáticamente en el deploy. No necesitas compilar localmente antes del push.

Para probar localmente:

```powershell
cd apps/server
$env:DEV="1"; go run .
```

El servidor queda en `http://localhost:8080`. No usar `Ctrl+C` hasta terminar las pruebas.

---

## Variables de entorno en Railway

| Variable | Valor | Descripción |
|----------|-------|-------------|
| `PORT` | (Railway lo setea automáticamente) | Puerto del servidor |
| `DB_PATH` | `/tmp/voces_unidas.db` (default) | Ruta de la base de datos SQLite |

> **Nota:** La base de datos en `/tmp` se borra con cada redeploy. Es aceptable para el hackathon. Para producción real, migrar a Postgres.

---

## URLs del proyecto

| Entorno | URL |
|---------|-----|
| Producción | `https://voces-unidas-production.up.railway.app` |
| Landing | `https://voces-unidas-production.up.railway.app/` |
| PWA | `https://voces-unidas-production.up.railway.app/app/` |
| API reportes | `https://voces-unidas-production.up.railway.app/reportes` |
| Sync | `https://voces-unidas-production.up.railway.app/sync` |
| Dev local servidor | `http://localhost:8080` |
| Dev local PWA | `http://localhost:5174` |

---

## Stack tecnológico

| Capa | Tecnología |
|------|------------|
| Backend | Go 1.26 + GORM + SQLite (glebarez/sqlite, sin CGO) |
| Frontend | Svelte 5 + Vite 5 + vite-plugin-pwa |
| Mesh P2P | Yjs + y-webrtc + WebRTC |
| DB local PWA | IndexedDB (idb) |
| Deploy | Railway (nixpacks) |
| Comunicación | JSON REST + WebSocket |
