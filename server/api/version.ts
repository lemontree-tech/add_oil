import { VercelRequest, VercelResponse } from '@vercel/node';
import quotesData from '../data/quotes.json';
import { QuotePool, VersionResponse } from '../types';

const quotePool = quotesData as QuotePool;

export default async function handler(
  req: VercelRequest,
  res: VercelResponse
): Promise<void> {
  // Enable CORS
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    res.status(200).end();
    return;
  }

  if (req.method !== 'GET') {
    res.status(405).json({ error: 'Method not allowed' });
    return;
  }

  try {
    const response: VersionResponse = {
      version: quotePool.version,
      lastUpdated: new Date().toISOString(),
    };
    res.status(200).json(response);
  } catch (error) {
    console.error('Error fetching version:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
}

