.PHONY: fetch fetch-cso fetch-nisra fetch-sns fetch-ons

all: fetch

clean:
	@echo Not deleting data directory.
	rm -rf shapes

fetch: fetch-cso fetch-nisra fetch-sns fetch-ons

fetch-cso: deps
	bin/fetch-cso

fetch-nisra: deps
	bin/fetch-nisra

fetch-sns: deps
	bin/fetch-sns

fetch-ons: deps
	bin/fetch-ons

deps:
	bin/dependencies.sh
