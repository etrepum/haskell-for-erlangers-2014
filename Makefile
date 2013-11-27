# Install pandoc globally or run "cabal sandbox init; cabal install pandoc"
PANDOC ?= $(shell which ./.cabal-sandbox/bin/pandoc 2>/dev/null || echo pandoc)

.PHONY: all submodules

all: index.html

reveal.js:
	git submodule init
	git submodule update

d3:
	git submodule init
	git submodule update

all: index.html

index.html: slides.md header.html default.revealjs Makefile | d3 reveal.js
	$(PANDOC) -s \
	  --mathjax \
	  --include-in-header="header.html" \
	  -t revealjs \
	  --variable=transition:none \
	  --variable=css:css/simple.css \
	  --from=markdown+definition_lists \
	  --template default.revealjs \
	  -o $@ \
	  $< 
