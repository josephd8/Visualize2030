datasets <- readRDS("datasets.Rds")

library(tidyverse)

country_series <- as_tibble(datasets$country_series)
country_summary <- as_tibble(datasets$country_summary)
footnotes <- as_tibble(datasets$footnotes)
series_time <- as_tibble(datasets$series_time)
series_summary <- as_tibble(datasets$series_summary)
indicators <- as_tibble(datasets$indicators_data)
sdg <- as_tibble(datasets$sdg_indicators)

View(country_series)
View(country_summary)
View(footnotes)
View(series_time)
View(series_summary)
View(indicators)
View(sdg)

##### Footnotes #####

dim(footnotes)
colnames(footnotes)

unique(footnotes$year)


##### Country Series #####



##### Country Summary #####



##### Series Time #####



##### Series Summary #####



##### Indicators Data #####



##### SDG Indicators #####
