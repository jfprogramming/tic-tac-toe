#!/bin/sh
# /etc/init.d/tictactoe
#
# chkconfig: 345 99 10
# description: tic-tac-toe

case "$1" in
    start)
        echo "Starting TicTacToe..."
        /application/TicTacToe &
        ;;
    stop)
        echo "Stopping TicTacToe..."
        # Command to stop your application
        ;;
    restart)
        $0 stop
        $0 start
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
        ;;
esac

exit 0
