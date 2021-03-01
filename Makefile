SHELL := /bin/bash
IEVDATA_DOWNLOAD_PATH := https://github.com/glossarist/iev-data/releases/download/v0.22.20201217/concepts-0.22.20201217.zip

all: _site

frontend:
	npm install

clean:
	rm -rf _site iev-data

distclean: clean
	rm -rf concepts.zip

concepts.zip:
	curl -sSL ${IEVDATA_DOWNLOAD_PATH} -o $@

_source/assets/images/parts: iev-data
	mkdir -p $@; \
	cp -a $</images/parts/* $@

iev-data: concepts.zip
	mkdir -p $@; \
	unzip $< -d $@

_site: frontend iev-data _source/assets/images/parts | bundle
	bundle exec jekyll build

bundle:
	bundle

serve: frontend iev-data _source/assets/images/parts
	bundle exec jekyll serve --trace

.PHONY: data bundle all open serve distclean clean frontend
