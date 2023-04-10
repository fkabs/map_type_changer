#!/usr/local/bin/bash

echo "****************************************************************"
echo "[map_type_changer] Welcome to the Freizeitkarte map builder!"
echo "****************************************************************"

# download latest wide area alps map, unzip it and remove the zip file
# TODO: Allow the user to choose which map to use
echo ""
echo "[map_type_changer] Downloading the latest 'wide area alps' map..."
wget https://download.freizeitkarte-osm.de/garmin/latest/ALPS_en_gmapsupp.img.zip -O /work/maps/ALPS_en_gmapsupp.zip
unzip -o /work/maps/ALPS_en_gmapsupp.zip -d /work/maps
rm -f /work/maps/ALPS_en_gmapsupp.zip

# download latest ReplaceTyp, unzip it and remove the zip file
echo ""
echo "[map_type_changer] Downloading the latest 'ReplaceTyp' designs..."
wget https://download.freizeitkarte-osm.de/Design/latest/en/ReplaceTyp.zip -O /tmp/ReplaceTyp.zip
unzip /tmp/ReplaceTyp.zip -d /work
rm -f /tmp/ReplaceTyp.zip
chmod +x /work/ReplaceTyp/ReplaceTyp.sh

# replace the map's design and remove the 'ReplaceTyp' folder
echo ""
echo "[map_type_changer] Replacing the map type with a design of your choice..."
(cd /work/ReplaceTyp/ ; sh ReplaceTyp.sh /work/maps/gmapsupp.img)
rm -rf /work/ReplaceTyp

# print the final message
echo ""
echo "[map_type_changer] Finished replacing the map type with the chosen all design!"
echo ""
