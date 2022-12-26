ARG NGINX_VERSION=1.17.9

FROM nginx:${NGINX_VERSION}

ARG HOST
ARG APP_PATH=/app

USER root

RUN apt-get update && apt-get -y install \
    vim \
    curl \
    openssl \
    apache2-utils \
    --no-install-recommends apt-utils && \
    rm -r /var/lib/apt/lists/*

COPY docker/nginx/nginx.conf /tmp/

RUN envsubst '${APP_PATH} ${HOST}' < /tmp/nginx.conf > /etc/nginx/nginx.conf

ADD ./ ${APP_PATH}
RUN chmod -R 777 ${APP_PATH}
WORKDIR ${APP_PATH}

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]