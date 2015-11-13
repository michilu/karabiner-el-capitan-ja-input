all: xml

NODE_MODULES_BASE=node_modules
BIN_COFFEE=$(NODE_MODULES_BASE)/.bin/coffee
BIN_HAML=$(firstword $(HAML_PATH) haml)

.SUFFIXES: .haml .xml
.haml.xml:
	@if which $(BIN_HAML) >/dev/null; then\
		echo $(BIN_HAML) -f xhtml $< $@;\
		$(BIN_HAML) -f xhtml $< $@;\
	else\
		echo haml is not exists: no build $<;\
		exit 1;\
	fi
HAML = $(shell find . -name "*.haml")
xml = $(HAML:.haml=.xml)

xml: $(xml)
