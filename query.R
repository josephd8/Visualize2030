### This script pulls the tables from the public datasets in
### BigQuery and sends them to a Google Storage bucket I created
### for this project. Because the datasets are large, the API
### cannot handle direct downloads, so I went this route and then
### downloaded directly from my bucket.

library(bigrquery)

project <- "visualize2030-216219"

tables <- list("`bigquery-public-data.world_bank_wdi.country_series_definitions`",
            "`bigquery-public-data.world_bank_wdi.country_summary`",
            "`bigquery-public-data.world_bank_wdi.footnotes`",
            "`bigquery-public-data.world_bank_wdi.indicators_data`",
            "`bigquery-public-data.world_bank_wdi.series_summary`",
            "`bigquery-public-data.world_bank_wdi.series_time`",
            "`bigquery-public-data.un_sdg.indicators`")


data <- lapply(tables, function(x){

  sql <- paste0("SELECT * FROM ",x)
  bigrquery::bq_project_query(project, sql)

})

names <- c("country_series","country_summary", "footnotes",
           "indicators_data", "series_summary", "series_time",
           "sdg_indicators")

for(i in 1:length(data)){
  
  nam <- paste0("gs://visualize2030/", names[i],".csv")
  bq_table_save(data[[i]], destination_uris = nam)
  
}
  
