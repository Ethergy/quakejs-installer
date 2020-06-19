#!/bin/bash
# Adds the crc32-value in front of the pak3-file
#
# You need to have libarchive-zip-perl installed in order to use crc32 command
# sudo apt install libarchive-zip-perl
#
# Maybe you have to install bash
# sudo apt install bash
#
#
# rename a single file: crc-rename filename
# rename more than one file: crc-rename filename1 filename2
# rename all pk3's in the current directory: crc-rename ls
# rename pk3's in other directories: crc-rename /var/www/html/assets/base*/*
# (The script does not work correctly if there are whitespaces in the path)
# In some cases you might have to put sudo in front of the command if
# you are not root

for file in "$@"
do
  if [[ $file =~ ".pk3" ]]; then 
    checksum=$((0x$(crc32 $file)))
    mv $file "$(dirname $file)/$checksum-$(basename $file)"
  
# echo 'dirname' $(dirname $file)
  # echo 'basename' $(basename $file) 

  echo $file ' renamed'
  else
  echo $file ' not changed' 
  fi
done
