IMAGE_NAME = seotool_heroku
VERSION = latest
FILE = Dockerfile

image:
	docker build -f $(FILE) -t $(IMAGE_NAME):$(VERSION) .

push:
	docker push $(IMAGE_NAME):$(VERSION)

run:
	docker run -e TZ=UTC --rm --init -it $(IMAGE_NAME):$(VERSION)

all: image push