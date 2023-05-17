function [newLatindex, newLonindex, columnsL, C] = predictionData(dataIn)

P = readtable(dataIn);

%create new matrix C that only contains columns of P that have the data 
C = P(:, 14:28);
C(1:12, :) = [];

%create new matrix that only contains the two columns of the lat lon
L = P(:, 6:7);
L(1:27,:) = [];


%call elevation function to get lat lon vectors to use here  
[latlim1, lonlim1, latiVec, longVec] = elevationData("Honolulu1.tif");
N = zeros(size(L));

%index L matrix first column to match latiVec & longVec from elevation
[rowsL,columnsL] = size(N);

% latitude - 1st colomn
for x = 1: rowsL 
    N(x,1) = L.('Var6')(x);
end

% longitude - 2ns colomn
for y = 1:rowsL
    N(y,2) = L.('Var7')(y);
end

newLatindex = zeros();
newLonindex = zeros();

%index into latitude colomn
a = 1;
for i = 1:rowsL
    if (N(i,1) >= latlim1(1)) && (N(i,1) <= latlim1(2))
        newLatindex(a) = i;
        a = a+1;
    end
end

b = 1;
for j = 1:rowsL
    if (N(j,2) >= lonlim1(1)) && (N(j,2) <= lonlim1(2))
        newLonindex(b) = j;
        b = b+1;
    end
end

newLatindex
newLonindex 

predictionIndex = intersect(newLonindex,newLatindex);

end
