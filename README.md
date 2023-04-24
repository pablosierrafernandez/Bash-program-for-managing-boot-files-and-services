# Bash-program-for-managing-boot-files-and-services
⏱This Bash script provides a backup mechanism for the /var/log folder, and also includes systemd timers and cron jobs for shutting down the system automatically on Fridays at 10pm.

## Usage

Run the script with the `start` or `stop` parameter to start or stop the backup service respectively.

arduinoCopy code

`/etc/init.d/backuplog.sh {start|stop}` 

## systemd Timer

The following is a systemd timer configuration for shutting down the system on Fridays at 10pm.

systemdCopy code

`[Unit]
Description=Timer for shutdown on Fridays at 22:00

[Timer]
Unit=shutonfri.service
OnCalendar=Mon *-*-* 23:23:00
Persistent=false

[Install]
WantedBy=timers.target 

## Cron Jobs

The following is a sample crontab configuration for shutting down the system at 10pm every Friday.

# /etc/crontab: system-wide crontab

> SHELL=/bin/sh
> PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
> 
> 0 22 * * FRI root shutdown -h now

## Shutdown Service

The following is a systemd service configuration for shutting down the system on Fridays.

    [Unit]
    Description=Automatic shutdown service on Fridays
    Requires=network.target
    After=network.target
    
    [Service]
    Type=simple
    ExecStart=shutdown -h now 

## Script details

The `backuplog.sh` script creates a backup of the `/var/log` folder and stores it in `/back/logs`. If the directory `/back/logs` does not exist, the script creates it with restricted permissions.

The backup file is named using the current date and time, and the script logs the file size using the `logger` command. The `stop` parameter stops the service using the `pkill` command.
