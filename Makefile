IMAGE:=zambon/rancher-compose
VERSION:=0.9.2

build:
	docker build -t $(IMAGE):$(VERSION) .

clean:
	docker rmi $(IMAGE):$(VERSION)

publish:
	docker push $(IMAGE):$(VERSION)

test:
	docker run --rm -it $(IMAGE):$(VERSION) --version

help:
	@echo "build      Build $(IMAGE) image."
	@echo "clean      Remove $(IMAGE) image."
	@echo "publish    Push $(IMAGE) to Docker Hub."
	@echo "test       Test $(IMAGE) image."
