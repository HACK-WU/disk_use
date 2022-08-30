#!/bin/bash
########################################
# Author:hackwu
# time:2022年08月30日 星期二 23时23分23秒
# filename:disk_usage.sh
# Script description:
########################################
#这是一个用于检测linux磁盘使用率的情况，并进行报警的程序。
#默认磁盘使用率大于等于90 就发生报警。抱紧的方式使用邮件发送。

set -u                  #使用未定义的变量将会发生报错
disk_use=$(df -Th|grep "/$"|awk '{print $6}'|cut -d "%" -f1)    #获取disk的使用率
default_monitor=90
if [ $disk_use -gt $default_monitor ];then
	   python send_email.py   				 #执行脚本，发出邮件
fi


