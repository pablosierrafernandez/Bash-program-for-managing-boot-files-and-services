#!/bin/sh
# AUTOR: PABLO SIERRA VERSION: 1.0
#--------------------------------------------
# backuplog.sh
#--------------------------------------------
#############################################
# Script para crear un backup de la carpeta
# /var/log
#############################################
# Help
Help()
{
echo "FUNCIÓN: Script para crear un backup de la carpeta /var/log"
echo "OPCIONES: {start|stop} "
echo "PARÁMETROS: NONE "
}
case "$1" in
start)
echo "Iniciando servicio... "
# sino existe el directorio, lo creamos
if ! [ -d "/back/logs" ]
then
sudo mkdir /back
sudo chmod 740 /back
sudo mkdir /back/logs
sudo chmod 740 /back/logs
fi
name=`date +%y%m%d%H%M`
tar -zcvf /back/logs/$name.tgz /var/log
logger `date` "BACKUP LOGS - FILE SIZE: " `du -sh /back/logs/$name.tgz`
;;
stop)
echo "Deteniendo servicio..."
# Aquí comando a ejecutar para detener el servicio
pkill backuplog.sh
;;
*)
# input de ayuda, help, definición...
Help()
echo "Modo de empleo: /etc/init.d/backuplog.sh {start|stop}"
exit 1
;;
esac
exit 0
