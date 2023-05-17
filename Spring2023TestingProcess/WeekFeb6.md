# Mon 02/06/2023
### Display Map with GeoCoordinates
```
[A,R] = readgeoraster("USGS_13_n42w071_20230117.tif","OutputType","double");
latlim = R.LatitudeLimits;
lonlim = R.LongitudeLimits;
usamap(latlim,lonlim)
geoshow(A,R,"DisplayType","surface")
demcmap(A)
```
#### Result:
Units: degree, meter <br />
In matrix "A":
- Columns go down from North --> South <br />
- Rows go West --> East <br /><br />
<img src="https://user-images.githubusercontent.com/86635895/217102375-cefd937b-8202-444d-bfa6-e1ad6529ba4f.png" width="300" height="300" />
<img src="https://user-images.githubusercontent.com/86635895/217102909-debe4311-1450-456e-9bc7-d29985726ca8.png" width="500" height="250" />
<img src="https://user-images.githubusercontent.com/86635895/217103149-4ac0afe5-ac17-49db-b8f2-5ebc93b60963.png" width="500" height="250" />
<img src="https://user-images.githubusercontent.com/86635895/217103231-cf96d16c-afd9-4271-b120-c795b59d3f5c.png" width="500" height="250" />

### Creat the longitude and latitude vectors
To be used later for specific elevation vs sea level analysis
```
% Creating latitude (vertical) and longitude (horisontal) vectors
latiVec = zeros(R.RasterSize(1), 1);
longVec = zeros(1, R.RasterSize(2));

latiUnit = (abs(latlim(1) - latlim(2)))/R.RasterSize(1);
longUnit = (abs(lonlim(1) - lonlim(2)))/R.RasterSize(2);

% inputing values for latitude vector
for i = 1:R.RasterSize(1)
    latiVec(i,1) = latlim(1) + (latiUnit * (i-1));
end

% inputing values for longitude vector
for j = 1:R.RasterSize(2)
    longVec(j,1) = lonlim(1) + (longUnit * (j-1));
end
```

#### Result:
latiVec: <br />
<img src="https://user-images.githubusercontent.com/86635895/217109641-5a41caec-64cd-4371-bc29-55edebb181aa.png" width="125" height="250" />
<img src="https://user-images.githubusercontent.com/86635895/217109785-1fd18a49-26c3-490c-ae8e-3014880d4b83.png" width="125" height="250" />

longVec: <br />
<img src="https://user-images.githubusercontent.com/86635895/217110093-cdc758e1-cdfb-4e57-88a8-400f44d5f98a.png" width="500" height="75" />
<img src="https://user-images.githubusercontent.com/86635895/217110288-6c1b3eff-3fc7-420b-8a13-ffd8146fe190.png" width="500" height="75" />



<img src="" width="500" height="250" />



