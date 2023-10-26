# Copyright (C) 2024 Intel Corporation
# SPDX-License-Identifier: BSD-3-Clause

FROM ubuntu:20.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    python3=3.8.2-0ubuntu2 \
    && rm -rf /var/lib/apt/lists/*

COPY app/secret.py /app/secret.py
WORKDIR /app

ENTRYPOINT []
CMD ["python3","./secret.py"]
