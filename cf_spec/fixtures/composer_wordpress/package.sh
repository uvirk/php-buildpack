#!/bin/sh

rm -rf vendor/ wp/
composer install && composer update
cp files/wp-config.php wp/
cp -r files/pg4wp wp/wp-content/pg4wp
cp files/pg4wp/db.php wp/wp-content/db.php