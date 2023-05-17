
function [] = finalFunction()

    %user input to get which city to run the code for 
    prompt = "Choose which city you would like to view the new coastline for (Clearwater Beach): ";
    city = input(prompt, "s");
    
    %user input to get which scenario they would like to see 
    prompt2 = "Choose which level of CO2 emissions you would like to see and the level (i.e., 1.0 - LOW): ";
    scenario = input(prompt2, "s");

    %user input to get which year to output new coastline for 
    prompt3 = "What year would you like to see the new coastline for: " ;
    wantedYear = str2double(input(prompt3, "s")); 

    %pulling the data for which city the user chose and creating the new matrix of corresponding data
    if city == "Clearwater Beach"
%       [~, ~, ~, ~, ~, ~] = elevationData("ClearwaterBeach.tif");
%       [~, ~, ~, ~, ~] = predictionData("PredictionData.csv");

        %getting the correct data corresponding to the user preferences 
        cityData = table();
        scenarioData = table();
        yearData = table(); 
        [newPTable] = predictionTable("PredictionData.csv");
        
        x = 1;
        for index = 1:height(newPTable)
            cellarr1 = newPTable{index, "NOAAName"};
            if cellarr1{1} == "'Clearwater Beach'"
                cityData{x} = newPTable{index, :};
                x = x+1;
            end 
        end 

        y = 1;
        for index2 = 1:height(cityData)
            if cityData{index2} == scenario
                scenarioData{y} = cityData{index2,:};
                y = y+1;
            end 
        end 

        z = 1;
        for index3 = 1:height(scenarioData)
            if scenarioData{index3} == wantedYear
                yearData{z} = scenarioData{index3,:};
                z = z+1;
            end 
        end 

%         figure
%         Final = (A - (data));
%         usamap(latlim1,lonlim1)
%         geoshow(Final,R,"DisplayType","texturemap")
%         demcmap(Final)
%         colorbar
%         title("Coastline of Newport, RI in year ", wantedYear) 
     end 
end 

