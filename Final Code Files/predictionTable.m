function [newPTable] = predictionTable(in)

pTable = readtable(in, 'NumHeaderLines', 17);


% identify the cells with header format RSL'year'_cm_
headersNames = pTable.Properties.VariableNames;
yearFormat = 'RSL[\d]+_cm_';
headerYear = regexp(headersNames,yearFormat);

% index of headers matching the format
yearIndex = zeros();
yearInIn = 1;
for headerIndex = 1:width(headerYear)
    cellarr1 = headerYear(headerIndex);
    if isempty(cellarr1{1}) == 0
        yearIndex(yearInIn) = headerIndex;
        yearInIn = yearInIn + 1;
    end
end

% creating names for the years
yearVec = headersNames(yearIndex);
newNameVec = [];
newNameVecIn = 1;
for var1 = 1:width(yearVec)
    cellarr2 = yearVec(var1);
    newNameVec(newNameVecIn) = sscanf(cellarr2{1},'RSL%d_cm_');
    newNameVecIn = newNameVecIn + 1;
end

% renaming the years with newName
newPTable = renamevars(pTable,yearIndex,string(newNameVec));

end
