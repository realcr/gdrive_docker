#!/usr/bin/env bash

# Store a file in google drive, at inside a specific directory.  
# NOTE: This will not store a file if the full path (All the directories) are
# not built already at the google drive's side. 

# This script relies on the "drive" tools, which has a sync mindset. It doesn't
# just let you throw in files, or create random folders. You can only sync
# google drive to your current state, or sync your state to google drive's
# state.

# Abort on failure:
set -e

# Path of file (On host machine) that we want to store:
FILE_TO_STORE=$1

# Path of destination dir (Inside google drive) to store this file:
DEST_DIR=$2

prog_name=`basename $0`

if [ "$#" -ne "2" ]; then
	echo "Usage: $prog_name file_to_store dest_dir"
	exit
fi

# If the cred_image_cont does not exist, we create it:
nlines_cred=`docker ps -a | grep gdrive_cred_cont | wc -l`
if [ "$nlines_cred" -eq "0" ]; then 
	echo "gdrive_cred_cont doesn't exist. Aborting."
	exit;
fi

nlines_core=`docker ps -a | grep gdrive_core_cont | wc -l`
if [ "$nlines_core" -gt "0" ]; then 
	echo "gdrive_core_cont still exists. We remove it first."
	docker rm -f gdrive_core_cont
fi

# The destination path of the file inside the container:
container_dest_file=/root/gdrive/${DEST_DIR}/$(basename $FILE_TO_STORE)
container_dest_dir=/root/gdrive/${DEST_DIR}/

# Interactive script to generate credentials:
# (User has to open his browser to get the code back)
docker run --name gdrive_core_cont \
	-v $(readlink -f $FILE_TO_STORE):${container_dest_file} \
	--volumes-from gdrive_cred_cont \
	gdrive_core_image \
	/root/gocode/bin/drive push -no-prompt ${container_dest_file}

# Remove the gdrive_core_cont container:
docker rm -f gdrive_core_cont

# Unset abort on failure:
set +e
