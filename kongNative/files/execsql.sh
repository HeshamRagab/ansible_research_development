#!/bin/bash

set -e
cd /var/lib/postgresql/
sudo -u postgres psql < ./kongdbinit.sql