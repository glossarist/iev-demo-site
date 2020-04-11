SHELL := /bin/bash
IEVDATA_DOWNLOAD_PATH := https://github.com/glossarist/iev-data/releases/download/v0.12.20200410/concepts-0.12.20200410.zip

all: _site

frontend:
	npm install

clean:
	rm -rf _site iev-data

distclean: clean
	rm -rf concepts.zip

concepts.zip:
	curl -sSL ${IEVDATA_DOWNLOAD_PATH} -o $@

iev-data: concepts.zip
	mkdir $@
	unzip $< -d $@

_site: iev-data | bundle | frontend
	bundle exec jekyll build

bundle:
	bundle

serve: iev-data | frontend
	bundle exec jekyll serve

.PHONY: data bundle all open serve distclean clean frontend
