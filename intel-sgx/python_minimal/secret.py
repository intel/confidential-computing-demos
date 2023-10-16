#!/usr/bin/env python3

# Copyright (C) 2024 Intel Corporation
# SPDX-License-Identifier: BSD-3-Clause

import secrets
import time

count = 0
while True:
    count += 1
    secret = "{}_{:03d}_{}".format("topsecret", count, secrets.token_hex(16))
    print(secret, flush=True)
    time.sleep(2)
