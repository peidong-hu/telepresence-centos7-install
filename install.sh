#!/bin/bash
set -ex

yum update -y

# install python3.6
yum -y install yum-utils
yum -y groupinstall development
yum -y install https://centos7.iuscommunity.org/ius-release.rpm
yum -y install python36u
#echo "`python3.6 -v` installed."
# python 3.6 installed

# install system dependencies
yum install -y git torsocks sshfs conntrack
git clone https://github.com/datawire/telepresence.git && cd telepresence

# force the install to use python3.6
sed -i "s/python3/python3.6/" install.sh
env PREFIX=/usr/local ./install.sh
echo "Telepresence `telepresence --version` installed!"
