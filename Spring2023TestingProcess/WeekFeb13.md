# Mon 02/13/2023
### Compress lines of code into functions
Started to make code for analysing a TIF file into a function: 
Inputs:  <br />
- The TIF file
Outputs:  <br />
- Map display (currently)
- Elevation value matrix (expect)
- Geo-coordinate verctors (expect)

Added/Changed to the code:
```
function [] = elevationWgeocoordinates(tiffile)
    [A,R] = readgeoraster(tiffile,"OutputType","double");
...
end
```

# Tues 02/14/2023
### Display Basemap of Boston
```
% Code for Basemap of Boston (zoomed out)
[~,R] = readgeoraster("USGS_13_n26w081_20221103.tif","OutputType","double");
latlim1 = R.LatitudeLimits;
lonlim1 = R.LongitudeLimits;

latlim = [41,43];
lonlim = [-72, -69];

[A,RA] = readBasemapImage("colorterrain",latlim,lonlim,25);

[xGrid,yGrid] = worldGrid(RA);
[latGrid,lonGrid] = projinv(RA.ProjectedCRS,xGrid,yGrid);

figure
h = worldmap(latlim,lonlim);
getm(h,"mapprojection")
geoshow(latGrid,lonGrid,A)
geoshow(lat,lon,DisplayType="point",Marker="pentagram")
title("Boston")
subtitle("Basemap")
```

# Thurs 02/16/2023
### Display Basemap of Miami
```
% Code for Basemap of Miami (zoomed out)

[~,R] = readgeoraster("USGS_13_n26w081_20221103.tif","OutputType","double");
latlim1 = R.LatitudeLimits;
lonlim1 = R.LongitudeLimits;

latlim = [24,28]; 
lonlim = [-82,-78]; 

[A,RA] = readBasemapImage("colorterrain",latlim,lonlim,25);

[xGrid,yGrid] = worldGrid(RA);
[latGrid,lonGrid] = projinv(RA.ProjectedCRS,xGrid,yGrid);

figure
h = worldmap(latlim,lonlim);
getm(h,"mapprojection")
geoshow(latGrid,lonGrid,A)
geoshow(lat,lon,DisplayType="point",Marker="pentagram")
title("Miami")
subtitle("Basemap")
```
