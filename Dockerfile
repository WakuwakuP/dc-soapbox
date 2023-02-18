FROM nginx:latest

RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN https://gitlab.com/soapbox-pub/soapbox/-/jobs/artifacts/develop/download?job=build-production -o /tmp/soapbox-fe.zip \
  && unzip /tmp/soapbox-fe.zip -o -d /opt/soapbox \
    && rm /soapbox-fe.zip