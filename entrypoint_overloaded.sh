#!/bin/bash

source /usr/sbin/startup.sh

cd /app

# Let's execute the command
sh -c "$*"
