#
# This is a POSIX shell fragment
#
# Note: `START', `GROUP' and `MAXFD' options are not recognized by systemd.
# Please change those settings in the corresponding systemd unit file.

# Configuration file
CONFFILE="$HOME/shadowsocks-libev/config.json"

# Extra command line arguments
DAEMON_ARGS=

# User and group to run the server as
USER=nobody
GROUP=nogroup

# Number of maximum file descriptors
MAXFD=32768