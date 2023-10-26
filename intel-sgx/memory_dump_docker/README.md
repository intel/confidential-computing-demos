# Memory Dump Demo using Docker containers

This directory contains a minimal example for dumping memory of a Docker container containing an unprotected Python application and another Docker container containing a Gramine-protected Python application.
For the Gramine protected container, the example also includes the necessary Makefile and a template for generating the Gramine manifest.


## Prerequisites

- A (virtual) machine supporting Intel SGX.
- Ubuntu (>= 22.04) is used as operating system on the host.
- Docker is installed on the machine ([guide](https://docs.docker.com/engine/install/ubuntu/)).
- `gcore` is installed on the machine:
  - Ubuntu 22.04: `sudo apt install gdb`


## Building

- Build Docker container containing unprotected Python application:
  - Execute: `docker build -f unprotected.Dockerfile -t python_minimal_unprotected .`
- Build Docker container containing Gramine-protected Python application:
  - Execute: `docker build -f protected.Dockerfile -t python_minimal_protected .`


## Start Containers

- Start Docker container containing unprotected Python application:
  - Execute: `docker run --rm --name python_minimal_unprotected python_minimal_unprotected`
- Start Docker container containing Gramine-protected Python application:
  - Execute: `docker run --rm --device /dev/sgx_enclave --name python_minimal_protected python_minimal_protected`


## Run Sniffer

- Run sniffer on Docker container containing unprotected Python application:
  - Execute: `./sniffer.sh unprotected`
- Run sniffer on Docker container containing Gramine-protected Python application:
  - Execute: `./sniffer.sh protected`


## Debug Containers

- Start Docker container containing unprotected Python application in interactive mode:
  - Execute: `docker run --rm --name python_minimal_unprotected -it python_minimal_unprotected bash`
- Start Docker container containing Gramine-protected Python application in interactive mode:
  - Execute: `docker run --rm --device /dev/sgx_enclave --name python_minimal_protected -it python_minimal_protected bash`


## Cleanup

- Stop containers:
  - Execute: `docker stop python_minimal_unprotected python_minimal_protected`
- Remove memory dumps:
  - Execute: `rm -f core.*`
