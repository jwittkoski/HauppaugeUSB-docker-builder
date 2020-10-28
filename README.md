# A docker container to build jpoet/HauppaugeUSB

# Download this repo

Do one of the following:

## Clone repo
```
mkdir -p ~/src/hauppaugeusb-builder
cd ~/src/hauppaugeusb-builder
git clone https://github.com/jwittkoski/HauppaugeUSB-docker-builder.git
cd HauppaugeUSB-docker-builder
```

## Download a zip of the files
```
mkdir ~/src
cd ~/src
curl -L https://github.com/jwittkoski/HauppaugeUSB-docker-builder/archive/main.zip > HauppaugeUSB-docker-builder.zip
unzip HauppaugeUSB-docker-builder.zip
cd HauppaugeUSB-docker-builder-main
```

# Build docker image

```
docker build -t hauppaugeusb-builder .
```

# Compile HauppaugeUSB and create tarball

```
docker run -it --rm --mount type=bind,src="$(pwd)",target=/build hauppaugeusb-builder
```

This will generate `HauppaugeUSB-16.9.26-1.tar.gz`

# Installing

Move the tarball to your destination host and:

```
cd /
tar xvzf /tmp/HauppaugeUSB-16.9.26-1.tar.gz
```

Files will be installed in `/opt/Hauppauge`

# Using

See: https://github.com/jpoet/HauppaugeUSB#using-it

