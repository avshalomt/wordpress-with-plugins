#!/bin/bash
# Add plugins to this list to install:
plugins="wp-piwik contact-form-7 wordpress-seo ssl-insecure-content-fixer post-types-order flamingo wp-mail-smtp"

COMMAND="sudo -u www-data wp --path=${WORDPRESS_PATH}"
echo "Installing plugins and themes"

if [ $(${COMMAND} plugin is-installed hello) ]; then
  echo "Removing Useless Plugin hello"
  ${COMMAND} plugin delete hello
fi

for plugin in $plugins do
  if [ $(${COMMAND} plugin is-installed ${plugin}) ]; then
    echo "Updating plugin ${plugin}"
    ${COMMAND} plugin update ${plugin} --activate
  else
    echo "Installing plugin ${plugin}"
    ${COMMAND} plugin install ${plugin} --activate
  fi
done
