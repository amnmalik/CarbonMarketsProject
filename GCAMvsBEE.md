GCAMvs.BEE
================
Aman Malik
2022-11-16

``` r
library(tidyverse)
library(ggsci)
library(DT)
```

### Description of tasks

There are two tasks:

1.  Compare the current and future production and emissions from GCAM
    and the BEE report.

2.  Prepare a target constraint file for GCAM in 2025 and 2030 for
    industry sectors based on BEE

### GCAM BAU or Current Policies data

``` r
### Reading in GCAM data from a BAU/Current policies run
gcamBau <- readxl::read_excel("data/gcamBau2.xls") %>%
 filter(title != "title") %>%
  select(-scenario,-region) %>%
  mutate(across(c(`1990`:`2095`),as.numeric)) %>%
  mutate(across(c(`1990`:`2095`),~round(.,digits = 2))) %>%
  pivot_longer(`1990`:`2095`,names_to = "year",values_to = "value") %>%
  mutate(variable = if_else(Units %in% c("Mt","Mt N", "EJ"), "production", "emissions")) %>%
  mutate(scenario = "BAU_curr_pol") 

DT::datatable(data = gcamBau%>% 
  select(-title))
```

<div id="htmlwidget-a99f87e65d11e6c7304b" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-a99f87e65d11e6c7304b">{"x":{"filter":"none","vertical":false,"data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","127","128","129","130","131","132","133","134","135","136","137","138","139","140","141","142","143","144","145","146","147","148","149","150","151","152","153","154"],["iron and steel","iron and steel","iron and steel","iron and steel","iron and steel","iron and steel","iron and steel","iron and steel","iron and steel","iron and steel","iron and steel","iron and steel","iron and steel","iron and steel","cement","cement","cement","cement","cement","cement","cement","cement","cement","cement","cement","cement","cement","cement","N fertilizer","N fertilizer","N fertilizer","N fertilizer","N fertilizer","N fertilizer","N fertilizer","N fertilizer","N fertilizer","N fertilizer","N fertilizer","N fertilizer","N fertilizer","N fertilizer","aluminum","aluminum","aluminum","aluminum","aluminum","aluminum","aluminum","aluminum","aluminum","aluminum","aluminum","aluminum","aluminum","aluminum","electricityTPP","electricityTPP","electricityTPP","electricityTPP","electricityTPP","electricityTPP","electricityTPP","electricityTPP","electricityTPP","electricityTPP","electricityTPP","electricityTPP","electricityTPP","electricityTPP","refining","refining","refining","refining","refining","refining","refining","refining","refining","refining","refining","refining","refining","refining","iron and steel","iron and steel","iron and steel","iron and steel","iron and steel","iron and steel","iron and steel","iron and steel","iron and steel","iron and steel","iron and steel","iron and steel","iron and steel","iron and steel","cement","cement","cement","cement","cement","cement","cement","cement","cement","cement","cement","cement","cement","cement","alumina","alumina","alumina","alumina","alumina","alumina","alumina","alumina","alumina","alumina","alumina","alumina","alumina","alumina","N fertilizer","N fertilizer","N fertilizer","N fertilizer","N fertilizer","N fertilizer","N fertilizer","N fertilizer","N fertilizer","N fertilizer","N fertilizer","N fertilizer","N fertilizer","N fertilizer","electricity","electricity","electricity","electricity","electricity","electricity","electricity","electricity","electricity","electricity","electricity","electricity","electricity","electricity"],["Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt N","Mt N","Mt N","Mt N","Mt N","Mt N","Mt N","Mt N","Mt N","Mt N","Mt N","Mt N","Mt N","Mt N","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","Mt","EJ","EJ","EJ","EJ","EJ","EJ","EJ","EJ","EJ","EJ","EJ","EJ","EJ","EJ","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC","MTC"],["1990","2005","2010","2015","2020","2025","2030","2035","2040","2045","2050","2065","2080","2095","1990","2005","2010","2015","2020","2025","2030","2035","2040","2045","2050","2065","2080","2095","1990","2005","2010","2015","2020","2025","2030","2035","2040","2045","2050","2065","2080","2095","1990","2005","2010","2015","2020","2025","2030","2035","2040","2045","2050","2065","2080","2095","1990","2005","2010","2015","2020","2025","2030","2035","2040","2045","2050","2065","2080","2095","1990","2005","2010","2015","2020","2025","2030","2035","2040","2045","2050","2065","2080","2095","1990","2005","2010","2015","2020","2025","2030","2035","2040","2045","2050","2065","2080","2095","1990","2005","2010","2015","2020","2025","2030","2035","2040","2045","2050","2065","2080","2095","1990","2005","2010","2015","2020","2025","2030","2035","2040","2045","2050","2065","2080","2095","1990","2005","2010","2015","2020","2025","2030","2035","2040","2045","2050","2065","2080","2095","1990","2005","2010","2015","2020","2025","2030","2035","2040","2045","2050","2065","2080","2095"],[24.54,45.79,68.9,89,119.1,205.53,305.81,411.61,511.22,575.24,627.97,0,0,0,54.71,161.91,228.91,228.91,248.45,309.16,372.64,431.56,485.4,403.02,410.24,0,0,0,6.55,10.43,11.22,11.54,12.59,13.73,14.84,15.91,16.96,17.83,18.85,0,0,0,0.63,1.56,1.47,1.89,2.28,5.55,10.88,18.25,27.12,35.6,43.57,0,0,0,0.77,2.09,2.87,4.04,4.77,6.71,9.22,12.24,15.54,14.2,13.41,0,0,0,2.59,8.02,11.69,11.1,11.17,17.46,26.44,36.03,48.13,63.37,81.32,0,0,0,14.96,29.61,47.88,72.88,94.88,120.93,149.72,183.16,220.15,159.8,116.25,0,0,0,13.2,32.06,44.99,44.99,49.5,63.3,78.18,92.88,106.22,88.66,80.77,0,0,0,0.23,0.27,0.24,0.8,0.96,2.34,4.59,7.7,11.44,13.31,14.41,0,0,0,5.96,9.48,10.21,10.5,10.7,11.54,12.1,11.52,10.27,8.82,7.7,0,0,0,61.44,160.05,224.6,303.48,350.52,471.72,618.76,787.63,963.95,794.18,591.76,0,0,0],["production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","production","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions","emissions"],["BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol","BAU_curr_pol"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>sector<\/th>\n      <th>Units<\/th>\n      <th>year<\/th>\n      <th>value<\/th>\n      <th>variable<\/th>\n      <th>scenario<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":4},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>

### BEE data on production, emissions and targets for different sectors

``` r
#### Reading in data from BEE report on current and future production, emissions
bee_data <- readxl::read_excel("data/BEE_report.xlsx",
    skip = 1) %>%
  rename_all(~c("variable","sector","unit","year","value")) %>%
  mutate(year= gsub(pattern = "2019-20",replacement = "2019",year)) %>%
    mutate(year= gsub(pattern = "2030-31",replacement = "2030",year))

### Calculating BAU emissions in 2030
bau_2030_emissions <- bee_data %>% filter(variable %in% c("Total CO2 emissions","Reduction in CO2 emissions (2030)"),year==2030) %>%
  pivot_wider(names_from = variable,values_from = value) %>%
  mutate(`BAU Emissions` = `Total CO2 emissions`+`Reduction in CO2 emissions (2030)`) %>%
  pivot_longer(cols = 4:6,names_to = "variable") %>%
  select(4,1,2,3,5)

## Combining the two
bee_data <- bind_rows(bee_data,bau_2030_emissions) %>%
  distinct()

### Adding a column on % reduction in emissions wrt BAU
bee_data_diff_bau <- bee_data %>%
  filter(variable %in% c("Reduction in CO2 emissions (2030)","BAU Emissions")) %>%
  pivot_wider(names_from = variable,values_from = value) %>%
  mutate(value = (`Reduction in CO2 emissions (2030)`/`BAU Emissions`)*100) %>%
  select(sector,year,value) %>%
  mutate(variable = "ChangeWrtBAU",unit="percent")

## Putting it all together
bee_data <- bind_rows(bee_data,bee_data_diff_bau)

DT::datatable(bee_data)
```

<div id="htmlwidget-c3a668502dd4c45531a8" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-c3a668502dd4c45531a8">{"x":{"filter":"none","vertical":false,"data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126"],["Production","Total CO2 emissions","Specific Emissions","Production","Total CO2 emissions","Specific Emissions","Reduction in CO2 emissions (2030)","Production","Total CO2 emissions","Specific Emissions","Production","Total CO2 emissions","Specific Emissions","Reduction in CO2 emissions (2030)","Production","Total CO2 emissions","Specific Emissions","Production","Total CO2 emissions","Specific Emissions","Reduction in CO2 emissions (2030)","Production","Total CO2 emissions","Specific Emissions","Production","Total CO2 emissions","Specific Emissions","Reduction in CO2 emissions (2030)","Production","Total CO2 emissions","Specific Emissions","Production","Total CO2 emissions","Specific Emissions","Reduction in CO2 emissions (2030)","Production","Total CO2 emissions","Specific Emissions","Production","Total CO2 emissions","Specific Emissions","Reduction in CO2 emissions (2030)","Production","Total CO2 emissions","Specific Emissions","Production","Total CO2 emissions","Specific Emissions","Reduction in CO2 emissions (2030)","Production","Total CO2 emissions","Specific Emissions","Production","Total CO2 emissions","Specific Emissions","Reduction in CO2 emissions (2030)","Production","Total CO2 emissions","Specific Emissions","Production","Total CO2 emissions","Specific Emissions","Reduction in CO2 emissions (2030)","Production","Total CO2 emissions","Specific Emissions","Production","Total CO2 emissions","Specific Emissions","Reduction in CO2 emissions (2030)","Production","Total CO2 emissions","Specific Emissions","Production","Total CO2 emissions","Specific Emissions","Reduction in CO2 emissions (2030)","Losses","Total CO2 emissions","Specific Emissions","Losses","Total CO2 emissions","Specific Emissions","Reduction in CO2 emissions (2030)","Production","Total CO2 emissions","Specific Emissions","Production","Total CO2 emissions","Specific Emissions","Reduction in CO2 emissions (2030)","Production","Total CO2 emissions","Specific Emissions","Production","Total CO2 emissions","Specific Emissions","Reduction in CO2 emissions (2030)","BAU Emissions","BAU Emissions","BAU Emissions","BAU Emissions","BAU Emissions","BAU Emissions","BAU Emissions","BAU Emissions","BAU Emissions","BAU Emissions","BAU Emissions","BAU Emissions","BAU Emissions","BAU Emissions","ChangeWrtBAU","ChangeWrtBAU","ChangeWrtBAU","ChangeWrtBAU","ChangeWrtBAU","ChangeWrtBAU","ChangeWrtBAU","ChangeWrtBAU","ChangeWrtBAU","ChangeWrtBAU","ChangeWrtBAU","ChangeWrtBAU","ChangeWrtBAU","ChangeWrtBAU"],["Iron and Steel","Thermal Power Plant","Iron and Steel","Iron and Steel","Iron and Steel","Iron and Steel","Iron and Steel","Cement","Iron and Steel","Cement","Cement","Cement","Cement","Cement","Petroleum Refinery","Distribution Companies (DISCOMs)","Petroleum Refinery","Petroleum Refinery","Petroleum Refinery","Petroleum Refinery","Petroleum Refinery","Petrochemical","Cement","Petrochemical","Petrochemical","Petrochemical","Petrochemical","Petrochemical","Pulp and Paper","Petrochemical","Pulp and Paper","Pulp and Paper","Pulp and Paper","Pulp and Paper","Pulp and Paper","Textile","Petroleum Refinery","Textile","Textile","Textile","Textile","Textile","Chlor-Alkali","Fertilizer","Chlor-Alkali","Chlor-Alkali","Chlor-Alkali","Chlor-Alkali","Chlor-Alkali","Aluminium","Aluminium","Aluminium","Aluminium","Aluminium","Aluminium","Aluminium","Sugar","Pulp and Paper","Sugar","Sugar","Sugar","Sugar","Sugar","Fertilizer","Chlor-Alkali","Fertilizer","Fertilizer","Fertilizer","Fertilizer","Fertilizer","Thermal Power Plant","Textile","Thermal Power Plant","Thermal Power Plant","Thermal Power Plant","Thermal Power Plant","Thermal Power Plant","Distribution Companies (DISCOMs)","Dairy","Distribution Companies (DISCOMs)","Distribution Companies (DISCOMs)","Distribution Companies (DISCOMs)","Distribution Companies (DISCOMs)","Distribution Companies (DISCOMs)","Non-Ferrous","Sugar","Non-Ferrous","Non-Ferrous","Non-Ferrous","Non-Ferrous","Non-Ferrous","Dairy","Non-Ferrous","Dairy","Dairy","Dairy","Dairy","Dairy","Iron and Steel","Cement","Petroleum Refinery","Petrochemical","Pulp and Paper","Textile","Chlor-Alkali","Aluminium","Sugar","Fertilizer","Thermal Power Plant","Distribution Companies (DISCOMs)","Non-Ferrous","Dairy","Iron and Steel","Cement","Petroleum Refinery","Petrochemical","Pulp and Paper","Textile","Chlor-Alkali","Aluminium","Sugar","Fertilizer","Thermal Power Plant","Distribution Companies (DISCOMs)","Non-Ferrous","Dairy"],["MT","MtCO2","tCO2/tonne","MT","MtCO2","tCO2/tonne","MtCO2","MT","MtCO2","tCO2/tonne","MT","MtCO2","c","MtCO2","MT","MtCO2","tCO2/tonne","MT","MtCO2","tCO2/tonne","MtCO2","MT","MtCO2","tCO2/tonne","MT","MtCO2","tCO2/tonne","MtCO2","MT","MtCO2","tCO2/tonne","MT","MtCO2","tCO2/tonne","MtCO2","MT","MtCO2","tCO2/tonne","MT","MtCO2","tCO2/tonne","MtCO2","MT","MtCO2","tCO2/tonne","MT","MtCO2","tCO2/tonne","MtCO2","MT","MtCO2","tCO2/tonne","MT","MtCO2","tCO2/tonne","MtCO2","MT","MtCO2","tCO2/tonne","MT","MtCO2","tCO2/tonne","MtCO2","MT","MtCO2","tCO2/tonne","MT","MtCO2","tCO2/tonne","MtCO2","BU","MtCO2","tCO2/BU","BU","MtCO2","tCO2/BU","MtCO2","BU","MtCO2","tCO2/BU","BU","MtCO2","tCO2/BU","MtCO2","MT","MtCO2","tCO2/tonne","MT","MtCO2","tCO2/tonne","MtCO2","MT","MtCO2","tCO2/tonne","MT","MtCO2","tCO2/tonne","MtCO2","MtCO2","MtCO2","MtCO2","MtCO2","MtCO2","MtCO2","MtCO2","MtCO2","MtCO2","MtCO2","MtCO2","MtCO2","MtCO2","MtCO2","percent","percent","percent","percent","percent","percent","percent","percent","percent","percent","percent","percent","percent","percent"],["2019","2019","2019","2030","2030","2030","2030","2019","2019","2019","2030","2030","2030","2030","2019","2019","2019","2030","2030","2030","2030","2019","2019","2019","2030","2030","2030","2030","2019","2019","2019","2030","2030","2030","2030","2019","2019","2019","2030","2030","2030","2030","2019","2019","2019","2030","2030","2030","2030","2019","2019","2019","2030","2030","2030","2030","2019","2019","2019","2030","2030","2030","2030","2019","2019","2019","2030","2030","2030","2030","2019","2019","2019","2030","2030","2030","2030","2019","2019","2019","2030","2030","2030","2030","2019","2019","2019","2030","2030","2030","2030","2019","2019","2019","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030","2030"],[109.94,924.36,2.55,255,461.1,1.99,144,334,260,0.29,562,121,0.23,31.9,254.39,242.26,0.25,373,62.68,0.18,24.7,39.05,96.49,2.05,58.24,91.9,1.68,21.72,18.31,80.17,2.17,34.22,34.43,1.23,32.1,6.15,62.42,3.53,9.14,27.21,2.93,5.03,7.94,43.63,3.31,11.76,30.87,2.75,6.6,3.4,42.72,12.57,8.7,73.56,9.08,30.33,29.43,39.79,0.28,45.23,8.53,0.19,4.07,24.93,26.28,1.75,30.46,52.41,1.72,0.91,1058,21.69,0.87,1438,1229.3,0.86,14.38,282.17,9.74,0.86,451.24,287.49,0.64,99.93,2.02,8.11,1.72,2.02,2.85,1.41,0.62,192.42,3.47,0.051,339.85,13.56,0.04,3.64,605.1,152.9,87.38,113.62,66.53,32.24,37.47,103.89,12.6,53.32,1243.68,387.42,3.47,17.2,23.7977193852256,20.863309352518,28.2673380636301,19.1163527547967,48.2489102660454,15.6017369727047,17.6140912730184,29.1943401674848,32.3015873015873,1.70667666916729,1.15624597967323,25.793712250271,17.8674351585014,21.1627906976744]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>variable<\/th>\n      <th>sector<\/th>\n      <th>unit<\/th>\n      <th>year<\/th>\n      <th>value<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":5},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>

``` r
## Renaming sector names in GCAM data according to BEE data
gcamBau <- gcamBau %>%
  mutate(
    sector = mgsub::mgsub(sector,pattern = c("iron and steel","cement"," N fertilizer", "aluminum", "alumina", "electricityTPP", "refining", "electricity","N fertilizer"),
    replacement = c("Iron and Steel", "Cement", "Fertilizer", "Aluminium", "Aluminium", "Thermal Power Plant","Petroleum Refinery","Thermal Power Plant", "Fertilizer"))
    ) %>%
  select(-title)
```

### Creating constraint file for sectors in GCAM based on BEE targets.

Note that there are two methods for extrapolation - one based on linear
extrapolation of the reduction (compared to BAU). Other based on the
linear extrapolation of the trajectory.

``` r
# common sectors in GCAM and BEE
common <- unique(intersect(gcamBau$sector,bee_data$sector))

## Approach 1: Linear extrapolation of the reduction in emissions

target_lin_reduction <- bee_data %>% 
  filter(variable=="ChangeWrtBAU",sector %in% common) %>%
  select(sector,year,value,variable) %>% 
  mutate(year=as.numeric(year)) %>% 
  bind_rows(data.frame(sector = common,year=2020,value = 0,variable = "ChangeWrtBAU")) %>% 
  bind_rows(data.frame(
    sector = rep(common,5),
    year = c(2025,2035,2040,2045,2050),
    value=NA,
    variable= "ChangeWrtBAU")) %>% 
  arrange(year) %>% 
  group_by(sector) %>% 
  select(-variable) %>% 
  mutate(missing = Hmisc::approxExtrap(x = year,y = value,xout = c(2020,2025,2030,2035,2040,2045,2050),method = "linear",na.rm = T,)$y) %>% 
  select(-value) %>% 
   rename("target_percent"=missing) 

final_targets <- left_join(target_lin_reduction %>% mutate(year=as.numeric(year)),gcamBau %>% filter(variable=="emissions",sector %in% common) %>% select(sector,year,value) %>% rename("abs_emiss"=value) %>%  mutate(year=as.numeric(year)),by=c("sector","year")) %>% 
   mutate(value = (100-target_percent)*0.01,
          abs_emiss_target=value*abs_emiss,
          abs_emiss_reduct=abs_emiss-abs_emiss_target)

targets_to_write <- final_targets %>% select(sector,year,abs_emiss_target) %>% rename("value"=abs_emiss_target) %>% 
arrange(sector,year)

readr::write_csv(targets_to_write,"targets_BEE_app1.csv")
DT::datatable(final_targets)
```

<div id="htmlwidget-ed0e788043b30b425225" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-ed0e788043b30b425225">{"x":{"filter":"none","vertical":false,"data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42"],["Iron and Steel","Cement","Fertilizer","Aluminium","Thermal Power Plant","Petroleum Refinery","Iron and Steel","Petroleum Refinery","Thermal Power Plant","Aluminium","Fertilizer","Cement","Iron and Steel","Cement","Petroleum Refinery","Aluminium","Fertilizer","Thermal Power Plant","Cement","Iron and Steel","Petroleum Refinery","Thermal Power Plant","Aluminium","Fertilizer","Fertilizer","Cement","Iron and Steel","Petroleum Refinery","Thermal Power Plant","Aluminium","Aluminium","Fertilizer","Cement","Iron and Steel","Petroleum Refinery","Thermal Power Plant","Thermal Power Plant","Aluminium","Fertilizer","Cement","Iron and Steel","Petroleum Refinery"],[2020,2020,2020,2020,2020,2020,2025,2025,2025,2025,2025,2025,2030,2030,2030,2030,2030,2030,2035,2035,2035,2035,2035,2035,2040,2040,2040,2040,2040,2040,2045,2045,2045,2045,2045,2045,2050,2050,2050,2050,2050,2050],[0,0,0,0,0,0,11.8988596926128,14.1336690318151,0.578122989836614,14.5971700837424,0.853338334583646,10.431654676259,23.7977193852256,20.863309352518,28.2673380636301,29.1943401674848,1.70667666916729,1.15624597967323,31.294964028777,35.6965790778384,42.4010070954452,1.73436896950984,43.7915102512273,2.56001500375094,3.41335333833458,41.726618705036,47.5954387704512,56.5346761272602,2.31249195934646,58.3886803349697,72.9858504187121,4.26669167291823,52.158273381295,59.494298463064,70.6683451590753,2.89061494918307,3.46873793901968,87.5830205024545,5.12003000750188,62.589928057554,71.3931581556767,84.8020141908904],[94.88,49.5,10.7,0.96,350.52,11.17,120.93,17.46,471.72,2.34,11.54,63.3,149.72,78.18,26.44,4.59,12.1,618.76,92.88,183.16,36.03,787.63,7.7,11.52,10.27,106.22,220.15,48.13,963.95,11.44,13.31,8.82,88.66,159.8,63.37,794.18,591.76,14.41,7.7,80.77,116.25,81.32],[1,1,1,1,1,1,0.881011403073872,0.858663309681849,0.994218770101634,0.854028299162576,0.991466616654164,0.89568345323741,0.762022806147744,0.79136690647482,0.717326619363699,0.708056598325152,0.982933233308327,0.988437540203268,0.68705035971223,0.643034209221616,0.575989929045548,0.982656310304902,0.562084897487727,0.974399849962491,0.965866466616654,0.58273381294964,0.524045612295488,0.434653238727398,0.976875080406535,0.416113196650303,0.270141495812879,0.957333083270818,0.47841726618705,0.40505701536936,0.293316548409247,0.971093850508169,0.965312620609803,0.124169794975455,0.948799699924981,0.37410071942446,0.286068418443233,0.151979858091096],[94.88,49.5,10.7,0.96,350.52,11.17,106.540708973723,14.9922613870451,468.992878232343,1.99842622004043,11.441524756189,56.6967625899281,114.09005453644,61.8690647482014,18.9661158159762,3.24997978631245,11.8934921230308,611.605612376174,63.8132374100719,117.778145761031,20.7529171435111,773.96958968545,4.3280537106555,11.2250862715679,9.91944861215304,61.8979856115108,115.368641546852,20.9198603799496,941.65873375788,4.76033496967947,3.59558330926942,8.44367779444861,42.4164748201439,64.7281110560238,18.587469672694,771.223314196578,571.233396372057,1.7892867455963,7.30575768942236,30.2161151079137,33.2554536440258,12.359002059968],[0,0,0,0,0,0,14.3892910262766,2.46773861295491,2.72712176765731,0.341573779959572,0.0984752438109524,6.60323741007193,35.6299454635597,16.3109352517986,7.47388418402381,1.34002021368755,0.206507876969242,7.1543876238261,29.0667625899281,65.3818542389688,15.2770828564889,13.6604103145504,3.3719462893445,0.294913728432107,0.350551387846963,44.3220143884892,104.781358453148,27.2101396200504,22.2912662421202,6.67966503032053,9.71441669073058,0.376322205551388,46.2435251798561,95.0718889439762,44.782530327306,22.956685803422,20.5266036279429,12.6207132544037,0.394242310577645,50.5538848920863,82.9945463559742,68.960997940032]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>sector<\/th>\n      <th>year<\/th>\n      <th>target_percent<\/th>\n      <th>abs_emiss<\/th>\n      <th>value<\/th>\n      <th>abs_emiss_target<\/th>\n      <th>abs_emiss_reduct<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[2,3,4,5,6,7]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>

``` r
## Approach 2: Based on the linear inter and extrapolation of the resulting trajectory

# Calculating target emissions for GCAM in 2030
target_2030 <- left_join(bee_data %>% filter(variable=="ChangeWrtBAU", sector %in% common) %>% select(sector,year,value,variable) %>% select(-variable) %>% 
                           rename("target_percent"=value),
                      gcamBau %>%
                        filter(variable=="emissions",sector %in% common) %>% select(sector,year,value,variable) %>% select(-variable) %>% rename("abs_emiss"=value),
                      by=c("sector","year")) %>% 
  mutate(value = (100-target_percent)*0.01,
         abs_emiss_target=value*abs_emiss,
         abs_reduction=abs_emiss-abs_emiss_target) %>% 
  select(sector,year,abs_emiss_target) %>%
  rename("value"=abs_emiss_target) %>%
  mutate(year=as.numeric(year))

# creating empty df for additional years
target_missing <- data.frame(
  sector = rep(common,5), 
  year = c(2025,2035,2040,2045,2050), 
  value = NA)
              
# extracting 2020 results for linear interpolation between 2020 and 2030
gcam_2020 <- gcamBau %>%
  filter(year==2020,variable == "emissions",sector %in% common) %>%
  select(-Units,-scenario,-variable) %>%
  mutate(year=as.numeric(year))

# Filling missing years by linear interpolation and extrapolation
fill_missing <- bind_rows(gcam_2020,target_2030,target_missing) %>% 
  arrange(year) %>% 
group_by(sector) %>% 
  mutate(missing = Hmisc::approxExtrap(x = year,y = value,xout = c(2020,2025,2030,2035,2040,2045,2050),method = "linear",na.rm = T)$y) %>% 
  select(-value) %>%
    rename("value"=missing) %>% arrange(sector,year)

readr::write_csv(fill_missing,"targets_BEE_app2.csv")
```

#### Task 1a: Comparing emissions

``` r
gcam <- gcamBau %>% filter(sector %in% common,variable=="emissions", year %in% c(2015:2050)) %>% select(sector,year,value) %>% mutate(source="GCAM",value=value*3.667)

bee <- bee_data %>% filter(sector %in% common,variable=="Total CO2 emissions")%>% select(sector,year,value)%>% mutate(source="BEE") %>% mutate(source="BEE",year = gsub(year,pattern = 2019,replacement = 2020))

gcam_bee <- bind_rows(gcam,bee) %>% mutate(year=as.numeric(year),source=as.factor(source))

ggplot(gcam_bee)+
  geom_line(mapping = aes(x = year,y=value, group=interaction(sector,source), color=sector,linetype = source))+
  facet_wrap(~sector,scales = "free")+
   scale_color_lancet()+
  labs(x="",
       y= " Emissions (MT CO2)",
       subtitle = "Comparison of Emissions (GCAM NZ vs.BEE)",
       caption = "Note BEE data for 2020 is actually from 2019-20, for 2030 is from 2030-31")+
  theme_bw()+
  theme(axis.text.x = element_text(size = 6))
```

![](GCAMvsBEE_files/figure-gfm/unnamed-chunk-7-1.png)<!-- --> \#### Task
1b: Comparing production quantities

``` r
##Comparing Production

gcam <- gcamBau %>% filter(sector %in% common,variable=="production", year %in% c(2015:2045)) %>% select(sector,year,value,Units) %>% mutate(source="GCAM",value=if_else(sector=="Thermal Power Plant",value*277.78,value),Units = if_else(sector=="Thermal Power Plant","TWh",Units)) %>% rename("unit"=Units)

bee <- bee_data %>% filter(sector %in% common,variable=="Production") %>% select(sector,year,value,unit)%>% mutate(source="BEE",year = gsub(year,pattern = 2019,replacement = 2020))

gcam_bee <- bind_rows(gcam,bee)

ggplot(gcam_bee %>% filter(sector!="Petroleum Refinery"))+
  geom_line(mapping = aes(x = year,y=value, group=interaction(sector,source), color=sector,linetype = source))+
  facet_wrap(~sector,scales = "free")+
   scale_color_lancet()+
  labs(x="",
       y= " Production (MT) or TWh",
       subtitle = "Comparison of Production quantity (GCAM NZ vs.BEE)",
       caption = "Note BEE data for 2020 is actually from 2019-20, for 2030 is from 2030-31")+
  theme_bw()+
  theme(axis.text.x = element_text(size = 6))
```

![](GCAMvsBEE_files/figure-gfm/unnamed-chunk-8-1.png)<!-- --> \#### Task
2: Comparing trajectories BAU and ETS

``` r
#Comparing GCAM trajectory before and after targets
## App 1

gcamPlot <- gcamBau %>% filter(variable=="emissions",year<2055) %>% select(year,sector,value,scenario) %>% mutate(year=as.numeric(year))

targetPlot1 <- targets_to_write %>%  mutate(scenario="ETS_App1") %>% select(year,sector,value,scenario)

targetPlot2 <- fill_missing %>%  mutate(scenario="ETS_App2") %>% select(year,sector,value,scenario)

gcamPlot <- bind_rows(gcamPlot,targetPlot1) %>% 
  bind_rows(targetPlot2)

ggplot()+
  geom_line(gcamPlot,mapping=aes(x=year,y=value,color=sector,linetype=scenario))+
  facet_wrap(~sector,scales = "free")+
  theme_bw()+
  scale_color_lancet()+
  labs(x="",
       y="CO2 Emissions (MTC)",
       )+
  theme(axis.text.x = element_text(size = 6))
```

![](GCAMvsBEE_files/figure-gfm/unnamed-chunk-9-1.png)<!-- -->
