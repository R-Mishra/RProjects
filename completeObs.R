## The function complete will take as its input
## 1. The directory containing the .csv files
## 2. An integer vector containing the ids corresponding to which data is to be read
## and, return a data frame containing the number of complete observation 
## for the asked monitor

complete <- function(directory= "./specdata", id = 1:332) ## function definition 
{
  
  ## make a list of file path names 
  temp <- list.files(path = directory, pattern = "*.csv", full.names = TRUE)
  
  ## Define the data frame in which the output will be stored
  no_of_obs <- data.frame()
  
  for(i in id)
  {
    ## extract data for each id from the list of file names in temp
    temp_data <- read.csv(temp[i])
    
    ## count the number of complete observations
    complete_obs <- sum((!is.na(temp_data[,2])) & (!is.na(temp_data[,3])))
    
    ## Display the complete observations
    no_of_obs <-rbind(no_of_obs,data.frame(id = i, no_obs = complete_obs))
  }
  
  no_of_obs
}