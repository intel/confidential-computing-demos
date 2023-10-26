#!/bin/bash

# Copyright (C) 2024 Intel Corporation
# SPDX-License-Identifier: BSD-3-Clause

# Check presence of gcore command.
if ! command -v gcore &> /dev/null
then
    echo "gcore could not be found, please install"
    exit 1
fi

# Set container to be sniffed according to input.
if [[ ${@,,} == *"unprotected"* ]];
then
    containerName="python_minimal_unprotected"
elif [[ ${@,,} == *"protected"* ]];
then
    containerName="python_minimal_protected"
else
    echo 'Please start script with either "unprotected" or "protected" as an argument'
    exit 1
fi
printf 'Starting to sniff Docker container "%s"\n' $containerName

# Get container PID.
containerProcessPid=$(docker inspect -f '{{.State.Pid}}' $containerName )
if [ -z "$containerProcessPid" ]
then
    printf 'PID of Docker container "%s" not found\n' $containerName
    exit 1
fi
printf 'PID of Docker container "%s": %s\n' $containerName $containerProcessPid

# Dump memory of container.
sudo gcore $containerProcessPid > /dev/null 2>&1
dumpFilename="core.${containerProcessPid}"
if [ ! -f "$dumpFilename" ]
then
  printf 'Could not dump memory of process "%d"\n' $containerProcessPid
fi
printf 'Dumped memory of process "%d" to file "%s"\n' $containerProcessPid $dumpFilename

# Search for secret in memory dump
SECRET_EXP="topsecret_.{0,20}"
printf 'Starting search of secret in file "%s"\n' $dumpFilename
grep -aEo $SECRET_EXP $dumpFilename
printf 'Ended search of secret in file "%s", found %d results\n' $dumpFilename $(grep -aEo $SECRET_EXP $dumpFilename | wc -l)
