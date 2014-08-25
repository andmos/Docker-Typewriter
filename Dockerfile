FROM ubuntu:12.04
MAINTAINER Andreas Mosti <andreas.mosti@gmail.com>
ENV EDITOR vim

RUN apt-get update
RUN apt-get install -y texlive-latex-base 
RUN apt-get install -y $EDITOR 
RUN apt-get install -y wget

RUN useradd typewriter
RUN mkdir /home/typewriter && chown -R typewriter: /home/typewriter

WORKDIR /home/typewriter
ENV HOME /home/typewriter

ADD README.md /home/typewriter/
ADD vimrc /home/typewriter/.vimrc
WORKDIR /home/typewriter/.vim
RUN wget https://github.com/plasticboy/vim-markdown/archive/master.tar.gz && tar --strip=1 -zxf master.tar.gz
ADD solarized.vim /home/typewriter/.vim/colors/
WORKDIR /home/typewriter
run chown -R typewriter: /home/typewriter
user typewriter

VOLUME /home/typewriter/shared
CMD /bin/bash
