## A function that takes as its input, 
## 1. The directory which contains the files
## 2. The pollutant for which the calculation is to be done
## 3. The id of the computer systems recording the data
## And, returns the mean pollutant value across the desired computer systems
pollutantmean <- function (directory = "./specdata",pollutant = "sulfate",id = 1:332)
{
  ## The list temp stores the name and path of the files in the directory specified  
  temp <- list.files(path =directory, pattern = "*.csv", full.names = TRUE)
  total_pollutant <- 0
  instances <- 0
  ## A for loop is used to read data from the files corresponding to the id vlaue
  ## The id value points to the file path in the list temp
  ## Once a data set is read, the sum of the required pollutant and the number 
  ## instance is stored in the variables total_pollutant and instances respectively
  for(val in id)
  {
    temp_data <- read.csv(temp[val]) 
    ## Pollutant values which are not NA are considered next 
    total_pollutant <- total_pollutant + 
      sum(temp_data[!is.na(temp_data[,pollutant]),pollutant])
    instances <- instances + sum(!is.na(temp_data[,pollutant]))
  }
  mean_pollutant <- total_pollutant/instances
  mean_pollutant
}