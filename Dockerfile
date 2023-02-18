FROM node:18 AS builder

RUN apt-get update && apt-get install -y \
  git \
  && rm -rf /var/lib/apt/lists/*

RUN git clone https://gitlab.com/soapbox-pub/soapbox.git /opt/soapbox

WORKDIR /opt/soapbox

RUN cd /opt/soapbox & yarn

COPY .env /opt/soapbox/

RUN cd /opt/soapbox & yarn build

FROM nginx:latest

COPY --from=builder /opt/soapbox/static /opt/soapbox/
