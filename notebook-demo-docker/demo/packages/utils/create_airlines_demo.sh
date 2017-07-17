#!/bin/bash
set -e
cd ~/utils

wget https://s3.amazonaws.com/h2o-airlines-unpacked/allyears.csv
awk -f modify.awk allyears.csv > allyears_modified.csv
rm allyears.csv
cat ~/utils/create_table_flights.txt | ~/mapd/bin/mapdql -p HyperInteractive
echo "COPY FLIGHTS FROM '~/utils/allyears_modified.csv' with (header = 'true', quoted='false', nulls='NA');" | ~/mapd/bin/mapdql -p HyperInteractive
rm allyears_modified.csv
