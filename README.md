# furiousgeorge/cpuload

This is basically the containerized version of [GaetanoCarlucci/CPULoadGenerator](https://github.com/GaetanoCarlucci/CPULoadGenerator).  It allows you to generate a load on the CPU for a certain amount of time.

## Instructions

* First, pull the image from docker:
```
docker pull furiousgeorge/cpuload
```

* Next, run the container without any arguments to see the help of which options are available:
```
docker run --rm furiousgeorge/cpuload
```

The output should look something like this:

```
Usage: CPULoadGenerator.py [options]
Options:
  -l, --cpuLoad=   Cpu Target Load [default: 0.2]
  -d, --duration=  Duration [default: 10]
  -p, --plot=      Enable Plot [default: 0]
  -c, --cpu_core=  Select the CPU on which generate the load [default: 0]
      --version    Display Twisted version and exit.
      --help       Display this help and exit.
```

* Finally, run the container with the desired options.  (Do not use the -p option - plotting does not work in this container).

For example, to run an 30% load for 30 seconds on the 1st core:

```
docker run --rm furiousgeorge/cpuload CPULoadGenerator.py -c 0 -l 0.3 -d 30
```

Another example, to run on 80% load for 10 seconds on 4 cores:

```
docker run --rm furiousgeorge/cpuload bash -c "CPULoadGenerator.py -c 3 -l 0.8 -d 10 | CPULoadGenerator.py -c 2 -l 0.8 -d 10 | CPULoadGenerator.py -c 1 -l 0.8 -d 10 | CPULoadGenerator.py -c 0 -l 0.8 -d 10"

```

See the source repository ([GaetanoCarlucci/CPULoadGenerator](https://github.com/GaetanoCarlucci/CPULoadGenerator)) for more details.
