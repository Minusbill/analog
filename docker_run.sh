#!/bin/bash

# 读取文件中的所有名字到一个数组
names=()
while IFS= read -r line; do
    names+=("$line")
done < name.txt

# 获取名字数组的长度
length=${#names[@]}

# 如果名字数组为空，退出脚本并提示错误
if [ "$length" -eq 0 ]; then
    echo "name.txt 文件为空或不存在。"
    exit 1
fi

# 生成一个随机索引
index=$((RANDOM % length))

# 选择随机名字
node_name=${names[$index]}

echo "选择的节点名称是: ${node_name}"


# 运行 Docker 命令
docker run -d --network="host" --name analog -v /var/lib/analog:/data analoglabs/timechain \
  --base-path /data \
  --rpc-external \
  --unsafe-rpc-external \
  --rpc-cors all \
  --name="${node_name}" \
  --rpc-methods Unsafe

