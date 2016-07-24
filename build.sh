#!/bin/bash

#
# Simple build script
#

#install build tools
sudo yum -y install rpm-build rpmdevtools yum-utils mock
sudo yum -y groupinstall "Development Tools" 
sudo yum install -y epel-release

rpmdev-setuptree

cp SPECS/*.spec ~/rpmbuild/SPECS/

cd ~/rpmbuild/SRPMS/ 

# install erlang
curl -OL http://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/e/erlang-18.3.4.1-1.fc25.src.rpm

sudo yum-builddep -y ~/rpmbuild/SRPMS/erlang-18.3.4.1-1.fc25.src.rpm

curl -OL https://github.com/erlang/otp/archive/OTP-18.3.4/otp-OTP-18.3.4.1.tar.gz
mv otp-OTP-18.3.4.1.tar.gz ~/rpmbuild/SOURCE
rpmbuild -ba ~/rpmbuild/SPECS/erlang.spec
sudo yum localinstall -y ~/rpmbuild/RPMS/*/erlang*

# build elixir rpm
curl -OL https://github.com/elixir-lang/elixir/archive/v1.3.1/elixir-1.3.1.tar.gz
mv elixir-1.3.1.tar.gz ~/rpmbuild/SOURCE
rpmbuild -ba ~/rpmbuild/SPECS/elixir.spec
