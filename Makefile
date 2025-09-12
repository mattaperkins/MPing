PREFIX ?= /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man

install:
	@echo "Installing mping..."
	install -Dm755 mping $(BINDIR)/mping
	install -Dm755 mping-multi $(BINDIR)/mping-multi
	install -Dm644 mping.1 $(MANDIR)/man1/mping.1
	mandb || true
	@echo "Installed mping to $(BINDIR)/mping"
	@echo "Manual page installed to $(MANDIR)/man1/mping.1"

uninstall:
	@echo "Uninstalling mping..."
	rm -f $(BINDIR)/mping
	rm -f $(MANDIR)/man1/mping.1
	mandb || true
	@echo "Uninstalled mping."

.PHONY: install uninstall

