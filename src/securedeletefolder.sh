#!/bin/bash
# Script to run srm -r from dolphin
Updated 2019-02-28 @ 17:33:50 MST by rob@sigma
#set -x
s_fn='securedeletefolder' # source filename
cmd='srm -r'              # cmd is secure remove
uid=`id -u`           # get effective userid e.g 1000
fid=$(basename "$@")  # get the fileid by stripping directory info 
owner=$(ls -alodn "$@"| awk '{print $3}')  # find the owner of fid
  if [ "$uid" = "$owner" ];then
  echo $@;
  `kdialog --title "$cmd" --menu "Choose level of $s_fn:" \
   "$cmd -l" "Fast and unsecure  ($cmd -l)" \
   "$cmd -f" "Slow and more secure ($cmd -f)" \
   "$cmd  "  "Very slow and very secure  ($cmd)"` "$@" 
  else
   kdialog --error "Sorry, you do not own "$fid""
fi
#set +x
