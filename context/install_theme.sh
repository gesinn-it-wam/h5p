
#!/bin/bash

# Specify the theme name and version
THEME_NAME="nexus"
THEME_VERSION="1.0.0"

# Set the Drupal root directory path
#DRUPAL_ROOT="/path/to/your/drupal/root"
DRUPAL_ROOT="/var/www/html"

# Navigate to the Drupal root directory
cd "$DRUPAL_ROOT"

# Install the theme using Composer
composer require drupal/"$THEME_NAME":"$THEME_VERSION"

#composer global require drush/drush

# Enable the theme
drush en -y "$THEME_NAME"

# Clear Drupal cache
drush cr

