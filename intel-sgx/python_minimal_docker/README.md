# Minimal Python example using Docker

This directory contains a minimal example for running a Python 3 application in Gramine using a Docker container.
The examples also includes the necessary Makefile and a template for generating the Gramine manifest.


## Prerequisites

- A (virtual) machine supporting Intel SGX.
- Ubuntu (>= 22.04) is used as operating system on the host.
- Docker is installed on the machine ([guide](https://docs.docker.com/engine/install/ubuntu/)).


## Building

- Execute `docker build -t python_minimal .` in the directory.


## Start Container

- Start Docker container containing Gramine-protected Python application:
  - Execute: `docker run --rm --device /dev/sgx_enclave --name python_minimal python_minimal`


## Debug Container

- Start Docker container containing Gramine-protected Python application in interactive mode:
  - Execute: `docker run --rm --device /dev/sgx_enclave --name python_minimal -it python_minimal bash`
- Start Gramine application inside container:
  - Execute: `gramine-sgx python`


## Cleanup

- Stop container:
  - Execute: `docker stop python_minimal`
