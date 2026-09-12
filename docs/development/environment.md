# Environment Variables

Configuration is loaded at startup from a `.env` file in the project root via `flutter_dotenv`. `main.dart` calls `dotenv.load(fileName: '.env')` before `runApp`.

Phase 1 has **no secrets**. The file exists so the same load path can hold API keys later without restructuring startup.

## Quick start

```bash
cp .env.example .env
```

## Variable reference

| Variable | Required | Description |
|----------|----------|-------------|
| `APP_NAME` | Yes | Display name (`Slow Journey`) |
| `APP_ENV` | Yes | Environment label (`phase1`) |
| `OFFLINE_ONLY` | Yes | Must stay `true` in Phase 1 |

Do not add DHIS2 or HTTP endpoints in Phase 1. Never commit real secrets if they are added later.
