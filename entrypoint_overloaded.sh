#!/bin/bash

source /usr/sbin/startup.sh

export LD_LIBRARY_PATH=$ORACLE_HOME/lib



cd /app

# Let's execute the command
sh -c "$*"
