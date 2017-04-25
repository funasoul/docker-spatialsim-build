# Dockerfile to build [spatialsimulator](https://github.com/spatialsimulator) on docker.
Dockerfile in this repository will help you build [SpatialSimulator](https://github.com/spatialsimulator) and its library (libspatialsim) on docker.

## How to use
### Requirements
Docker, of course :-)
I have tested this script with [Docker for Mac](https://www.docker.com/products/docker#/mac) on MacOS Sierra.

### Download and setup
#### Clone this project
```sh
cd ~/git/
git clone https://github.com/funasoul/docker-spatialsim-build.git
cd ~/git/docker-spatialsim-build/
```

#### How to use
Following command will build `spatialsimulator` and `libspatialsim` on docker, and then create an archive file as `libspatialsim-docker.tar.gz`.
```sh
docker build -t funasoul/spatialsim-build .     # build libspatialsim on docker
docker run funasoul/spatialsim-build
mycontainer=$(docker ps -aqlf "ancestor=funasoul/spatialsim-build")  # just obtain last container ID
docker cp ${mycontainer}:/tmp/deploy/libspatialsim-docker.tar.gz .   # use obtained container ID to copy the archive file to the host.
tar tvzf libspatialsim-docker.tar.gz    # just for check
```
You can use this archive with [docker-spatialsim](https://github.com/docker-spatialsim).
(`docker-spatialsim` already includes pre-compiled version of spatialsimulator, so you don't have to use this repository if you just want to run spatialsimulator on docker.)

Have fun!
