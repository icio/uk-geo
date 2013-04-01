# UK Geography

This project aims to collect and collate the openly available spatial datasets covering the UK and Ireland. The initial implementation uses data solely from censuses conducted recently which segregate land areas into *(super/lower/middle) output areas*.

Getting started: check the Makefile.


## Shapefiles

The shapefiles which are downloaded and extracted by running `make [fetch]` are used in the `shapes.qgs` [Quantum GIS](http://qgis.org/) project for viewing the raw shapefiles. This project has on-the-fly CRS transformation enabled because of the different projections that the data is provided in.
