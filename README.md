# A docker container to build jpoet/HauppaugeUSB

# Clone repo

```
mkdir -p ~/src/hauppaugeusb-builder
cd ~/src/hauppaugeusb-builder
git clone https://github.com/jwittkoski/HauppaugeUSB-docker-builder.git
cd HauppaugeUSB-docker-builder
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

# Using

See: https://github.com/jpoet/HauppaugeUSB#using-it

