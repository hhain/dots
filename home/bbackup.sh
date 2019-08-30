#!/bin/sh
REPO=192.168.1.10:/share/Backups/spade/incr
export BORG_PASSPHRASE=$(pass borg_spade)
export BORG_RSH='ssh -p 10022 -l admin'

borg create --verbose \
    --filter AME \
    --list \
    --stats \
    --show-rc \
    --compression zstd,12 \
    --exclude-caches \
    --exclude '/home/*/.cache/*' \
    --exclude '/var/cache/*' \
    --exclude '/var/tmp/*' \
    --exclude '/snapshots/*' \
    --exclude '/swap/*' \
                    \
    $REPO::`date +%Y%m%dT%H%M%S`_`hostname`_'daily' \
    /etc \
    /boot \
    /home \
    /root \
    /var \
    /srv \
