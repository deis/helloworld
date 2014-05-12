FROM deis/base:latest
MAINTAINER OpDemand <info@opdemand.com>

# install go runtime
RUN wget -O /tmp/go1.2.1.linux-amd64.tar.gz -q https://go.googlecode.com/files/go1.2.1.linux-amd64.tar.gz
RUN tar -C /usr/local -xzvf /tmp/go1.2.1.linux-amd64.tar.gz

# prepare go environment
RUN mkdir -p /go
ENV GOPATH /go
ENV PATH /usr/local/go/bin:/go/bin:$PATH

# add the current build context
ADD . /go/src/github.com/deis/helloworld

# compile the binary
RUN cd /go/src/github.com/deis/helloworld && go install -v .


ENV PORT 80
CMD ["/go/bin/helloworld"]
EXPOSE 80
