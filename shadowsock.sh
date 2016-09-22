#!/bin/bash
nohup sslocal -s 23.106.158.90 -p 443  -l 1080 -k 密码 -t 600 -m aes-256-cfb >/dev/null 2>&1 &
