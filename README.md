# Gods Word For The Day

A Flutter app that shows a daily Chinese quote (古典文學) based on device signature and date. Each device gets a consistent quote per day, but different devices see different quotes.

## Architecture

- **Client**: Flutter app (`client/`)
- **Server**: Vercel serverless functions (`server/`)

## How It Works

1. App collects device information (platform, model, OS version, etc.)
2. Generates a stable device signature
3. Hashes `deviceSignature + date` to get a quote index (0-364)
4. Displays the quote with lucky level (1-5 stars)
5. Same device + same day = same quote
6. Different devices = different quotes

## Project Structure

```
godsWordForTheDay/
├── client/              # Flutter app
│   ├── lib/
│   │   ├── models/      # Data models (Quote, DeviceInfo)
│   │   ├── services/    # Business logic (Device, Quote, Sync, Analytics)
│   │   ├── screens/     # UI screens
│   │   └── utils/        # Utilities (hashing)
│   └── assets/           # Bundled quotes (fallback)
│
└── server/              # Vercel serverless backend
    ├── api/             # API endpoints
    │   ├── quotes.js    # GET /api/quotes
    │   ├── version.js   # GET /api/version
    │   └── analytics.js # POST /api/analytics
    └── data/             # Quote pool (365 quotes)
```

## Setup

### Client (Flutter)

```bash
cd client
flutter pub get
flutter run
```

**Before running:**
1. Update `lib/main.dart` with your Vercel deployment URL
2. Add your 365 quotes to `assets/quotes.json`

### Server (Vercel)

```bash
cd server
npm install
vercel dev    # Local development
vercel        # Deploy to production
```

**Before deploying:**
1. Add your 365 quotes to `data/quotes.json`
2. Deploy to Vercel and update the API URL in the Flutter app

## Adding Quotes

The quote format is:

```json
{
  "id": 0,
  "text": "天將降大任於斯人也...",
  "source": "孟子·告子下",
  "luckyLevel": 5
}
```

- `id`: 0-364 (365 quotes total)
- `text`: The quote text in Traditional Chinese
- `source`: Source attribution (e.g., "孟子·告子下")
- `luckyLevel`: 1-5 (displayed as stars)

## Features

- ✅ Device fingerprinting (for future bot detection)
- ✅ Deterministic quote selection (same device = same quote per day)
- ✅ Offline support (quotes cached locally)
- ✅ Quote sync (downloads updates from server)
- ✅ Analytics (device info + usage tracking)
- ✅ Beautiful UI with lucky level display

## Future Enhancements

- [ ] Bot detection and rate limiting
- [ ] Request signing for API security
- [ ] Database integration for analytics
- [ ] Share functionality
- [ ] Push notifications for daily quotes

## License

MIT

