#!/bin/bash
#搜索引擎安装路径
path="/usr/local/search"

#搜索引擎新建项目名称
project_name="engile"

#搜索引擎分词配置文件
managed_schema="$path/7.5.0/server/solr/$project_name/conf"

#读取solr分词配置文件内容并写入配置文件
solr=$(cat ./text_ik.txt)
db=$(cat ./mysql.txt)
#安装好的初始化分词配置文件
solr_conf=$(cat $managed_schema/managed-schema)

#安装好的初始化数据库配置文件
db_conf=$(cat $managed_schema/solrconfig.xml)

#判断是否已配置分词文件
if [[ $solr_conf == *$solr* ]]
then
    result="包含"
else
    result="不包含"
fi
if [[ $result == "包含" ]]
then
    echo "分词已配置"
else
    gsed -i '117 r text_ik.txt' $managed_schema/managed-schema
    echo "分词配置写入完成"
fi

if [[ $db_conf == *$db* ]]
then
    res="数据库配置已完成"
else
    res="数据库配置未完成"
fi
if [[ $res=="数据库配置已完成" ]]
then
    echo "数据库已配置"
else
    gsed -i '85 r mysql.txt' $managed_schema/solrconfig.xml
    echo "数据库配置已写入"
fi
