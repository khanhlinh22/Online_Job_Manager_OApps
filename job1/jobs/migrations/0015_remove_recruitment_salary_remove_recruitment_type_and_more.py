# Generated by Django 5.2.1 on 2025-05-21 10:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('jobs', '0014_recruitment_type'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='recruitment',
            name='salary',
        ),
        migrations.RemoveField(
            model_name='recruitment',
            name='type',
        ),
        migrations.AddField(
            model_name='new',
            name='salary',
            field=models.DecimalField(decimal_places=2, default=0, max_digits=12),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='new',
            name='type',
            field=models.CharField(default=0, max_length=100),
            preserve_default=False,
        ),
    ]
