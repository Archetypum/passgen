# `Makefile`
#
# Copyright (c) 2025-2026 Archetypum.
#
# Redistribution and use in source and binary forms, with or without modification, are permitted
# provided that the following conditions are met:
#
#   1. Redistributions of source code must retain the above copyright notice, this list of conditions
#   and the following disclaimer.
#
#   2. Redistributions in binary form must reproduce the above copyright notice, this list of
#   conditions and the following disclaimer in the documentation and/or other materials provided
#   with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS “AS IS” AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
# AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

PASSGEN_BIN := /usr/bin/passgen
PASSGEN_SRC := passgen
MANPAGE_SRC := passgen.1
MANPAGE_DST := /usr/share/man/man1/passgen.1

.PHONY: all install uninstall dependencies install-man uninstall-man man

all: dependencies install install-man

dependencies:
	@echo "[<==] Checking dependencies..."
	@which python3 >/dev/null || (echo "[!] python3 is required but not found." && exit 1)
	@echo "[*] python3 is installed and valid."

install: $(PASSGEN_SRC)
	@echo "[<==] Installing passgen to $(PASSGEN_BIN)..."
	@install -m 0755 $(PASSGEN_SRC) $(PASSGEN_BIN)
	@echo "[*] Installed."

uninstall:
	@echo "[<==] Removing $(PASSGEN_BIN)..."
	@rm -f $(PASSGEN_BIN)
	@echo "[*] Uninstalled."

install-man: $(MANPAGE_SRC)
	@echo "[<==] Installing man page to $(MANPAGE_DST)..."
	@install -m 0644 $(MANPAGE_SRC) $(MANPAGE_DST)
	@echo "[*] Man page installed."

uninstall-man:
	@echo "[<==] Removing man page $(MANPAGE_DST)..."
	@rm -f $(MANPAGE_DST)
	@echo "[*] Man page uninstalled."

man: install-man
	@echo "[*] Updating man database..."
	-@mandb >/dev/null 2>&1 || true

