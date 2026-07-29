# Semi Decoupling Dashboard

Real-time monitoring dashboard for the AI compute chain decoupling pattern.

**Core thesis**: When NVDA holds while storage/equipment crashes, it's a buy signal for compute names — the AI compute thesis is intact, it's a cycle rotation.

## Features

- **Decoupling Score**: 0-10 scale measuring NVDA vs SOXX divergence
- **Pattern Detection**: Automatically identifies decoupling, rotation, and crash regimes
- **Storage/Equipment/Compute Group Tracking**: Tracks all major semi names
- **PCE Day Reaction Tracker**: Scenario-based live tracker for PCE release day

## How to Use

1. Open `index.html` in any browser (no server needed)
2. Data is embedded from last market close
3. For live data, run the builder script (requires Python + yfinance)

## Dashboard Assets

| Asset | Description |
|-------|-------------|
| `index.html` | Semi Decoupling Dashboard — main tool |
| `pce-day-tracker.html` | PCE Day Reaction Tracker — for PCE release days |

## Data Sources

- Market data: yfinance (Python)
- Search: DuckDuckGo (requests fallback)
- LLM: Groq, Gemini

## License

MIT — free to use, modify, share
