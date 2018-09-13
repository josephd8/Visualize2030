### Because the use of .csv's is extremely inefficient, I
### wrote this script to do one upload of the .csv's and then
### store them in a list that can be saved as one RDS object



csv <- function(file){
  
  read.csv(file, header = TRUE, check.names = FALSE)
  
}

footnotes <- csv("footnotes.csv")
country_series <- csv("country_series.csv")
country_summary <- csv("country_summary.csv")
series_time <- csv("series_time.csv")
series_summary <- csv("series_summary.csv")
sdg_indicators <- csv("sdg_indicators.csv")
indicators_data <- csv("indicators_data.csv")

datasets <- list(footnotes,
                 country_series,
                 country_summary,
                 series_time,
                 series_summary,
                 sdg_indicators,
                 indicators_data)

names <- c("footnotes", "country_series",
           "country_summary", 
           "series_time", 
           "series_summary",
           "sdg_indicators",
           "indicators_data")

names(datasets) <- names

saveRDS(datasets, file = "datasets.Rds")

test <- readRDS("datasets.Rds")

