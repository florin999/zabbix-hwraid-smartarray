#!/bin/bash
read -p "Type the hostname: " SERVER
read -p "what port? " PORT
if [[ $1 == "remove" ]]; then
	ssh -p${PORT} $SERVER -t "rm -rf /etc/cron.d/zabbix.smartarray /etc/zabbix/zabbix_agentd.d/hp-raid-smart-array.conf /usr/local/bin/hp-raid-*"
else
scp -P${PORT} zabbix.smartarray ${SERVER}:/etc/cron.d/
scp -P${PORT} hp-raid-smart-array.conf ${SERVER}:/etc/zabbix/zabbix_agentd.d/
scp -P${PORT} scripts/* ${SERVER}:/usr/local/bin/
ssh -p${PORT} $SERVER -t "chmod 755 /usr/local/bin/hp-raid-* 
chmod 744 /etc/cron.d/zabbix.smartarray 
chmod 644 /etc/zabbix/zabbix_agentd.d/hp-raid-smart-array.conf 
/usr/local/bin/hp-raid-data-processor.sh 
service zabbix-agent stop && service zabbix-agent start"
fi