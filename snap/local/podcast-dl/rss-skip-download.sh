#!/bin/bash

if [[ "$#" -ne 1 ]]; then
   echo "Usage: $0 URL"
   exit 1
fi

"$SNAP"/podcast-dl/rss-dl.conf.d/rss-dl.module SKIP "$1"
