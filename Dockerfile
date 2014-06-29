FROM ubuntu:trusty
# Can be changed to deis/base after deis/base#7 is merged
MAINTAINER OpDemand <info@opdemand.com>

# install curl
RUN apt-get update && apt-get install -qy curl
RUN apt-get install -qy golang

# prepare go environment
ENV GOPATH /go
ENV PATH $PATH:/go/bin

# add the current build context
ADD . /go/src/github.com/deis/helloworld

# compile the binary
RUN cd /go/src/github.com/deis/helloworld && go install -v .

EXPOSE 80

ENTRYPOINT ["/go/bin/helloworld"]
