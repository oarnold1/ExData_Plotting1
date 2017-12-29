plot3 <- function(){
    
    #This function creates plot3 of the Week1 assignment
    
    #load the data (whole data, memore capacity is enough)
    household_data <- read.csv('household_power_consumption.txt', sep = ';', stringsAsFactors = FALSE, dec = '.')
    
    #convert the date format
    household_data$Date <- as.Date(household_data$Date, format = '%d/%m/%Y')
    
    #Select only the two dates 2007-02-01 and 2007-02-02
    Lvec <- household_data$Date == '2007-02-01' | household_data$Date == '2007-02-02'
    household_data <- household_data[Lvec, ]
    
    date_and_time <- strptime(paste(household_data$Date, household_data$Time, sep = " "), "%Y-%m-%d %H:%M:%S") 
    
    #create the plot    
    png(filename = './plot3.png', width = 480, height = 480)
    
    plot(date_and_time, as.numeric(household_data$Sub_metering_1), xlab = "", type = 'l', ylab = 'Energy sub metering', col = 'black')
    lines(date_and_time, as.numeric(household_data$Sub_metering_2), type = 'l', col = 'red')
    lines(date_and_time, as.numeric(household_data$Sub_metering_3), type = 'l', col = 'blue')
    legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1, col = c('black', 'red', 'blue'))
    
    dev.off()
}