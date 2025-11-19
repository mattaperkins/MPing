.TH MPING 1 "18 June 2025" "Version 1.02" "MPing Manual"

.SH NAME
mping \- terminal-based visual ping utility with jitter and loss display

.SH SYNOPSIS
.B mping
[\fB-s\fR|\fB--silent\fR]
[\fB--max \fIms\fR]
[\fB--ascii\fR]
[\fB-h\fR|\fB--help\fR]
[\fB-v\fR|\fB--version\fR]
\fIhost_or_ip\fR

.SH DESCRIPTION
\fBMPing\fR is a terminal-based ping visualiser that sends ICMP echo requests to a host and displays the result using a horizontally scrolling graph.

Each ping is shown using coloured Unicode blocks (or ASCII characters) and annotated with jitter and packet loss statistics in real time.

MPing is intended to provide a clear, at-a-glance view of network quality in an xterm or console environment.

.SH OPTIONS
.TP
\fB-h\fR, \fB--help\fR
Show usage and help information.

.TP
\fB-s\fR, \fB--silent\fR
Suppress the terminal bell. By default, a bell sounds after each successful ping.

.TP
\fB-v\fR, \fB--version\fR
Show the program version and exit.

.TP
\fB--max \fIms\fR
Override automatic scale detection and use a fixed maximum latency (in milliseconds) for block height scaling.

.TP
\fB--ascii\fR
Use ASCII characters instead of Unicode blocks:
.RS
.TP
\fB_\fR - latency OK
.TP
\fB-\fR - latency slow (over max threshold)
.TP
\fB~\fR - timeout or unreachable
.RE

.SH OUTPUT
Each line updates once per second and includes:
.RS
.IP \[bu] 2
Visual bar of blocks (or ASCII characters) representing the last N pings
.IP \[bu]
Current latency (ms)
.IP \[bu]
Jitter (difference between last 2 RTTs)
.IP \[bu]
Packet loss percentage since start
.RE

Example output:
.EX
▁▃▅▅▆▇█▇▇▆▅▃▁▁▁▁▁▁▁▁ timeout  jitter: 15.2ms  loss: 18%
.EE

.SH PLATFORM SUPPORT
MPing automatically selects the appropriate ping command based on the platform:

.TP
\fBLinux\fR
ping -c 1 -W 1

.TP
\fBmacOS\fR
ping -c 1 -t 1

.SH LICENSE
MPing is licensed under the GNU General Public License version 3.
See: https://www.gnu.org/licenses/gpl-3.0.html

.SH AUTHOR
Written by Matt Perkins, 2025.

