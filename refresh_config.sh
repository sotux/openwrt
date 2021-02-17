#!/bin/sh

refresh_conf()
{
	echo "refresh config for $1"
	cd env
	git checkout "$1"
	git fetch origin
	git reset --hard "origin/$1"
	cd -
	make menuconfig
	cd env
	git commit -a -s -m "config: refresh" 
	git push --force-with-lease
	cd -
}

refresh_conf "ac58u-19.07"
refresh_conf "cm520-19.07"
refresh_conf "newifi3-19.07"
refresh_conf "tl-wr841nv10-ath79-19.07"
refresh_conf "tl-wr841nv7-ath79-19.07"
refresh_conf "tl-wr841nv8-ath79-19.07"
refresh_conf "wndr3700v4-ar71xx-19.07"
refresh_conf "wndr3800-ath79-19.07"
refresh_conf "wndr4300v1-ar71xx-19.07"
refresh_conf "wr1200js-19.07"
refresh_conf "x86-19.07"
