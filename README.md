# HP Smart Array RAID controller monitoring extension

## Check:
- controller, cache, battery health
- logical volumes health
- physical drives health and temperature
- auto-discovery and agentd-side send data procedure

## Installation notes:
1. You can run install.sh or 

   A. Add the [`zabbix.smartarray`](zabbix.smartarray) cron job into `/etc/cron.d`
   B. Install the [`hp-raid-smart-array.conf`](hp-raid-smart-array.conf) Zabbix user
      parameters into your Zabbix agent's
      [`Include`](https://www.zabbix.com/documentation/3.0/manual/appendix/config/zabbix_agentd)
      directory (usually `/etc/zabbix/zabbix_agentd.d`).
   C. Copy the content of the scripts directory to `/usr/local/bin/`
   D. Make sure the scripts are executable `chmod 755 /usr/local/bin/hp-raid-*`
   E. Import the [`hp-smart-array-template.xml`](hp-smart-array-template.xml) into
      your Zabbix server.
5. Add the template to your host (or stack template)
6. Check if new data arrives


## Tested on:
- HP Smart Array P410
- HP Smart Array P222

- cache and battery may NOT shows on P410;
- some drives models may not show temperature (Seagate).
