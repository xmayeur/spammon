#! /bin/sh
# /etc/init.d/SpamMon.sh
#
### BEGIN INIT INFO
# Provides:          Monitor spam from mailbox
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: script to monitor spams using imap
# Description:       Added  13 nov 2016
### END INIT INFO
# Some things that run always
touch /var/lock/SpamMon

# Carry out specific functions when asked to by the system
case "$1" in
  start)
    echo "Starting script Spam monitoring "
    cd /home/pi/SpamMon
    /usr/bin/python /home/pi/SpamMon/SpamMon.py joelle &
    ;;
  stop)
    echo "Stopping script Spam monitoring"
    pkill -f SpamMon.py
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  install)
    cp $0 /etc/init.d
    cd /etc/init.d
    update-rc.d $0 defaults
    $0 start
    ;;
  remove)
    cd /etc/init.d
    $0 stop
    update-rd.d -f $0 remove
    rm $0
    ;;
  *)
    echo "Usage: /etc/init.d/SpamMon.sh {start|stop|restart}"
    exit 1
    ;;
esac

exit 0
