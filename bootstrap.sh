#!/bin/bash
#This script will download and start Apache, and then create asymlinkbetweenyoursyncedfilesdirectoryandthelocationwhereApachewilllookforthecontent
apt-get update
apt-get install -y apache2

if ! [ -L /var/www ]; then
    rm -rf /var/www
    ln -fs /vagrant /var/www
fi