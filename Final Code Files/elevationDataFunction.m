function [latlim, lonlim, regionMat, R] = elevationDataFunction(lat, lon)

latlim = [(lat - 0.5) , (lat + 0.5)];
lonlim = [(lon - 0.5) , (lon + 0.5)];


region = fetchregion(latlim, lonlim, 'display', true);

regionInfo = region.readelevation(latlim, lonlim);
regionMat = regionInfo.elev;

rasterSize = size(regionMat);

R = georefcells(latlim,lonlim,rasterSize,"ColumnsStartFrom","north","RowsStartFrom","west");

% Fix the elevation = 0 display
modRegionMat = zeros(size(regionMat));
for i = 1:width(regionMat)
    for j = 1: height(regionMat)
        if regionMat(i,j) == 0
            modRegionMat(i,j) = -1;
        else
            modRegionMat(i,j) = regionMat(i,j);            
        end
    end
end

% Display current elevation map
figure
usamap(latlim,lonlim)
geoshow(modRegionMat, R,"DisplayType","surface")
demcmap(modRegionMat)
colorbar
title("Elevation Data")

end
