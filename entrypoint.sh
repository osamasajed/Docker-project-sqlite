#!/bin/sh
set -e
rm -f /home/app/tmp/pids/server.pid
rails server -b 0.0.0.0
