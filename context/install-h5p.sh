#!/bin/sh

# poor man's wait-for-drupal
sleep 10

drush site:install --db-url=mysql://drupal:drupal@mariadb/drupal --account-pass=drupal4everyone -y
# save /var/www/html/web/sites/default/settings.php to a mounted /data (like in DSC)?
composer require 'drupal/h5p:^1.51'
drush en h5p h5peditor --y
drush user:create embassy --password='h5ptest' -y

# install zen theme
composer require drupal/zen:6.4.0
drush en -y zen
drush vset theme_default zen

# add extra.css to zen theme
ZEN=/var/www/html/web/sites/all/themes/contrib/zen
# linking seems not to work here
# ln -s /extras/extra.css $ZEN/extra.css
cp /extras/extra.css $ZEN/extra.css
echo "stylesheets[all][] = extra.css" >> $ZEN/zen.info

drush cache-clear all
