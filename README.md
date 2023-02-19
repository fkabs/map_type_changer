# map_type_changer
This docker container downloads the latest [Wide Area Alps Freizatkarte Map](http://www.freizeitkarte-osm.de/garmin/en/regions.html) and allows to replace the design with a TYP from  the [Freizeitkarte ReplaceTyp](http://www.freizeitkarte-osm.de/garmin/en/design.html).

To build the container, run the following command:
```sh
docker build -t map_type_changer .
```

When the image is built, you can run the container using following command:
```sh
docker run -it --rm -v $(pwd)/maps:/work/maps map_type_changer
```

This mounts the "maps" folder into the container and runs the entrypoint script:
- Download the latest version of the map
- Download the latest ReplaceTyp designs
- Replace the design of the map (you are able to choose your design)

The finished map with the replaced design is then available under the mounter "maps" volume: _maps/gmapsupp.img_

To install the map, simply copy _maps/gmapsupp.img_ into the _Garmin_ folder of your watch!
