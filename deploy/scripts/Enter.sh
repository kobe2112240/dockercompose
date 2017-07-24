#!/bin/bash
docker inspect --format='PID: {{.State.Pid}}     NAME:{{.Name}}' `docker ps -a -q` | sed 's%/% %g' |   column -t
read -p "请输入你要进入的docker容器名字 " aa
PID=$(docker inspect --format "{{.State.Pid}}"  $aa)
nsenter --target $PID --mount --uts --ipc --net --pid
