#!/bin/bash

mv cadvisor-v0.47.0-linux-amd64 cadvisor

chmod +x cadvisor

exec "$@"