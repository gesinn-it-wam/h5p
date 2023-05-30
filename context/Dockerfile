FROM wodby/drupal:9-8.1

COPY install-h5p.sh /
COPY extras /extras

RUN mkdir -p /var/www/html/root && ln -s /var/www/html/web /var/www/html/root/h5p
