FROM node:18 AS builder

RUN apt-get update && apt-get install -y \
  curl unzip \
  && rm -rf /var/lib/apt/lists/*

RUN curl -L https://api.github.com/repos/wakuwakup/dc-soapbox/actions/artifacts/master/soapbox-fe -o /tmp/soapbox.zip \
  && unzip /tmp/soapbox.zip -d /opt/soapbox \
  && rm /tmp/soapbox.zip

FROM nginx:latest

COPY --from=builder /opt/soapbox/static /opt/soapbox/
