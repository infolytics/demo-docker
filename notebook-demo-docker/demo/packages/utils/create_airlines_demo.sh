set -e
# Create table
cd ~/utils
cat ~/create_table_flights.txt | ~/mapd/bin/mapdql -p HyperInteractive
# Import CSV
gzip -f -k -d flights.csv.gz
echo "COPY ipums_easy FROM '~/utils/flights.csv' (with header='false', quoted='false');" | ~/mapd/bin/mapdql -p HyperInteractive
