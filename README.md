# elixir-rpm

To build Elixir rpm for CentOS.

## Build rpm

1. Prepare Any New CentOS 7 environment
2. do build.sh

## rpm is available

The rpm made with this repository is available in copr.
You can use like below.
```bash
$ curl -O https://copr.fedorainfracloud.org/coprs/ynishi/elixir/repo/epel-7/ynishi-elixir-epel-7.repo
$ sudo mv ynishi-elixir-epel-7.repo /etc/yum.repos.d/. 

# suitable version of erlang is in same repo
$ sudo yum install elixir
$ iex -v
```
And you can use Phoenix.
```
$ mix local.hex
$ mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
$ mix phoenix.new web --no-branch --no-exto
```
