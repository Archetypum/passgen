# `Makefile`
#
# Copyright (C) 2025 Archetypum
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>

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

