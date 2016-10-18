#!/bin/sh

#INTERFACE=wlp3s0
#
##old rx and tx counts
#RXB='cat /sys/class/net/$INTERFACE/statistics/rx_bytes'
#TXB='cat /sys/class/net/$INTERFACE/statistics/tx_bytes'
#
#getNet(){
#
#	RXBN='cat /sys/class/net/$INTERFACE/statistics/rx_bytes'
#	TXBN='cat /sys/class/net/$INTERFACE/statistics/tx_bytes'
#
#	RXR='echo '
#	RXR=`echo "($RXBN - $RXB) / 1024 / $SLEEP" | xargs printf "%.2f"`
#	TXR=`echo "($TXBN - $TXB) / 1024 / $SLEEP" | xargs printf "%.2f"`
#	echo -ne "up : $RXR kB/s down : $TXR kB/s "
#
#}
##| bc -l 

space(){
	echo ' | '
}
getDate(){

	date '+%m-%d  %H:%M ' #print current date
}

getBat(){
	BATC=/sys/class/power_supply/BAT0/capacity
	BATS=/sys/class/power_supply/BAT0/status

	echo -n "BAT: "
	test "`cat $BATS`" = "Charging" && echo -n '+' || echo -n '-'
	sed -n p $BATC
}
xsetroot -name "$(getBat)$(space)$(getDate)"
