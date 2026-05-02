#!/bin/bash

echo 'Running health audit...'
./health_audit.sh

echo 'Running metrics'
./check.sh

tail -f /dev/null
