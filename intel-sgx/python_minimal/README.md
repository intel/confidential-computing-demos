# Minimal Python example

This directory contains a minimal example for running a Python 3 application in Gramine assuming Gramine is installed on the machine.
The examples also includes the necessary Makefile and a template for generating the Gramine manifest.


## Prerequisites

- A (virtual) machine supporting Intel SGX.
- Ubuntu (>= 22.04) is used as operating system on the host.
- Gramine is installed on the machine ([guide](https://gramine.readthedocs.io/en/stable/installation.html#install-gramine-packages)).
- Python 3 is installed on the machine:
    - Ubuntu 22.04: `sudo apt install python3`


## Building

Execute `make` in the directory.


## Run

Execute `gramine-sgx python`.


## Clean

Execute `make clean` in the directory.
