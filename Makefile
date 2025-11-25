PREFIX ?= /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man

install:
	@echo "Installing mping tools ..."
	install -Dm755 mping $(BINDIR)/mping
	install -Dm755 mping-multi $(BINDIR)/mping-multi
	install -Dm644 mping.1 $(MANDIR)/man1/mping.1
	install -Dm644 mping-multi.1 $(MANDIR)/man1/mping-multi.1
	mandb || true
	@echo "Installed mping to $(BINDIR)/mping"
	@echo "Manual page installed to $(MANDIR)/man1/mping.1"
	@echo "Manual page installed to $(MANDIR)/man1/mping-multi.1"

uninstall:
	@echo "Uninstalling mping tools..."
	rm -f $(BINDIR)/mping
	rm -f $(BINDIR)/mping-multi
	rm -f $(MANDIR)/man1/mping.1
	rm -f $(MANDIR)/man1/mping-multi.1
	mandb || true
	@echo "Uninstalled mping."

.PHONY: install uninstall

