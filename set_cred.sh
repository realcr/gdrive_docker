#!/usr/bin/env bash

# Set credentials for google drive. (Should be done once)

# Abort on failure:
set -e

# If the cred_image_cont does not exist, we create it:
nlines_cred=`docker ps -a | grep gdrive_cred_cont | wc -l`
if [ "$nlines_cred" -eq "0" ]
	then echo "gdrive_cred_cont doesn't exist. We create it first." && \
		docker run cred_image true
fi

nlines_core=`docker ps -a | grep gdrive_core_cont | wc -l`
if [ "$nlines_core" -gt "0" ]
	then echo "gdrive_core_cont still exists. We remove it first." && \
		docker rm -f gdrive_core_cont
fi

# Interactive script to generate credentials:
# (User has to open his browser to get the code back)
docker run -it --name gdrive_core_cont \
	--volumes-from gdrive_cred_cont \
	gdrive_core_image /root/gocode/bin/drive init /root/gdrive

# Remove the gdrive_core_cont container:
docker rm -f gdrive_core_cont

# Unset abort on failure:
set +e
