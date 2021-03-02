SITE_SRC_DEST=/tmp/site_preview
PREVIEW_OPTS=--disableFastRender --buildDrafts
BUILD_OPTS=--buildDrafts

setup-site:
	mkdir -p $(SITE_SRC_DEST)
	rm -rf $(SITE_SRC_DEST)
	git clone https://github.com/scientific-python/scientific-python.org $(SITE_SRC_DEST)
	git -C $(SITE_SRC_DEST) submodule update --init
	rm -rf $(SITE_SRC_DEST)/content/specs/*
	cp -r * $(SITE_SRC_DEST)/content/specs

preview: setup-site
	cd $(SITE_SRC_DEST) && hugo server $(PREVIEW_OPTS)

build: setup-site
	cd $(SITE_SRC_DEST) && hugo $(BUILD_OPTS)

clean:
	rm -rf $(SITE_SRC_DEST)

.PHONY: clean preview
