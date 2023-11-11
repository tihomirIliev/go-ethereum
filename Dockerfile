# Support setting various labels on the final image
ARG COMMIT=""
ARG VERSION=""
ARG BUILDNUM=""

# Build Geth in a stock Go builder container
FROM golang:1.21-alpine as builder

RUN apk add --no-cache gcc musl-dev linux-headers git

# Get dependencies - will also be cached if we won't change go.mod/go.sum
COPY go.mod /go-ethereum/
COPY go.sum /go-ethereum/
RUN cd /go-ethereum && go mod download

ADD . /go-ethereum
RUN cd /go-ethereum && go run build/ci.go install -static ./cmd/geth

# Pull Geth into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /go-ethereum/build/bin/geth /usr/local/bin/

COPY gethaccounts tmp/gethaccounts

#ENV ACCOUNT_PASSWORD=""
#ENV ACCOUNT_KEY=""
#ENV bootnodeAddress=""
#ENV address=""

#RUN echo $ACCOUNT_PASSWORD > /tmp/password
#RUN echo $ACCOUNT_KEY > /tmp/accountkey

#RUN if [[ "$isnotbootnode" = yes ]]; then \
#	geth account import --password tmp/password tmp/accountkey; \ 
#	CMD exec geth --bootnodes "$bootnodeAddress" --networkid 3636 --verbosity 6 --http --http.addr "0.0.0.0" --http.corsdomain "*" --mine --etherbase $address --unlock $address --password tmp/password; \ 
#    fi

RUN geth init /tmp/gethaccounts/genesis.json \
	&& rm -f ~/.ethereum/geth/nodekey
#	&& geth account import --password tmp/gethaccounts/node1/password tmp/gethaccounts/node1/keystore \
#	&& geth account import --password tmp/gethaccounts/node2/password tmp/gethaccounts/node2/keystore

EXPOSE 8545 8546 30303 30303/udp
ENTRYPOINT ["geth"]

# Add some metadata labels to help programatic image consumption
ARG COMMIT=""
ARG VERSION=""
ARG BUILDNUM=""

LABEL commit="$COMMIT" version="$VERSION" buildnum="$BUILDNUM"
