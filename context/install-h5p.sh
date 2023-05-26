#!/bin/sh

while [ true ]; then
    sleep 10
    drush site:install --db-url=mysql://{{ DB_USER }}:{{ DB_PASSWORD }}@mariadb/{{ DB_NAME }} --account-pass=drupal4everyone -y
    # save /var/www/html/web/sites/default/settings.php to a mounted /data (like in DSC)?
    composer require 'drupal/h5p:^1.51'
    drush en h5p h5peditor --y
    drush user:create embassy --password='h5ptest' -y
fi
