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
	git commit --amend --no-edit -a
	git push --force-with-lease
	cp .config ../../actions-openwrt/"${1%-master}".config
	cd -
}

refresh_conf "cm520-master"
refresh_conf "ac58u-master"
refresh_conf "newifi3-master"
refresh_conf "wr1200js-master"
