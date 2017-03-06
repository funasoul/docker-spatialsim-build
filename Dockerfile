FROM funasoul/libsbml-build
MAINTAINER Akira Funahashi "funa@bio.keio.ac.jp"

# How to use:
#   docker run funasoul/spatialsim-build
#   mycontainer=$(docker ps -aqlf "ancestor=funasoul/spatialsim-build")
#   docker cp ${mycontainer}:/tmp/deploy/libspatialsim-docker.tar.gz . 

RUN apt-get -y update && apt-get install -y \
  zsh \
  vim \
  less \
  libopencv-dev \
  libhdf5-dev \
  fastjar \
  silversearcher-ag

COPY .zshrc /root/.zshrc
COPY .vimrc /root/.vimrc
COPY .exrc /root/.exrc
COPY sam2d.xml /tmp/sam2d.xml

RUN cd /tmp && \
      git clone https://github.com/spatialsimulator/Spatial_Simulator.git
# Disable caching for specific RUN commands (git pull for this time)
# https://github.com/docker/docker/issues/1996#issuecomment-51292997
ADD http://www.random.org/strings/?num=10&len=8&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new uuid
RUN cd /tmp/Spatial_Simulator/ && \
      git pull origin master && \
      make && \
      make install && \
      spatialsimulator -t 0.1 -d 0.001 -o 10 -C 10 /tmp/sam2d.xml
      #rm -rf /tmp/*

# generate tarball
RUN cd / && \
      mkdir -p /tmp/deploy && \
      tar cvzf /tmp/deploy/libspatialsim-docker.tar.gz usr/lib/libspatialsim* usr/bin/spatialsimulator usr/include/spatialsim
