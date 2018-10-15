plot1 <- function() {

  dataFile ="household_power_consumption.txt"
  
  # reading data file
  hpc_data <- read.delim(
    dataFile, 
    sep = ";", 
    na.strings = "?", 
    as.is = TRUE,  
    comment.char = "", 
    skip = 66636, # starting line for 2007-02-01
    nrows = 2880, # 24*60*2 - dwo days 1 line per minute
    col.names = colnames(read.delim(dataFile, sep = ";", skip = 0, nrows = 1)) # colnames by 1 row from same file
  )
  
  # opening device PNG
  png(filename = "plot1.png", width = 480, height = 480)
  
  # histogram
  hist(
    hpc_data$Global_active_power, 
    col = "red", 
    xlab = "Global Active Power (kilowatts)", 
    main = "Global Active Power"
  )
  
  # closing device
  dev.off()
  
}