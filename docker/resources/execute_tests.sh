#!/usr/bin/env bash
set +x
set -e
export LC_ALL=en_US
export LANG="$LC_ALL"
export DISPLAY=:2
Xvfb -screen 0 1920x1080x24 :2 &
until xset -q
do
	echo "Waiting for X server to start..."
	sleep 1;
done
ratpoison &

export PYTHONPATH=/usr/lib/python2.x/site-packages
export PYTHONHOME=/usr
export PYTHONIOENCODING=utf-8

robot -d robot/output -x xunit -v BROWSER:$1 project/tests/$2
