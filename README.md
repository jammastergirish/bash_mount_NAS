# Bash script to mount NAS

The idea came from [this Arq support blog](https://www.arqbackup.com/blog/nas-backup/) after I realized Arq hadn't backed up two external drives connected to my NAS overnight because they'd unmounted.

This script now runs:

- Before Arq begins a backup.
- Via a Mac Automator application which I have on my dock.

It can also be set to run regularly via some sort of cronjob.
