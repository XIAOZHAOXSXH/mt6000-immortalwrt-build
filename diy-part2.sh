#!/bin/bash
# 描述: 更新 feeds 后的自定义脚本

# 示例：修改默认后台 IP 为 192.168.10.1
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 示例：修改主机名
sed -i 's/ImmortalWrt/GL-MT6000/g' package/base-files/files/bin/config_generate