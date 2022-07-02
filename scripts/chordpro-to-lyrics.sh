#!/usr/bin/env bash

cat $1 |
  sed 's/\[[^]]*\]//g' |
  sed 's/{[^}]*}//g' |
  tr '\n' '{' |
  sed 's/{[{ \t]*{[{ \t]*/{{/g' |
  tr '{' '\n'
