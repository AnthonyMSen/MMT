#!/bin/sh
set -e
sed -i '/ALLOWED_HOSTS/d' /MMT/MeidaManageTool/settings.py
sed -i '/EMAIL_USE_SSL/d' /MMT/MeidaManageTool/settings.py
sed -i '/EMAIL_HOST/d' /MMT/MeidaManageTool/settings.py
sed -i '/EMAIL_PORT/d' /MMT/MeidaManageTool/settings.py
sed -i '/SITE_URL/d' /MMT/MeidaManageTool/settings.py
echo "ALLOWED_HOSTS = ${ALLOWED_HOSTS}" >> /MMT/MeidaManageTool/settings.py
echo "EMAIL_USE_SSL = ${EMAIL_USE_SSL}" >> /MMT/MeidaManageTool/settings.py
echo "EMAIL_HOST = ${EMAIL_HOST}" >> /MMT/MeidaManageTool/settings.py
echo "EMAIL_PORT = ${EMAIL_PORT}" >> /MMT/MeidaManageTool/settings.py
echo "EMAIL_HOST_USER = ${EMAIL_HOST_USER}" >> /MMT/MeidaManageTool/settings.py
echo "EMAIL_HOST_PASSWORD = ${EMAIL_HOST_PASSWORD}" >> /MMT/MeidaManageTool/settings.py
echo "SITE_URL = ${SITE_URL}" >> /MMT/MeidaManageTool/settings.py

python3 -u /MMT/manage.py runserver ${LOCAL_IP}:${WEB_PORT}
