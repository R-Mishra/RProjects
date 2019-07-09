## This corr() will take as its input 
## 1. the working directory where the files are stored
## 2. The threshold value below which correlation will not be calculated
## It will also call complete() to check if the no. of observations of a monitor meets 
## the required threshold

corr <- function(directory = "./specdata",threshold = 150)
{
  ## make a list of file path names 
  temp <- list.files(path = directory, pattern = "*.csv", full.names = TRUE)
  
  ## define a vector whihc will take values of the correlation 
  corr_vector <- c(0)
  
  ## Set a counter to keep track of the vector index that needs to be filled
  count = 1
  
  for(i in 1:332)
  {
    ## The variable test will store the output of complete() and check it against threshold
    test <- complete(directory,i)
    if (threshold <= test$no_obs) 
      
    ## The data will be read from the file and correlation evaluated
    {
      temp_data <- read.csv(temp[i])
      corr_vector[count] <- cor(temp_data[,2],temp_data[,3], use = "complete.obs")
      count = count + 1
    }
  }

  corr_vector
}