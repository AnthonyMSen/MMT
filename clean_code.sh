#!/bin/sh

mkdir /MMT
cp -r $GITHUB_WORKSPACE/ /MMT
cd /MMT

rm -r .git .github .idea
rm clean_code.sh db.sqlite3

cp $GITHUB_WORKSPACE/users/migrations/0002_initial.py /MMT/users/migrations/0002_initial.py

sed -i '/ALLOWED_HOSTS/d' /MMT/MeidaManageTool/settings.py
sed -i '/EMAIL_USE_SSL/d' /MMT/MeidaManageTool/settings.py
sed -i '/EMAIL_HOST/d' /MMT/MeidaManageTool/settings.py
sed -i '/EMAIL_PORT/d' /MMT/MeidaManageTool/settings.py
