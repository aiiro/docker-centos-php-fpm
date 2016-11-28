#!/bin/sh

set -e

mkdir -p /data/tmp/php/uploads
mkdir -p /data/tmp/php/sessions
chown -R www:www /data/tmp/php

mkdir -p /data/www/html/public

if [ "${GENERATE_PHPINFO^^}" = TRUE ]; then
  echo "<?php phpinfo();" > /data/www/html/public/index.php
fi
