# Copyright (C) 2024 Gramine contributors
#                    Intel Corporation
# SPDX-License-Identifier: BSD-3-Clause

ARCH_LIBDIR ?= /lib/$(shell $(CC) -dumpmachine)

.PHONY: all
all: python.manifest.sgx python.sig

python.manifest: python.manifest.template secret.py
	gramine-manifest \
		-Darch_libdir=$(ARCH_LIBDIR) \
		-Dentrypoint=$(realpath $(shell sh -c "command -v python3")) \
		$< >$@

python.manifest.sgx python.sig: sgx_sign
	@:

.INTERMEDIATE: sgx_sign
sgx_sign: python.manifest
	gramine-sgx-sign \
		--manifest $< \
		--output $<.sgx

.PHONY: clean
clean:
	$(RM) *.manifest *.manifest.sgx *.token *.sig
	$(RM) -r __pycache__

.PHONY: distclean
distclean: clean
