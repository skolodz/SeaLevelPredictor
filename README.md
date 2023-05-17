# Coastline Prediction using Existing Climate Change Models  

### Supplemental Information:

<strong>[Shared Google Drive](https://drive.google.com/drive/u/1/folders/0ADMDjP3qvYbcUk9PVA)</strong>
** or see the "Reports" Folder in this repository ** 

### Project Description 

This project is a completed version of Project 229 - "Coastline Prediction using Existing Climate Change Models" from the MathWorks-Excellence-in-Innovation projects GitHub page. <strong>[Repository](https://github.com/mathworks/MathWorks-Excellence-in-Innovation/blob/main/projects/Coastline%20Prediction%20using%20Existing%20Climate%20Change%20Models/README.md)</strong>

### Background Information

Global warming and melting glaciers are causing sea levels to rise which exposes coastal communities around the US to risks of erosion and flooding. These communities would benefit greatly if they knew in advance when their homes will be affected. To provide the information these communities need to prepare and adapt to the consequences of sea level rise, this project, the Coastline Predictor, visualizes the coastlines up to 100 years in the future. This function will use current elevation data with sea level prediction data to analyse and then generate a predicted coastline map. The user will be able to input what region, year, and scenario they would like to view the new coastline for, and the Coastline Predictor will generate an original map along with a new map of their preferences. 

### Things to look out for

The elevation data files do not work for certain regions around the US that have military bases close by. This means that the file will still be downloadable and can be used with the code, but the output map will be very blurry and pixelated. Hard to use for coastline prediction if it is not detailed and specific. 
In addition, since the script pulls the data for the elevation and latitude/longitude values from a data server of elevation data files, there are some regions that are not within the data server. These regions cannot be used with the script if the USGS file is not already imported into your matlab folder. To pull directly from the data server, you have to check if the region is included in the server because not every region that is in the prediction data is in the elevation data server of raw elevation data files. 

### Current State of Project 

Our project is finished to an extent. There is always room for improvement, however, the code in this repository is completed in that it is able to output an original map of a region given by the user with another map of the new predicted coastline of the same region. The maps output in the same format with the same color schemes. 


