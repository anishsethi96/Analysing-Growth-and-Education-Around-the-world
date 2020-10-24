# Analysis-of-Global-Education-and-Growth-Trends

## Abstract
Educating the youth of a nation is the most important factor when it comes to their growth. This project analyses data from the United Nations about Education, Growth and Gross Value added by sectors so show a correlation between the same. I feel that education and GDP are always positively correlated because with an increase in the level of education, more people find employment and since employers are ready to provide highly specialized jobs with a high pay, the spending or consumption increases and since consumption increases, so does Gross Domestic Product.
This analysis intends to find the effects of primary, secondary and tertiary education on growth, specifically the GDP and the individual GVA added by sectors and represent them visually. The analysis is done on R Studio and the Exploratory data analysis is shown in the form of bar plots, heatmaps, stacked plots and multiple scatter and area graphs. The data had some missing values which were cleaned and needed uniformity of format before the analysis was done. This analysis depicts the relation between education and growth for regions around the world and certain countries of interest (e.g. United States of America, India, China, Greece, and Syria). A Linear model was applied to predict the GDP and growth of certain countries in the future based on the enrollments in tertiary school and the changing value added by sectors. KNN Classification was done on the countries to classify them into 3 broad categories of Low, Average and High GDP based on the linear model.

## Eploratory Data Analysis
Initial analysis of the data showed a stark difference in GDP and GDP per capita which was due to the great difference in population of the regions. It is visible that although the GDP of Asia is a lot higher the GDP per capita is significantly decreased when population considered. A similar increase is visible in case of North America.

<div class="row">
  <div class="column">
    <img src="https://github.com/anishsethi96/Analysis-of-Global-Education-and-Growth-Trends/blob/master/EDA/BarPlotGDP.png" alt="GVA Sector Analysis" width="400" />
  </div>
  <div class="column">
    <img src="https://github.com/anishsethi96/Analysis-of-Global-Education-and-Growth-Trends/blob/master/EDA/BarPlotPerCapita.png" alt="GVA Sector Analysis" width="400" />
  </div>
</div>

<img src="https://github.com/anishsethi96/Analysis-of-Global-Education-and-Growth-Trends/blob/master/EDA/Enrollment%20Plot.png" alt="GVA Sector Analysis" width="400" />

In the stacked plots for GVA by sectors for 6 countries (China, India, Greece, Liberia, America and Syria) the difference in the economies of the countries is visible. Liberia has an economy which is highly dependent on agriculture, at the same time America has a service-based economy and very little value in terms of GDP is added by the agriculture sector. India which I though was more agriculture based is service based with value added by the service sector increasing gradually since the 1980s.

<img src="https://github.com/anishsethi96/Analysis-of-Global-Education-and-Growth-Trends/blob/master/EDA/SectorJoined.png" alt="GVA Sector Analysis" width="600" />

We also see that Latin America, Caribbean, Europe and South America show similar trends where GDP per capita drops around 2010 to increase gradually later. North America has the Highest increase with a slight drop in gain right before 2010. 

<img src="https://github.com/anishsethi96/Analysis-of-Global-Education-and-Growth-Trends/blob/master/EDA/PerCapita%20Area%20Plot.png" alt="GVA Sector Analysis" width="600" />

 <img src="https://github.com/anishsethi96/Analysis-of-Global-Education-and-Growth-Trends/blob/master/EDA/ScatterAgroVService.png" alt="GVA Sector Analysis" width="500" />
 A scatter of economies between the service and agriculture sector where most regions are in the high service and low agriculture zone.
