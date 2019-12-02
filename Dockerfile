FROM golang:1.13
# setup okteto user
RUN addgroup --gid 10001 app && \
    adduser --home /home/app --uid 10001 --gid 10001 app

COPY bashrc /home/app/.bashrc
USER app
WORKDIR /home/app

RUN go get github.com/codegangsta/gin && \
    go get -u github.com/go-delve/delve/cmd/dlv && \
    go get -u golang.org/x/tools/gopls && \
    curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

ENV PATH="/home/app/go/bin:${PATH}"
CMD ["bash"]