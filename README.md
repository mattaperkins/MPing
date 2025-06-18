# MPING

## About

MPing is a short and sweet Python program that visualises the latency and loss of ICMP echo requests (ping) to a target host or IP address. It displays a live terminal-based graph using Unicode block characters, and includes colour-coded output, jitter calculation, and optional audible alerts.

It’s ideal for quick diagnostics of network quality, WAN latency shifts, or visual uptime monitoring.

---

## Features

- Live horizontal latency graph using Unicode block symbols.
- **Colour-coded output:**
  - 🟩 Green – latency OK (below threshold)
  - 🟨 Yellow – slow (above threshold)
  - 🔴 Red – timeout (packet loss)
- **Live metrics display**:
  - Latest latency (`ms`)
  - Jitter between samples (`ms`)
  - Total packet loss percentage (`%`)
- Automatically scales latency bar based on initial pings.
- Audible terminal bell (can be disabled with `-s`).
- Clean one-line display, terminal width aware.
- Works on Linux and macOS terminals (with `ping`).

---

## Example Output

```
▁▃▅▅▆▇█▇▇▆▅▃▁▁▁▁▁▁▁▁ timeout  jitter: 15.2ms  loss: 18%
```

Each block character represents a ping. Timeouts repeat the last good symbol in red.

---

## Usage

```bash
python3 mping [options] <host_or_ip>
```

### Options:

| Option           | Description                         |
| ---------------- | ----------------------------------- |
| `-h`, `--help`   | Show help and usage information     |
| `-s`, `--silent` | Suppress terminal bell on each ping |

### Examples:

```bash
# Ping Google's DNS with sound
python3 mping 8.8.8.8

# Silent mode
python3 mping -s 1.1.1.1
```

---

## Dependencies

- Python 3.6+
- `ping` command available (default on Unix-like systems)
- Works best in terminals supporting:
  - ANSI colour escape codes
  - Unicode block drawing characters
  - A monospace font

---

## Notes

- Designed for simplicity and terminal legibility.
- Not intended to replace tools like `mtr` or `smokeping`, but to provide an at-a-glance real-time visual.
- Will gracefully handle DNS errors and pings that timeout.

---

## Future Ideas

- CSV logging mode
- IPv6 support

---

## License

GNU GENERAL PUBLIC LICENSE

---

Written by Matt Perkins, 2025.
