#!/bin/sh

mkdir /MMT
cp -r $GITHUB_WORKSPACE/ /MMT
cd /MMT

rm -r .git .github .idea
rm clean_code.sh db.sqlite3
cd /MMT/comment/migrations && rm -v !("__init__.py")
cd /MMT/myadmin/migrations && rm -v !("__init__.py")
cd /MMT/users/migrations && rm -v !("__init__.py")
cd /MMT/video/migrations && rm -v !("__init__.py")

sed -i '/ALLOWED_HOSTS/d' /MMT/MeidaManageTool/settings.py
sed -i '/EMAIL_USE_SSL/d' /MMT/MeidaManageTool/settings.py
sed -i '/EMAIL_HOST/d' /MMT/MeidaManageTool/settings.py
sed -i '/EMAIL_PORT/d' /MMT/MeidaManageTool/settings.py
