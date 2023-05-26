FROM wodby/drupal:7-8.0

COPY install-h5p.sh /
COPY extras /extras

RUN mkdir -p /var/www/html/root && ln -s /var/www/html/web /var/www/html/root/h5p
