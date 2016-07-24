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
curl -OL http://dl.fedoraproject.org/pub/epel/6/SRPMS/erlang-R14B-04.3.el6.src.rpm
sudo yum-builddep -y --nogpgcheck ~/rpmbuild/SRPMS/erlang-R14B-04.3.el6.src.rpm
rpm -ivh erlang-R14B-04.3.el6.src.rpm

cp SOURCES/*.patch ~/rpmbuild/SOURCES
#cd ~/rpmbuild/SOURCES
#git clone http://pkgs.fedoraproject.org/git/rpms/erlang.git
#cd erlang
#cp otp-*.patch ~/rpmbuild/SOURCES

curl -OL https://github.com/erlang/otp/archive/OTP-18.3.4.1/otp-OTP-18.3.4.1.tar.gz

cp SPECS/*.spec ~/rpmbuild/SPECS/

sudo yum -y install erlang fop libxslt wxGTK3-devel

rpmbuild -ba ~/rpmbuild/SPECS/erlang.spec

sudo yum localinstall -y ~/rpmbuild/RPMS/*/erlang*

# build elixir rpm
curl -OL https://github.com/elixir-lang/elixir/archive/v1.3.1/elixir-1.3.1.tar.gz
mv elixir-1.3.1.tar.gz ~/rpmbuild/SOURCES
rpmbuild -ba ~/rpmbuild/SPECS/elixir.spec
