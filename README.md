# static-kitura

Experiment to see how small a Docker image can be built for a Swift Kitura microservice.

## Current Sizes:
* Kitura dynamically linked and based on ibmcom/swift-ubuntu : 1.19GB
* Kitura statically linked swift runtime and based on ubuntu:zesty : 226MB
