FROM ubuntu:14.04
MAINTAINER real <real@freedomlayer.org>

# Set up the "drive" tool from:
# https://github.com/rakyll/drive

# See also:
# http://www.howtogeek.com/196635/
#       an-official-google-drive-for-linux-is-here-sort-of-maybe-this-is-all-well-ever-get/

RUN apt-get update
RUN apt-get upgrade -qqy

# Get golang and mercurial.
RUN apt-get -y install golang git mercurial

# Get "drive" tool:
RUN mkdir /root/gocode
RUN export GOPATH="/root/gocode" && \
        go get github.com/rakyll/drive/cmd/drive

# Make a directory for google drive:
RUN mkdir /root/gdrive

# /root/gocode/bin/drive init /root/gdrive
# 
# 
#       root@01ecd8b11cf5:~/gdrive# ll
#       total 12
#       drwxr-xr-x 3 root root 4096 Nov 26 12:50 ./
#       drwx------ 6 root root 4096 Nov 26 12:50 ../
#       drwxr-xr-x 2 root root 4096 Nov 26 12:50 .gd/

