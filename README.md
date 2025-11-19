# MPING

## About

MPing is a short and sweet Python program that visualises the latency and loss of ICMP echo requests (ping) to a target host or IP address. It displays a live terminal-based graph using Unicode block characters or optional ASCII symbols, and includes colour-coded output, jitter calculation, and optional audible alerts.

It’s ideal for quick diagnostics of network quality, WAN latency shifts, or visual uptime monitoring.

---

## Features

- Live horizontal latency graph using Unicode block symbols or simple ASCII.
- **Colour-coded output (in Unicode mode):**
  - 🟩 Green – latency OK (below threshold)
  - 🟨 Yellow – slow (above threshold)
  - 🔴 Red – timeout (packet loss)
- **ASCII fallback mode:**
  - `_` – latency OK
  - `-` – slow (above threshold)
  - `~` – timeout
- Live metrics display:
  - Latest latency (`ms`)
  - Jitter between samples (`ms`)
  - Total packet loss percentage (`%`)
- Automatically scales latency bar based on initial pings, or manual override.
- Audible terminal bell on success (optional).
- Terminal-width aware, clean one-line display.
- Platform detection for **Linux** and **macOS** `ping` compatibility.

---

## Example Output


