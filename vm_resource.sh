#!/usr/bin/env bash

VMS=$(sudo pcs resource utilization | awk '{print $1 " "}' | grep -v "Resource" | tr -d ':' | tr -d '_' | xargs -n1)

> ~/vm_data.txt

for vm in ${VMS[*]}
do
        SERV_VM=$(sudo pcs resource | grep $vm | awk '{print $4}' | xargs -n1)
		CPU_MEM=$(sudo pcs resource utilization | grep $vm |  awk '{print $2 ";" $3}' | tr -d '=' | tr -d 'cpu' | tr -d 'hv_memory')

 for p in ${CPU_MEM}
 do
        CPU=${p%;*}
        MEM=${p#*;}
        printf "%7s %7s %7s %7s\n"  $vm $CPU $MEM $SERV_VM >> ~/vm_data.txt
 done
done

