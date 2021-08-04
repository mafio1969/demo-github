FROM mafio69/phpdebian:0.05

USER root
WORKDIR /
ENV DEBIAN_FRONTEND=noninteractive \
  APP_NAME="mfdemo" \
  DATABASE_NAME="mftest" \
  DATABASE_USER="test" \
  DATABASE_PASSWORD=1234 \
  DATABASE_ROOT_PASSWORD=4567 \
  APP_ENV=dev \
  DEBUG=1 \
  XDEBUG=1 \
  LOCAL_PORT=8070 \
  DATABASE_PORT=3306 \
  EMAIL_USER=test \
  EMAIL_PASSWORD=test \
  EMAIL_HOST=mailtrap \
  VAR_DUMPER_SERVER=/main/var/log \
  DB_HOST_LOCAL=database \
  DB_HOST=database \
  SERVERNAME=mfdemo.test \
  SERVERALIAS=www.mfdemo.test \
  MESSENGER_TRANSPORT_DSN=doctrine://default

RUN usermod -a -G docker root && adduser \
       --system \
       --shell /bin/bash \
       --disabled-password \
       --home /home/docker \
       docker \
       && usermod -a -G docker root \
       && usermod -a -G docker docker \
       && rm -f /etc/supervisor/conf.d/supervisord.conf \
       && touch -c /var/log/cron/cron.log \
       && touch -c /usr/share/nginx/logs/error.log

COPY config/cron-task /etc/cron.d/crontask
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY config/supervisord-main.conf /etc/supervisord.conf
COPY config/nginx/nginx.conf /etc/nginx/nginx.conf
COPY config/nginx/enabled-symfony.conf /etc/nginx/conf.d/enabled-symfony.conf
COPY --chown=docker:docker /main /main
WORKDIR /main
#RUN bash -c  /main/entrypoint.sh \
#    && composer require \
#    && composer dump-autoload \
#    && mkdir -p /var/log/cron/ \
#    && npm install \
#    && yarn install \
#    && yarn cache clean \
#    && ln -sf /main/var/log/local.log stdout\

RUN	mkdir -p /usr/share/nginx/logs/ \
	&& mkdir -p /var/log/nginx/ \
	&& mkdir -p /var/lib/nginx/body/ \
	&& mkdir -p /usr/share/nginx/logs/ \
	&& chmod 777 -R /var/lib/nginx \
	&& chmod 777 -R /var/log/ \
	&& chmod 777 -R /usr/share/nginx/logs/ \
    && ln -sf /var/log/nginx/project_access.log stdout \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stdout /usr/share/nginx/logs/error.log \
    && ln -sf /dev/stdout /usr/share/nginx/logs/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    && ln -sf /var/log/nginx/project_access.log stdout \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

STOPSIGNAL SIGQUIT
EXPOSE 8080 9000
WORKDIR /

CMD ["supervisord", "-n"]


