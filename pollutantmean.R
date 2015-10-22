pollutantmean <- function(directory="specdata", pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    files_list <- sprintf("%03d.csv", id)
    files_list <- paste(directory, files_list, sep="/")
    
    tmp <- vector(mode = "list", length = length(files_list))
    
    for(i in seq_along(id)) {
        tmp[[i]] <- read.csv(files_list[[i]])
    }
    output <- do.call(rbind, tmp)
    
    mean(output[,pollutant], na.rm = TRUE)
    
}