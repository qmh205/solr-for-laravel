#!/bin/bash

project_name=${1}
url=${2}
echo ${project_name}

##解压路径
path=${url}
echo $path
##压缩包名字
name="solr.tar"

##从压缩里解压后的名字
aname="7.5.0"

if [ ! -e $path ]; then
echo "不存在"$path"路径，自动创建"
sudo mkdir $path

sleep 1

fi

##解压solr压缩包到指定路径下
time1=$(date)
echo ${time1}
tar -zxvf $name -C $path
echo "解压完毕"
sleep 2

##安装路径

apath= $path$aname

if [ -e $apath ]; then
echo "存在将要安装的路径，准备移除"
rm -rf $apath
sleep 2
echo "移除完毕"

fi

mkdir $apath

echo "拷贝文件到新的安装路径"$apath

##拷贝example下的所有文件到安装路径下

cp -a $path$aname'/example/'* $apath

echo "拷贝contrib文件"$path

cp -a $path$aname'/libexec/contrib' $path

sleep 2

echo "拷贝dist文件到"$path"下"

sleep 2

cp -a $path$aname'/libexec/dist' $path

echo "安装完成"

echo "修改日志文件写入权限"

chmod -R 777 $path$aname'/server/logs'

echo "开始启动solr服务"

cd $path$aname

bin/solr restart -force

## solr服务启动成功  用solr命令生成要造的项目工程

echo "开始创建索引项目"

cd $path$aname

bin/solr create -c ${project_name} -force
exit 8

