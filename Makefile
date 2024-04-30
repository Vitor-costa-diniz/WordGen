prefix ?= /usr/local
bindir = $(prefix)/bin

build:
	swift build -c release --disable-sandbox

install: build
	install ".build/release/WordGen" "$(bindir)"
	install_name_tool -change "$(bindir)/WordGen"

uninstall:
	rm -rf "$(bindir)/WordGen"

clean:
	rm -rf .build

.PHONY: build install uninstall clean
