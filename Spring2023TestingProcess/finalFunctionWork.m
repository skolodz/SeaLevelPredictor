function [] = finalFunction()

%user input to get which city to run the code for 
    prompt = "Choose which city you would like to view the new coastline for (Honolulu): ";
    city = input(prompt, "s");

%user input to get which year to output new coastline for 
    prompt = "What year would you like to see the new coastline for: " ;
    wantedYear = str2double(input(prompt, "s"));

%pulling the data for which city the user chose and creating the new matrix of that corresponding data for that region
    if city == "Honolulu"
        [latlim1, lonlim1, latiVec, longVec, A, R] = elevationData("Honolulu1.tif");
        [newLatindex, newLonindex, columnsL, C] = predictionData("PredictionData.csv");
       
        last = length(newLatindex);
        lastLon = length(newLonindex);

%         [columnsL, C] = predictionData("PredictionData.csv");

       % need help with this for loop (matrix vs. table dilemma) and
       % extracting the single column depending on what year the user wants
       % to see
        for year = 1: columnsL
            if C(:,year) == wantedYear
                NewMatrix = C(newLatindex(1):newLatindex(last), c);
                NewMatrix2 = C(newLonindex(1):newLonindex(lastLon), c);            
            end
        end 

%creating the final output map of the elevation minus the new matrix of data
%         [A,R] = elevationData("Honolulu1.tif");
        figure
        Final = (A - ([NewMatrix2 NewMatrix]));
        usamap(latlim1,lonlim1)
        geoshow(Final,R,"DisplayType","texturemap")
        demcmap(Final)
        colorbar
        title("Coastline of Honolulu, Florida in year ", wantedYear)

 
%     elseif city == "Boston"
%         elevationData("Boston.tif");
%         predictionData("PredictionData.csv");
%          
%     elseif city == "San Francisco"
%         elevationData("SanFrancisco.tif");
%         predictionData("PredictionData.csv");
%     elseif city == "New Orleans"
%         elevationData("NewOrleans.tif");
%         predictionData("PredictionData.csv");
    end 

end 
