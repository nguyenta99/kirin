ARG NGINX_VERSION=1.17.9

FROM nginx:${NGINX_VERSION}

ARG HOST

ARG APP_PATH=/kirin

RUN apt-get update && apt-get -y install \
    vim \
    curl \
    openssl \
    apache2-utils \
    --no-install-recommends apt-utils && \
    rm -r /var/lib/apt/lists/*

WORKDIR ${APP_PATH}

COPY docker/nginx/nginx.conf /tmp/

RUN envsubst '${APP_PATH} ${HOST}' < /tmp/nginx.conf > /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]