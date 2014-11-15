# docker-httpd

A [Docker](https://docker.com/) container for [Apache HTTP Server](http://httpd.apache.org/).

## Apache HTTP Server 2.2.22 (STABLE BRANCH)

### Run the container

Using the `docker` command:

    CONTAINER="httpddata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v $(pwd):/httpd-2.2.22/data \
      simpledrupalcloud/data:latest
  
    CONTAINER="httpd" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from httpddata \
      -d \
      simpledrupalcloud/httpd:2.2.22
      
Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-httpd.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 2.2.22 \
      && fig up

### Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-httpd.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 2.2.22 \
      && sudo docker build -t simpledrupalcloud/httpd:2.2.22 . \
      && cd -

## Apache HTTP Server 2.2.22 (DEVELOPMENT BRANCH)

### Run the container

Using the `docker` command:

    CONTAINER="httpddata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v $(pwd):/httpd-2.2.22/data \
      simpledrupalcloud/data:dev
  
    CONTAINER="httpd" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from httpddata \
      -d \
      simpledrupalcloud/httpd:2.2.22-dev
      
Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-httpd.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 2.2.22-dev \
      && fig up

### Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-httpd.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 2.2.22-dev \
      && sudo docker build -t simpledrupalcloud/httpd:2.2.22-dev . \
      && cd -

## License

**MIT**
