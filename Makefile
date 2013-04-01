.PHONY: fetch fetch-cso fetch-nisra fetch-sns fetch-ons

all: fetch

clean:
	@echo Not deleting data directory.
	rm -rf shapes

fetch: fetch-cso fetch-nisra fetch-sns fetch-ons

fetch-cso: deps
	bin/fetch-cso-shapes

fetch-nisra: deps
	bin/fetch-nisra-shapes

fetch-sns: deps
	bin/fetch-sns-shapes

fetch-ons: deps
	bin/fetch-ons-shapes

deps:
	bin/dependencies.sh
