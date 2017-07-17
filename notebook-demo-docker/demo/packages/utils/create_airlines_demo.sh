#!/bin/bash
set -e
cd ~/

cat ~/utils/create_table_flights.txt | ~/mapd/bin/mapdql -p HyperInteractive
echo "COPY FLIGHTS FROM '~/allyears_modified.csv' with (header = 'true', quoted='false', nulls='NA');" | ~/mapd/bin/mapdql -p HyperInteractive
rm allyears_modified.csv
