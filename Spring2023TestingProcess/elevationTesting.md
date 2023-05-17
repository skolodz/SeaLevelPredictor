
# Thur 11/10/2022
### Readding and displaying TIFF:
```
t = Tiff('USGS_13_n43w071_20220713.tif','r');
imageData = read(t);

imshow(imageData);
```
Result:

<img src="https://user-images.githubusercontent.com/86635895/202313140-e0ee46f0-790e-426a-b8e1-04c5dac42c63.png" width="500" height="500" />



# Tue 11/15/2022
### Display the map with elevation details
```
figure
imshow(imageData1, [-2 maxNum1]);
colorbar
```
Result:

<img src="https://user-images.githubusercontent.com/86635895/202555955-12b7b4a8-8a92-4639-a7fb-3254d1d3af2c.png" width="500" height="500" />



### Concatenate multiple TIFF files to make a map covering larger area
1. Read multiple TIFF into matrices
2. Concatenate them into 1 large matrix
3. Displays the large matrix

```
%% n43w071
t1 = Tiff('USGS_13_n43w071_20220713.tif','r');
imageData1 = read(t1);
maxNum1 = matmax(imageData1);

figure
imshow(imageData1, [-2 maxNum1]);
colorbar

%% n43w072
t2 = Tiff('USGS_13_n42w071_20191216.tif','r');
imageData2 = read(t2);
maxNum2 = matmax(imageData2);

figure
imshow(imageData2, [-2 maxNum2]);
colorbar

%% Concatenate Matrices
combineData = [imageData1; imageData2];
figure
imshow(combineData, [-2 maxNum2]);
colorbar


%% Functions

function maxNum = matmax(matrix)
    maxarr = max(matrix);
    maxNum = max(maxarr);
end

function minNum = matmin(matrix)
    minarr = min(matrix);
    minNum = min(minarr);
end
```

Result:

<img src="https://user-images.githubusercontent.com/86635895/202557240-1b2f3184-baca-4b4b-a1c1-040bf1fcba59.png" width="350" height="600" />


# THUR 11/17/2022

### This code reads data in .laz format and represents a map

```
path = fullfile("18TWK670925.laz");
lasReader = lasFileReader(path);
ptCloud = readPointCloud(lasReader);

figure
pcshow(ptCloud.Location)
colorbar
clim([0 10])

```

Result: 


<img src="https://user-images.githubusercontent.com/113383808/202563308-114ac2e7-1fe7-40e2-a86c-74ab85318378.png" width="600" height="500" />


