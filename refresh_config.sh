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

refresh_conf "ac58u-21.02"
refresh_conf "cm520-21.02"
refresh_conf "newifi3-21.02"
refresh_conf "wr1200js-21.02"
refresh_conf "k2p-21.02"
refresh_conf "wndr3800-21.02"
refresh_conf "wndr3700v4-21.02"
refresh_conf "wndr4300v1-21.02"
refresh_conf "x86-21.02"
