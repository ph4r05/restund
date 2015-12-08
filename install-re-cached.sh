#!/bin/sh
set -e
# check to see if RE folder is empty
if [ ! -d "$HOME/re/lib" ]; then
  /bin/rm -rf re-0.4.14.tar.gz re-0.4.14 | echo "Not deleted"
  wget http://www.creytiv.com/pub/re-0.4.14.tar.gz
  tar -xzvf re-0.4.14.tar.gz
  cd re-0.4.14
  sed -i.bu "s#/usr/local#${HOME}/re#g" Makefile
  make info && make && make install
  sed -i.bu "s#LIBRE_PATH := ../re#LIBRE_PATH := $HOME/re#g" $HOME/re/share/re/re.mk
else
  echo 'Using cached directory.';
fi