# MPing Toolkit — Lightweight Terminal Latency Visualisation Tools

The MPing Toolkit provides two complementary tools for network engineers and operators:

- mping — A lightweight, single-host, terminal-friendly ping visualiser with Unicode bar graphs.
- mping-multi — A curses-based, multi-host latency dashboard with colour-coded graphs, averages, loss tracking, and terminal-width scaling.

Both tools are designed for operational use inside NOCs, remote consoles, and over SSH sessions where clarity and minimal CPU overhead matter.

---------------------------------------------------------------------

## Overview of Tools

### mping
A minimal single-host visualiser similar to classic ping, but with a clean live graph rendered on one line using Unicode blocks or ASCII on request.

Key Features:
- Real-time Unicode block graphs representing instantaneous latency.
- Optional audible alert on timeouts or high latency.
- Extremely low CPU use; ideal for tmux/SSH.
- ASCII fallback mode (--ascii) for restricted terminals.
- Adjustable graph scaling (--max).
- Works on Linux and macOS.

---------------------------------------------------------------------

### mping-multi
An ncurses multi-host monitoring dashboard showing loss, latency, jitter-like movement, and bar graphs for each host.

Key Features:
- Concurrent monitoring of any number of hosts.
- Blocks mode (latency-scaled bar graphs) and dots mode.
- Moving-average blocks (default: last 5 RTTs).
- Colour coding:
  - Green = normal
  - Yellow = slow (>= threshold)
  - Red = packet loss
- Automatic scaling for 80-column and wider terminals.
- Optional forced layout width (--cols N, --tty80).
- macOS & Linux ping format support.

---------------------------------------------------------------------

## Installation

Clone the repository:

git clone https://github.com/mattaperkins/MPing
cd MPing

Install:

sudo make install

---------------------------------------------------------------------

## mping Usage

mping [options] host

Common Options:
  --ascii       Use ASCII instead of Unicode blocks
  --bell        Audible bell on timeouts / high latency
  --max N       Override maximum graph scale (ms)
  --interval N  Probe interval in ms
  --no-resolve  Skip DNS hostname lookups

Example:

mping --bell --max 150 8.8.8.8

Example Output:

8.3 ms ███░░░░░░░░░░░░░░░░
7.9 ms ███░░░░░░░░░░░░░░░░
9.1 ms ████░░░░░░░░░░░░░░░
~ timeout

---------------------------------------------------------------------

## mping-multi Usage

mping-multi [options] host1 host2 ...

Common Options:
  --blocks                 Start in blocks mode (default)
  --dots                   Start in dots mode
  --blocks-mode {avg,last} Use moving avg or last RTT
  --blocks-avg N           Ring buffer size (default 5)
  --max-lat-ms N           RTT mapped to full bar width (default 120 ms)
  --interval-ms N          Probe interval per host
  --timeout N              Per-probe timeout (seconds)
  --cols N                 Force a specific terminal width
  --tty80                  Shorthand for --cols 80

Keyboard Shortcuts:
  q   Quit
  s   Toggle blocks/dots
  +   Increase bar width
  -   Decrease bar width
  r   Reset statistics

Examples:

mping-multi 1.1.1.1 8.8.8.8 9.9.9.9

mping-multi --tty80 1.1.1.1 8.8.8.8

mping-multi --cols 120 1.1.1.1 8.8.8.8 9.9.9.9

Example Output (80 columns):

Host             Sent   Recv  Loss%   Last    Avg    Min    Max  Bar
---------------------------------------------------------------------------
gateway           234    234    0.0    3.2    3.4    2.8    4.1  ███░░░░░░░░░░░░░░░░░
google.com        239    239    0.0   21.5   22.1   20.7   24.3  ████████░░░░░░░░░░░░
cloudflare        239    239    0.0    1.9    2.0    1.7    2.4  ██░░░░░░░░░░░░░░░░░░

---------------------------------------------------------------------

## Requirements

- Python 3.7+
- Standard system ping
- macOS or Linux
- curses module (included on both)

---------------------------------------------------------------------

## License

Both mping and mping-multi are released under the GPLv3.  
Copyright © Matt Perkins.

---------------------------------------------------------------------

## Related Tools

- Classic ping(8)
- Smokeping (concept inspiration for latency visualisation)
