#!/usr/bin/env bash

host=$1

ssh $host 'rm -rf ~/website; mkdir ~/website'
rsync -rav -e ssh --exclude={.*,*.sh} ./ $host:~/website

ssh $host << EOF

  rm -rf /var/www/website
  rsync -av ~/website /var/www;

EOF
