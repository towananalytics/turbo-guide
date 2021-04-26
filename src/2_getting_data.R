

# 1 - Load data - hello world example -------------------------------------

  data("mtcars")
  mtcars
  

# 2 - Load csv files ------------------------------------------------------

  # install.packages("readr")
  library(readr)
  
  dat <- read_csv()



# 3 - Download and extract data -------------------------------------------
  
  library(readr)

  # Create a list of web URLS to download the data
  urls <- c("https://www.data.brisbane.qld.gov.au/data/dataset/09a0fadf-1f4b-4ebc-ada1-34a78675be85/resource/15bc533a-efdb-4c13-8779-bb853b2eccf5/download/flood-creek-study-perrin-creek-metadata.csv",
            "https://www.stats.govt.nz/assets/Uploads/2018-Census-totals-by-topic/Download-data/2018-census-totals-by-topic-national-highlights-csv.zip")
  
    
   # Download
  for(i in 1:length(urls)){
    
    download.file(url = urls[i], here::here("data", basename(urls[i])))
    
    if(strsplit(basename(urls[i]), split="\\.")[[1]][2] == "zip"){
      
      unzip(here::here("data", basename(urls[i])), 
            exdir = here::here("data"))
      
    }
    
  }
  

  # Extract
  
  # Create an empty list object to extract the data into
  dat_list <- list()
  
  files_csv <- list.files(here::here("data"), pattern = ".csv$")
  
  # Now loop through the file names and extract to dat_list
  for(i in  1:length(files_csv)){
    
    dat_list[[i]] <- read_csv(here::here("data", files_csv[i]))
    names(dat_list)[i] <- gsub(".csv", "", files_csv[i])
    
  }
  
