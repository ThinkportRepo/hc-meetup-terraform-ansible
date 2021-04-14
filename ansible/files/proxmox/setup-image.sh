#!/bin/bash
set -o errexit

if [ ! -f /tmp/focal-server-cloudimg-amd64.img ];then
  wget -P /tmp -N https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img
fi

qm create 9001 --name "ubuntu-2004-cloudinit-tpl" --memory 2048 --net0 virtio,bridge=vmbr0

qm importdisk 9001 /tmp/focal-server-cloudimg-amd64.img local-zfs -format qcow2

qm set 9001 --scsihw virtio-scsi-pci --scsi0 local-zfs:vm-9001-disk-0

qm set 9001 --ide2 local-zfs:cloudinit

qm set 9001 --boot c --bootdisk scsi0

qm set 9001 --serial0 socket --vga serial0

qm template 9001