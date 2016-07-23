#!/bin/bash

#
# Simple build script
#

#install build tools
sudo yum -y install rpm-build rpmdevtools yum-utils mock
sudo yum -y groupinstall "Development Tools" 
sudo yum install -y epel-release

rpmdev-setuptree

cd ~/rpmbuild/SRPMS/ 

# install erlang
curl -OL http://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/e/erlang-18.3.4.1-1.fc25.src.rpm

rpm -ivh erlang-18.3.4.1-1.fc25.src.rpm 

sudo yum-builddep -y ~/rpmbuild/SRPMS/erlang-18.3.4.1-1.fc25.src.rpm

rpmbuild -ba ~/rpmbuild/SPECS/erlang-18.3.4.1-1.fc25.src.rpm
sudo yum localinstall -y ~/rpmbuild/RPMS/*/erlang*

# build elixir rpm
rpmbuild -ba ~/rpmbuild/SPECS/elixir.spec
