#!/bin/bash

curl -s 'https://wttr.in/?format=%t\n' | sed 's/+//g'
