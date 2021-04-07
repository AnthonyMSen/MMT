#!/bin/sh

mkdir -p ~/.ssh/
echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_rsa

mkdir /MMT

cd ~
git clone git@github.com:AnthonyMSen/MMT.git /MMT

cp -rf $GITHUB_WORKSPACE/* /MMT
rm clean_code.sh db.sqlite3

sed -i '/ALLOWED_HOSTS/d' /MMT/MeidaManageTool/settings.py
sed -i '/EMAIL_USE_SSL/d' /MMT/MeidaManageTool/settings.py
sed -i '/EMAIL_HOST/d' /MMT/MeidaManageTool/settings.py
sed -i '/EMAIL_PORT/d' /MMT/MeidaManageTool/settings.py

git add .
git commit -m "auto-update"
git pull --rebase origin
git push -u origin
