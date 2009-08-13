#!/usr/bin/env bash

#download CVS version of Drupal 6 to the test directory
cvs -z6 -d:pserver:anonymous:anonymous@cvs.drupal.org:/cvs/drupal co -d drupal_testing -r $1 drupal

#create a files directory
mkdir drupal_testing/sites/default/files 

#make the files directory 777
chmod 777 drupal_testing/sites/default/files 

#cp the default.settings.php to settings.php file
cp drupal_testing/sites/default/default.settings.php drupal_testing/sites/default/settings.php

#chmod 755 settings.php
chmod 777 drupal_testing/sites/default/settings.php

#Truncate MySQL testing database, named drupal_testing
mysqldump -u[yourdatabaseuser] -p[yourdatabasepassword] --add-drop-table --no-data drupal_testing | grep ^DROP | mysql -u[yourdatabaseuser] -p[yourdatabasepassword] drupal_testing
