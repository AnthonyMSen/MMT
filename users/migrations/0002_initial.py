# Generated by Django 3.1.7

from django.db import migrations


def forwards_func(apps, schema_editor):
    users = apps.get_model("users", "User")
    db_alias = schema_editor.connection.alias
    users.objects.using(db_alias).bulk_create([
        users(id=1, password="pbkdf2_sha256$216000$gxekadovNizH$yM5QAeUZrxdUOzfrYO97OMMDUF/V7SeDU78BXTof4J0=",
              is_superuser=1, username="admin", first_name="", last_name="", email="",
              is_staff=1, is_active=1, avatar="", subscribe=0),
    ])


def reverse_func(apps, schema_editor):
    users = apps.get_model("users", "User")
    db_alias = schema_editor.connection.alias
    users.objects.using(db_alias).filter(id=1).filter(username="admin").delete()


class Migration(migrations.Migration):
    dependencies = [
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.RunPython(forwards_func, reverse_func),
    ]
