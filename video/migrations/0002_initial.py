# Generated by Django 3.1.7

from django.db import migrations


def forwards_func(apps, schema_editor):
    classification = apps.get_model("video", "Classification")
    db_alias = schema_editor.connection.alias
    classification.objects.using(db_alias).bulk_create([
        classification(id=1, title="动漫", status=1),
        classification(id=2, title="游戏", status=1),
        classification(id=3, title="时尚", status=1),
        classification(id=4, title="音乐", status=1),
        classification(id=5, title="科技", status=1),
        classification(id=6, title="数码", status=1),
        classification(id=7, title="知识", status=1),
        classification(id=8, title="萌宠", status=1),
        classification(id=9, title="美食", status=1),
        classification(id=10, title="明星", status=1),
        classification(id=11, title="舞蹈", status=1),
        classification(id=12, title="生活", status=1),
        classification(id=13, title="综艺", status=1),
        classification(id=14, title="电影", status=1),
        classification(id=15, title="曲艺", status=1),
        classification(id=16, title="体育", status=1),
    ])


def reverse_func(apps, schema_editor):
    classification = apps.get_model("video", "Classification")
    db_alias = schema_editor.connection.alias
    for i in range(1, 17):
        classification.objects.using(db_alias).filter(id=i).delete()


class Migration(migrations.Migration):
    dependencies = [
        ('video', '0001_initial'),
    ]

    operations = [
        migrations.RunPython(forwards_func, reverse_func),
    ]