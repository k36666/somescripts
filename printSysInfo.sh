#!/bin/bash
while true
do
cpu_us=`vmstat | awk '{print $13}' | sed -n '$p'`
cpu_sy=`vmstat | awk '{print $14}' | sed -n '$p'`
cpu_id=`vmstat | awk '{print $15}' | sed -n '$p'`
sys_in=`vmstat | awk '{print $9}' | sed -n '$p'`
sys_out=`vmstat | awk '{print $10}' | sed -n '$p'`
mem_total=`cat /proc/meminfo | grep 'MemTotal' | awk -n '{printf $2}'`
mem_free=`vmstat | awk '{print $4}' | sed -n '$p'`
#mem_free_rat=`echo "sclae=2; $mem_free/$mem_total" | bc`
cpu_sum=$(($cpu_us+$cpu_sy))

#mysql <<EOF
#use test1;
#update sys_inf_test set sys_in ='$sys_in',sys_out='$sys_out',mem_total='$mem_total',mem_free='$mem_free',cpu_sum='$cpu_sum' where id='1';
#select * from sys_inf_test;
#EOF
#helloworld
echo "-----------------------------------"
echo "系统input块数" $sys_in
echo "系统output块数" $sys_out
echo "内存总大小为" $mem_total
echo "内存空闲大小" $mem_free
#echo "内存使用率为" $mem_free_rat
echo "cpu使用率为" $cpu_sum
echo "-----------------------------------"
sleep 1
done

