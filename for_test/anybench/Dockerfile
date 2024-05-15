FROM ubuntu:20.04
WORKDIR /home/test
RUN apt update && apt install git -y && git clone --recurse-submodules https://github.com/EntityFX/anybench.git  
WORKDIR /home/test/anybench/src
RUN ./make-amd64.sh
