### Tuesday April 4, 2023 
# Find intersection of newLatindex and newLonindex
Some locations may have the same longitude and different latitudes. We are looking indices where both longitude and latitude in the prediction data file match that of our elevation file

Relevant links:
<br/> https://www.mathworks.com/matlabcentral/answers/251146-finding-intersecting-rows-in-column-vectors-of-varying-length
<br/> https://www.mathworks.com/help/matlab/ref/ismembertol.html

### Thursday, April 6, 2023
# Write and crop elevation matrix in to a new .csv file
Since we only need the elevation values of certain regions and their longitude and latitude vectors, we will save the values into a new .csv file and crop that accordingly.

Relevant links:
<br/> https://www.mathworks.com/help/matlab/ref/csvwrite.html#mw_c156452b-4792-4bd1-9332-992dea085034
<br/> https://www.mathworks.com/help/matlab/ref/writematrix.html
<br/>Mostly Used:
<br/>https://www.mathworks.com/matlabcentral/answers/1470306-how-can-i-write-a-csv-file-by-row-or-by-column
<br/>https://www.mathworks.com/help/rptgen/ug/create-tables-based-on-matlab-tables.html
<br/>https://www.mathworks.com/help/matlab/ref/table.html?s_tid=doc_ta#btw1ta9-2
