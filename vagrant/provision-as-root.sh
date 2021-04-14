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
# echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCbkfvbaqAAinP1Vy9HPvVUCfhv8f3DURN1vhpeQNYzBDwKr5X0Y6PNqxOKbc2lbfy8/ShvlY22dJwX5odweQFMTZApG//h1K1/mOGH2rlV3jyP+S1C49VIgEY/LHupjSzfuOM6k7I5DK513WBMEOmMYUu0BPoTu6PW/qf+EPtKYHxsIZC0EwWrF+C1LoUtF02CH1mjYRT1TdaB26D8iMgreP/nTj/gbCOfsK6OpJSBYv5HYWkhTpfwbHr4zk6lBRWABe0n0Cvo/Q7p8TQVgUNNfQvTQ3IcRlt9QixftL2n9mR36dogKwsZcFWYjIJ3mraXetAhIFLT8Grgbn1mRpC4o5+2eWxVFRT+BEJKFgBYcBt5f81kpUS7/eE5gmWzzx1jN6O/2Ip2AC4FidE5Ve51YcgISlO6SRt69PeCZPdKgrrmtbQHzEwW1X1mcMcFBvY3184xS4bMbSVYfiOTGhpJKt02ZbeZyCZA52+xE2hl8UpQDV2kHAtI7S5IIV/wz0M7X8kRf8TknOCD8Tc759TtpSgzTnQwApTf9G78bj4wpwboxSE8N4mav+D3U1+ASFrxuOXDqyD6quO52RrEolhrPQIRBqAPn61j8nG1S5IwDdd+eCfWsXbS1bXWG+mI2vHpiUD1jlRvBx4hS8OJQOIrDuX5+Kat09EHV9rdJqn/iQ== 6f:c9:7f:2d:9b:20:9b:02:02:ad:c5:4c:22:6b:fd:00" >> ~/.ssh/authorized_keys