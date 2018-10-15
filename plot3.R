plot3 <- function() {

  dataFile ="household_power_consumption.txt"

  # saving current locale
  lc_time = Sys.getlocale("LC_TIME")
  
  # setting locale to US for day of week like in example
  Sys.setlocale("LC_TIME","us")
  
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
  
  # converting date and time from string to date time value
  hpc_data$DateTime <- strptime(paste0(hpc_data$Date," ", hpc_data$Time), format = "%d/%m/%Y %H:%M:%S")
  
  # opening device PNG
  png(filename = "plot3.png", width = 480, height = 480)
  
  # making plot with first data
  plot(
    hpc_data$DateTime,
    hpc_data$Sub_metering_1,
    type="l", 
    ylab="Energy sub metering", 
    xlab = ""
  )
  # line for second data - red
  lines(
    hpc_data$DateTime, 
    hpc_data$Sub_metering_2, 
    col = "red"
  )
  # line for third data - blue
  lines(
    hpc_data$DateTime, 
    hpc_data$Sub_metering_3, 
    col = "blue"
  )
  # legend with lines
  legend(
    "topright", 
    lty = c(1,1,1), 
    col = c("black", "red", "blue"), 
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  )
  
  # closing device
  dev.off()

  # restoring locale
  Sys.setlocale("LC_TIME", lc_time)
  
}