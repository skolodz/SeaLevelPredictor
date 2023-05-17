[A,R] = readgeoraster("USGS_13_n26w081_20221103.tif","OutputType","double");
latlim1 = R.LatitudeLimits;
lonlim1 = R.LongitudeLimits;

% figure
% usamap(latlim1,lonlim1)
% geoshow(A,R,"DisplayType","texturemap")
% cmapsea  = [0.8 0 0.8; 0 0 0.8];
% cmapland = [0.7 0 0; 0.8 0.8 0; 1 1 0.8 ];
% demcmap(A,32, cmapsea, cmapland)
% colorbar
% title("Elevation Data")

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

C = A - 1.99876;
figure
usamap(latlim1,lonlim1)
geoshow(C,R,"DisplayType","texturemap")
cmapsea2  = [0.8 0 0.8; 0 0 0.8];
cmapland2 = [0.7 0 0; 0.8 0.8 0; 1 1 0.8 ];
demcmap(C,32, cmapsea2, cmapland2)
colorbar
title("New Coastline")

% [~,R] = readgeoraster("USGS_13_n43w071_20220713.tif","OutputType","double");
% latlim1 = R.LatitudeLimits;
% lonlim1 = R.LongitudeLimits;
% 
% latlim = [24,28]; 
% lonlim = [-82,-78];
% 
% [B,RA] = readBasemapImage("colorterrain",latlim,lonlim,25);
% 
% [xGrid,yGrid] = worldGrid(RA);
% [latGrid,lonGrid] = projinv(RA.ProjectedCRS,xGrid,yGrid);
% 
% figure
% h = worldmap(latlim,lonlim);
% getm(h,"mapprojection")
% geoshow(latGrid,lonGrid,B)
% geoshow(lat,lon,DisplayType="point",Marker="pentagram")
% title("Boston")
% subtitle("Basemap")
