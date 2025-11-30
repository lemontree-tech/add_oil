# Gods Word For The Day - Serverless Backend

Serverless backend built with Vercel Functions using TypeScript.

## Setup

1. Install dependencies:
```bash
npm install
```

2. Type check (optional):
```bash
npm run type-check
```

3. Deploy to Vercel:
```bash
vercel
```

Or use Vercel CLI for local development:
```bash
vercel dev
```

## TypeScript

This project uses TypeScript. All API endpoints are in `api/*.ts` and type definitions are in `types/index.ts`.

## API Endpoints

### GET /api/quotes
Returns the full quote pool (365 quotes).

### GET /api/version
Returns the current quote version.

### POST /api/analytics
Logs analytics events. Currently just logs to console. In production, integrate with a database.

## Environment Variables

None required for MVP. For production analytics, you may want to add:
- Database connection strings
- API keys for analytics services

## Notes

- Update `data/quotes.json` with your 365 quotes
- Analytics currently just logs to console. Integrate with a database for production use.

