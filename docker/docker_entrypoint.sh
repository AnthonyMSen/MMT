#!/bin/sh
set -e
echo "ALLOWED_HOSTS = ${ALLOWED_HOSTS}" >> /MMT/MeidaManageTool/settings.py
echo "EMAIL_USE_SSL = ${EMAIL_USE_SSL}" >> /MMT/MeidaManageTool/settings.py
echo "EMAIL_HOST = ${EMAIL_HOST}" >> /MMT/MeidaManageTool/settings.py
echo "EMAIL_PORT = ${EMAIL_PORT}" >> /MMT/MeidaManageTool/settings.py
echo "EMAIL_HOST_USER = ${EMAIL_HOST_USER}" >> /MMT/MeidaManageTool/settings.py
echo "EMAIL_HOST_PASSWORD = ${EMAIL_HOST_PASSWORD}" >> /MMT/MeidaManageTool/settings.py

python3 -u /MMT/manage.py runserver ${LOCAL_IP}:${WEB_PORT}
