BUILD_COMMAND=swift build -c release 
STATIC_BUILD_COMMAND=${BUILD_COMMAND} -Xswiftc -static-stdlib

build:
	${BUILD_COMMAND}

build_release:
	${RELEASE_BUILD_COMMAND}

build_linux_small:
	docker run -it --rm -v $(shell pwd):/src -w /src ibmcom/kitura-ubuntu ${RELEASE_BUILD_COMMAND} -Xlinker -L/usr/lib/swift/linux
	docker run -it --rm -v $(shell pwd):/src -w /src ibmcom/kitura-ubuntu /bin/bash -c "cp /usr/lib/swift/linux/*.so /src/linux"

build_linux_large:
	docker run -it --rm -v $(shell pwd):/src -w /src ibmcom/kitura-ubuntu ${BUILD_COMMAND}

build_docker_small: build_linux_small
	docker build -t kitura-small -f Dockerfile-small .

build_docker_large: build_linux_large
	docker build -t kitura-large -f Dockerfile-large .

run_docker_small:
	docker run --rm -it -p 8080:8080 kitura-small

run_docker_large:
	docker run --rm -it -p 8080:8080 kitura-large
