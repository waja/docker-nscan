IMAGE_NAME := waja/nscan

build:
	docker build --rm -t $(IMAGE_NAME) .
	
run:
	@echo docker run --rm -it $(IMAGE_NAME) 
	
shell:
	docker run --rm -it --entrypoint sh $(IMAGE_NAME) -l

test: build
	@if ! [ "$$(docker run --rm -it waja/nscan -h | head -2 | tail -1 | cut -d' ' -f1)" = "nscan" ]; then exit 1; fi
