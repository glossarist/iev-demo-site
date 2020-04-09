SHELL := /bin/bash

all: _site

clean:
	rm -rf _site

distclean: clean

data:

_site: data | bundle
	bundle exec jekyll build

bundle:
	bundle

serve:
	bundle exec jekyll serve

.PHONY: data bundle all open serve distclean clean
