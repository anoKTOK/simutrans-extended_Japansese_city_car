#!/bin/bash
for file in `find . -name '*.csv'`; do
		nkf -wLu --overwrite $file
		../bin/csv2dat $file
		echo "  extracting $file"
done
cat ../Japanese_city_car/config/simuconf_base.tab > ../Japanese_city_car/config/simuconf.tab
cat simuconf_liveries.tab >> ../Japanese_city_car/config/simuconf.tab

for file in `find . -name '*.tab'`; do
		if [ $file = "./simuconf_liveries.tab" ]
		then
				echo $file
				continue
		fi
		nkf -wLu --overwrite $file
		sed -i '1i§#' $file
		mv $file ../Japanese_city_car/text
done
