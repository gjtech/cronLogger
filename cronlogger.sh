#!/bin/bash
#
# cronLogger.sh: Function to send custom logs to syslog
#
# Usage:
#		cronLogger "Message that I want to send to syslog"

function cronLogger()
{
	[ -z "$1" ] && exit 0
	cronMessage="$1"

	tty -s
	crontask=$?

	[ $crontask -gt 0 ] && /usr/bin/logger -i -p cron.info -t CRON "${cronMessage}"
	return
}
