#!/bin/sh

# poor man's wait-for-drupal
sleep 10

drush site:install --db-url=mysql://drupal:drupal@mariadb/drupal --account-pass=drupal4everyone -y
# save /var/www/html/web/sites/default/settings.php to a mounted /data (like in DSC)?
composer require 'drupal/h5p:^2.0.0-alpha3'
drush en h5p h5peditor --y
drush user:create embassy --password='h5ptest' -y

# install zen theme
composer require drupal/zen:6.4.0
drush en -y zen
drush vset theme_default zen

# install mw extension
cp /extras/mw /var/ww/html/web/sites/all/modules/contrib
drush en mw --y

cp /extras/mw/extra.css /var/ww/html/web/sites/all/modules/contrib/h5p
echo ""

drush cache-clear all
