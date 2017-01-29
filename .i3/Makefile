.DEFAULT_GOAL := build

build:
	[ -f ./config.local ] && cat config.base config.local > config || cat config.base > config

clean:
	rm config
