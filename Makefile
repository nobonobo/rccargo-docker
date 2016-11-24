REPOS_ID=nobonobo/rccargo

.PHONY: build run push

build:
	rm -rf ./run/rccargo
	-docker rm -f rccargo
	docker build --rm -t localhost/rccargo ./build
	docker create --name rccargo localhost/rccargo echo && \
	docker cp rccargo:/go/bin/ ./run/rccargo/ && \
	docker cp -L rccargo:/usr/lib/libode.so.6 ./run/rccargo/ && \
	docker rm rccargo

run:
	docker build --rm -t $(REPOS_ID) ./run
	docker run --rm -it -p 8080:8080 $(REPOS_ID)

push:
	docker build --rm -t $(REPOS_ID) ./run
	docker push $(REPOS_ID)
