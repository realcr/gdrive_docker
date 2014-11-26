FROM ubuntu:14.04
MAINTAINER real <real@freedomlayer.org>

# Set up the "drive" tool from:
# https://github.com/rakyll/drive

# See also:
# http://www.howtogeek.com/196635/
# 	an-official-google-drive-for-linux-is-here-sort-of-maybe-this-is-all-well-ever-get/

RUN apt-get update
RUN apt-get upgrade -qqy

# Get golang and mercurial.
RUN apt-get install golang git mercurial

# Get "drive" tool:
RUN mkdir /root/gocode
RUN export GOPATH=/root/gocode; \
	go get github.com/rakyll/drive

# Make a directory for google drive:
RUN mkdir /root/gdrive
