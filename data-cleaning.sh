#!/usr/bin/env bash
sed -i 's/\\,/,/g' data/Addresses.csv # replace escaped commas (\,) by commas
sed -i '85213 s/<.*>//g' data/Addresses.csv # remove HTML in line 85213

sed -i 's/\\,/,/g' data/Officers.csv # replace escaped commas (\,) by commas