import { VercelRequest, VercelResponse } from '@vercel/node';

export interface Quote {
  id: number;
  text: string;
  source: string;
  luckyLevel: number; // 1-5
}

export interface QuotePool {
  version: string;
  quotes: Quote[];
}

export interface DeviceInfo {
  deviceId: string;
  platform: string;
  deviceModel: string;
  osVersion: string;
  appVersion: string;
  screenWidth: number;
  screenHeight: number;
  manufacturer: string;
  timezone: string;
  locale: string;
}

export interface AnalyticsEvent {
  deviceInfo: DeviceInfo;
  deviceHash: string;
  date: string;
  quoteIndex: number;
  luckyLevel: number;
  timestamp: string;
}

export interface VersionResponse {
  version: string;
  lastUpdated: string;
}

export type ApiHandler = (req: VercelRequest, res: VercelResponse) => Promise<void>;

