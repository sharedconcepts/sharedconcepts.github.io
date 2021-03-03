adoc=$(wildcard *.adoc)

all: docs/index.html docs/agenda.html

docs/index.html: README.adoc
	mkdir -p docs; \
  asciidoctor -a stylesdir=css -a stylesheet=styles.css -o $@ --backend=html5 $<

docs/%.html: %.adoc
	mkdir -p docs; \
  asciidoctor -a stylesdir=css -a stylesheet=styles.css -o $@ --backend=html5 $<

clean:
	rm -rf docs

.PHONY: all clean