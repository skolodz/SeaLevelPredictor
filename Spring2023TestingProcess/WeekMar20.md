# Monday 03/20/23
### Most updated code for elevation of Boston with new coastline of "fake data"

```
[A,R] = readgeoraster("USGS_13_n26w081_20221102.tif","OutputType","double");
latlim1 = R.LatitudeLimits;
lonlim1 = R.LongitudeLimits;

figure
usamap(latlim1,lonlim1)
geoshow(A,R,"DisplayType","texturemap")
demcmap(A)
colorbar
title("Elevation Data of Boston")

% Creating latitude (vertical) and longitude (horizontal) vectors
latiVec = zeros(R.RasterSize(1), 1);
longVec = zeros(1, R.RasterSize(2));

latiUnit = (abs(latlim1(1) - latlim1(2)))/R.RasterSize(1);
longUnit = (abs(lonlim1(1) - lonlim1(2)))/R.RasterSize(2);

% inputing values for latitude vector
for i = 1:R.RasterSize(1)
    latiVec(i,1) = latlim1(1) + (latiUnit * (i-1));
end

% inputing values for longitude vector
for j = 1:R.RasterSize(2)
    longVec(j,1) = lonlim1(1) + (longUnit * (j-1));
end

%creating new coastline map with "fake data"
C = (A - 1.99876);
figure
usamap(latlim1,lonlim1)
geoshow(C,R,"DisplayType","texturemap")
demcmap(C)
colorbar
title("New Coastline of Boston - (Elevation - 1.99876)")
```

### Most updated code for Florida maps - original and new 
```
[A,R] = readgeoraster("USGS_13_n29w081_20221103.tif","OutputType","double");
latlim1 = R.LatitudeLimits;
lonlim1 = R.LongitudeLimits;

figure
usamap(latlim1,lonlim1)
geoshow(A,R,"DisplayType","texturemap")
demcmap(A)
colorbar
title("Elevation Data of Florida")

% Creating latitude (vertical) and longitude (horizontal) vectors
latiVec = zeros(R.RasterSize(1), 1);
longVec = zeros(1, R.RasterSize(2));

latiUnit = (abs(latlim1(1) - latlim1(2)))/R.RasterSize(1);
longUnit = (abs(lonlim1(1) - lonlim1(2)))/R.RasterSize(2);

% inputing values for latitude vector
for i = 1:R.RasterSize(1)
    latiVec(i,1) = latlim1(1) + (latiUnit * (i-1));
end

% inputing values for longitude vector
for j = 1:R.RasterSize(2)
    longVec(j,1) = lonlim1(1) + (longUnit * (j-1));
end

%creating new map of coastline with "fake data" 
C = (A - 1.99876);
figure
usamap(latlim1,lonlim1)
geoshow(C,R,"DisplayType","texturemap")
demcmap(C)
colorbar
title("New Coastline of Florida - (Elevation - 1.99876)")
```
