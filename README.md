# Hurricane effects on stream chemistry

# 1) Repository
Purpose: To recreate Figure 3 from: Schaefer et al. (2000).

Contains: 
 - R/moving-average3.R : Function to calculate 9 week moving averages of chemical concentrations
 - data/knb-lter-luq.20.4923064/ : Contains the 4 .csv files containing data from each of the 4 sites for this figure
    - QuebradaCuenca1-Bisley.csv
    - QuebradaCuenca2-Bisley.csv
    - QuebradaCuenca2-Bisley.csv
    - RioMameyesPuenteRoto.csv
 - 1_clean_data.R : Script containing data reading and cleaning, uses moving average function from moving-average3.R, writes clean_data.csv
 - output/clean_data.csv : .csv file of clean data, created using script 1_clean_data.R, and contains cols window_start, Site, Chemical, and Concentration, the     latter holds calculates 9 week moving averages
 - paper/paper.qmd : Markdown file for generating .html

# 2) Data
Luquillo Experimental Forest (LEF) Long Term Ecological Research (LTER)

Data Access: McDowell, W. and International Institute of Tropical Forestry(IITF), USDA Forest Service.. 2024. Chemistry of stream water from the Luquillo Mountains ver 4923064. Environmental Data Initiative. https://doi.org/10.6073/pasta/f31349bebdc304f758718f4798d25458. 

Download: Download and unzip the Full Data Package (Zip) [[knb-lter-luq.20.4923064](data/knb-lter-luq.20.4923064)] OR Download the following four packages—[14. Puente Roto Mameyes (MPR) Chemistry Data](data/knb-lter-luq.20.4923064/RioMameyesPuenteRoto.csv), [2. Quebrada one-Bisley (Q1) Chemistry Data](data/knb-lter-luq.20.4923064/QuebradaCuenca1-Bisley.csv), [3. Quebrada two-Bisley (Q2) Chemistry Data](data/knb-lter-luq.20.4923064/QuebradaCuenca2-Bisley.csv), and [4. Quebrada three-Bisley (Q3) Chemistry Data](data/knb-lter-luq.20.4923064/QuebradaCuenca3-Bisley.csv).

Variables Used: Sample_ID (Site Name), Sample_Date (YYYY-MM-DD), K (mg/l), NO3-N (ug/l), Mg (mg/l), Ca (mg/l), NH4-N (ug/l).

# 3) Scripts
[Moving Average Function](R/moving-average3.R)

[Data Cleaning Script](1_clean_data.R)

[Scratch Code](scratch/scratch3.R)

[Markdown](paper/paper.qmd)

# 3) Authors
[Roshan Andres Nair GitHub](https://github.com/roshananair)

# 4) References
1. McDowell, W. and International Institute of Tropical Forestry(IITF), USDA Forest Service.. 2024. Chemistry of stream water from the Luquillo Mountains ver 4923064. Environmental Data Initiative. https://doi.org/10.6073/pasta/f31349bebdc304f758718f4798d25458. 
2. Schaefer, Douglas. A., William H. McDowell, Fredrick N. Scatena, and Clyde E. Asbury. 2000. “Effects of Hurricane Disturbance on Stream Water Concentrations and Fluxes in Eight Tropical Forest Watersheds of the Luquillo Experimental Forest, Puerto Rico.” Journal of Tropical Ecology 16 (2): 189–207. https://doi.org/10.1017/s0266467400001358.
