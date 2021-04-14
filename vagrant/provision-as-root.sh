#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive
echo "####################"
echo "provision-as-root.sh"
echo "####################"
echo "Update APT."
apt-get install software-properties-common > /dev/null
apt-add-repository --yes --update ppa:ansible/ansible > /dev/null
apt-get -qq update > /dev/null
echo "Install packages."
apt-get install git -qq > /dev/null
apt-get install ansible --yes  > /dev/null
apt-get install python3-pip --yes > /dev/null
echo "Upgrade APT."
apt-get -qq full-upgrade > /dev/null
apt-get install ansible --yes