#!/bin/bash

# 下载 name.txt 文件
curl -O https://raw.githubusercontent.com/Minusbill/analog/main/name.txt

# 下载 docker_run.sh 文件
curl -O https://raw.githubusercontent.com/Minusbill/analog/main/docker_run.sh

# 赋予 docker_run.sh 可执行权限
chmod +x docker_run.sh

# 执行 docker_run.sh
./docker_run.sh

