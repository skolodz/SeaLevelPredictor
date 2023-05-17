% prompt the user for region, year, and scenario
prompt1 = "Choose which city you would like to view the new coastline for: ";
wantedRegion = input(prompt1, "s");

prompt2 = "What year would you like to see the new coastline for: " ;
wantedYear = str2double(input(prompt2, "s"));

prompt3 = "What scenario would you like to see the new coastline for: " ;
wantedScenario = str2double(input(prompt2, "s"));

% Get prediction data
newPTable = predictionTable("SLR_TF U.S. Sea Level Projections.csv");

% Extract prediction data of wanted region
PRindex = 1;
PRvec = [];

for rowIndex1 = 1:height(newPTable)
    cellarr1 = newPTable.NOAAName(rowIndex1);
    if strcmp(wantedRegion, cellarr1{1}) == 1
        PRvec(PRindex) = rowIndex1;
        PRindex = PRindex + 1;
    end
end

predictionRegion = newPTable(PRvec(1):PRvec(length(PRvec)),["Lat","Long","Scenario","2020","2100"]);

% Extract prediction data of wanted scenario
PS = 0;
for rowIndex2 = 1:height(predictionRegion)
    cellarr2 = predictionRegion.Scenario(rowIndex2);
    if strcmp('1.0 - HIGH', cellarr2{1}) == 1
        PS = rowIndex2;
    end
end

predictionScenario = predictionRegion(PS,:);

% Get elevation data of wanted region
[latlim, lonlim, regionMat, R] = elevationDataFunction(predictionScenario.Lat(1), predictionScenario.Long(1));


% Create and diaplay new matrix for predicted coastline
seaLevelRise = (predictionScenario.("2100") - predictionScenario.("2020"))/100;
predictedCoastline = regionMat - seaLevelRise;

figure
usamap(latlim,lonlim)
geoshow(predictedCoastline, R,"DisplayType","texturemap")
demcmap(predictedCoastline)
colorbar
title("Prediction Data")

% display sea level rise value
fprintf("The sea level of this region will rise %2.4f meters.", seaLevelRise)
