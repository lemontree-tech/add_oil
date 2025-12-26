# Architecture Design

## Overview

A Flutter app that displays a daily Chinese quote based on device signature + date. Works fully offline with quotes bundled in the app.

## Core Concept

- **Input**: Device signature + Date (YYYY-MM-DD)
- **Process**: Hash → Index (0-364) → Select quote
- **Output**: Same device + same day = same quote

## Components

### 1. Models
- `Quote` - Quote data (text, source, luckyLevel)
- `QuotePool` - Collection of 365 quotes
- `DeviceInfo` - Device characteristics

### 2. Services
- `DeviceService` - Collect device info, generate UUID
- `QuoteService` - Load quotes, select quote, cache
- `HashUtils` - Hash calculation for quote selection

### 3. UI
- `HomeScreen` - Display quote

### 4. Storage
- SharedPreferences - Local quote pool + cache
- Assets - Bundled quotes (fallback)

## Data Flow

```
App Launch
  ↓
Get Device Info
  ↓
Load Quote Pool (local → assets)
  ↓
Get Today's Quote
  ├─ Check cache → Return if found
  └─ Calculate hash → Select quote → Cache
  ↓
Display Quote
```

## Quote Selection Logic

```
deviceSignature + date
  ↓
SHA-256 Hash
  ↓
First 8 hex chars → Integer
  ↓
% 365 → Index (0-364)
  ↓
quotes[index]
```

## Storage Structure

- `quote_pool` - Full quote pool JSON
- `cached_quote` - Today's quote
- `cached_date` - Today's date string

## Notes

- App works fully offline
- All quotes are bundled in assets
- No network connectivity required

