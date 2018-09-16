### Because the use of .csv's is extremely inefficient, I
### wrote this script to do one upload of the .csv's and then
### store them in a list that can be saved as one RDS object


##### Read Function #####
csv <- function(file){
  
  read.csv(file, header = FALSE, check.names = FALSE)
  
}


##### LOAD CSVs #####
footnotes <- csv("csv/footnotes.csv")
country_series <- csv("csv/country_series.csv")
country_summary <- csv("csv/country_summary.csv")
series_time <- csv("csv/series_time.csv")
series_summary <- csv("csv/series_summary.csv")
sdg_indicators <- csv("csv/sdg_indicators.csv")
indicators_data <- csv("csv/indicators_data.csv")


##### CREATE LIST #####
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


##### CLEAN DATA #####

for(i in 1:length(datasets)){
  
  dat <- get(names[i])
  
  dat[] <- lapply(dat,as.character)
  
  dat[,1] <- gsub("[{}]","",as.vector(dat[,c(1)]))
  dat[,ncol(dat)] <- gsub("[{}]","",as.vector(dat[,c(ncol(dat))]))
  
  colnams <- gsub(":.*","",unlist((dat[1,])))
  
  colnames(dat) <- colnams
  
  dat[] <- apply(dat, 2, function(x){
    
    gsub("^.+:","",x)
    
  })
  
  datasets[[i]] <- dat
  
}

##### SAVE #####
saveRDS(datasets, file = "datasets.Rds")

test <- readRDS("datasets.Rds")

