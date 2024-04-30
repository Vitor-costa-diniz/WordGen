prefix ?= /usr/local
bindir = $(prefix)/bin

build:
	swift build -c release --disable-sandbox

install: build
	install -d "$(DESTDIR)$(bindir)"
	install ".build/release/WordGen" "$(DESTDIR)$(bindir)/WordGen"
	install_name_tool -change "$(bindir)/WordGen" "$(DESTDIR)$(bindir)/WordGen" "$(DESTDIR)$(bindir)/WordGen"

uninstall:
	rm -f "$(DESTDIR)$(bindir)/WordGen"

clean:
	rm -rf .build

.PHONY: build install uninstall clean
