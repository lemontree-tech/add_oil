# 加油 (Add Oil)

A Flutter app that shows a daily Chinese quote (古典文學) based on device signature and date. Each device gets a consistent quote per day, but different devices see different quotes.

## How It Works

1. App collects device information (device ID)
2. Hashes `deviceId + date` to get a quote index
3. Displays the quote from local assets
4. Same device + same day = same quote
5. Different devices = different quotes

## Project Structure

```
godsWordForTheDay/
├── client/              # Flutter app
│   ├── lib/
│   │   ├── models/      # Data models (Quote)
│   │   ├── services/    # Business logic (Device, Quote)
│   │   ├── screens/     # UI screens
│   │   └── widgets/      # UI widgets
│   └── assets/           # Bundled quotes
│
└── docs/                # GitHub Pages website
```

## Setup

### Client (Flutter)

```bash
cd client
flutter pub get
flutter run
```

**Before running:**
1. Add your quotes to `assets/quotes.json`

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

- ✅ Deterministic quote selection (same device = same quote per day)
- ✅ Fully offline (quotes bundled in app)
- ✅ Beautiful UI with lucky level display
- ✅ Traditional Chinese interface

## License

Proprietary - All Rights Reserved. See LICENSE file for details.

