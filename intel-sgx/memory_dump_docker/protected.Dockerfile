# Copyright (C) 2024 Intel Corporation
# SPDX-License-Identifier: BSD-3-Clause

FROM gramineproject/gramine:v1.5

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential=12.8ubuntu1.1 \
    && rm -rf /var/lib/apt/lists/*

RUN gramine-sgx-gen-private-key

COPY app /app
WORKDIR /app

RUN make

ENTRYPOINT []
CMD ["gramine-sgx","./python"]
