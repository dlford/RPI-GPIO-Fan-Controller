#! /bin/sh

### BEGIN INIT INFO
# Provides:          fan-controller.sh
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
### END INIT INFO

# Carry out specific functions when asked to by the system
case "$1" in
  start)
    echo "Starting fan-controller.sh"
    /usr/local/bin/fan-controller.sh &
    ;;
  stop)
    echo "Stopping fan-controller.sh"
    pkill -f /usr/local/bin/fan-controller.sh
    ;;
  *)
    echo "Usage: /etc/init.d/fan-control.sh {start|stop}"
    exit 1
    ;;
esac

exit 0
