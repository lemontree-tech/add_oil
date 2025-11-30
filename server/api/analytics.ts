import { VercelRequest, VercelResponse } from '@vercel/node';
import { AnalyticsEvent } from '../types';

/**
 * Simple analytics logging
 * In production, you'd want to use a database or analytics service
 */
export default async function handler(
  req: VercelRequest,
  res: VercelResponse
): Promise<void> {
  // Enable CORS
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    res.status(200).end();
    return;
  }

  if (req.method !== 'POST') {
    res.status(405).json({ error: 'Method not allowed' });
    return;
  }

  try {
    const event = req.body as AnalyticsEvent;

    // Log analytics event
    // In production, store this in a database (e.g., Vercel Postgres, MongoDB, etc.)
    console.log('Analytics event:', JSON.stringify(event, null, 2));

    // For now, just return success
    // TODO: Store in database
    // Example with Vercel Postgres:
    // await db.query(
    //   'INSERT INTO analytics (device_hash, date, quote_index, lucky_level, timestamp, device_info) VALUES ($1, $2, $3, $4, $5, $6)',
    //   [event.deviceHash, event.date, event.quoteIndex, event.luckyLevel, event.timestamp, JSON.stringify(event.deviceInfo)]
    // );

    res.status(200).json({ success: true });
  } catch (error) {
    console.error('Error logging analytics:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
}

