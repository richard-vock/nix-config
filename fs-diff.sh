#!/usr/bin/env bash
# fs-diff.sh
set -euo pipefail

if ! `mount | grep -q "[/]mnt"`; then
    sudo mkdir /mnt
    sudo mount -o subvol=/ /dev/mapper/root /mnt
fi

OLD_TRANSID=$(sudo btrfs subvolume find-new /mnt/root-blank 9999999)
OLD_TRANSID=${OLD_TRANSID#transid marker was }

> /tmp/fs-diff.current.txt
sudo btrfs subvolume find-new "/mnt/root" "$OLD_TRANSID" |
sed '$d' |
cut -f17- -d' ' |
sort |
uniq |
while read path; do
  path="/$path"
  if [ -L "$path" ]; then
    : # The path is a symbolic link, so is probably handled by NixOS already
  elif [ -d "$path" ]; then
    : # The path is a directory, ignore
  else
    echo "$path" >> /tmp/fs-diff.current.txt
  fi
done

grep -v "^\s*[#]" blacklist.txt > /tmp/fs-diff.blacklist.txt

comm -13 /tmp/fs-diff.{blacklist,current}.txt
