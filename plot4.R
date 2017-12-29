plot4 <- function(){
    
    #This function creates plot4 of the Week1 assignment
    
    #load the data (whole data, memore capacity is enough)
    household_data <- read.csv('household_power_consumption.txt', sep = ';', stringsAsFactors = FALSE, dec = '.')
    
    #convert the date format
    household_data$Date <- as.Date(household_data$Date, format = '%d/%m/%Y')
    
    #Select only the two dates 2007-02-01 and 2007-02-02
    Lvec <- household_data$Date == '2007-02-01' | household_data$Date == '2007-02-02'
    household_data <- household_data[Lvec, ]
    
    date_and_time <- strptime(paste(household_data$Date, household_data$Time, sep = " "), "%Y-%m-%d %H:%M:%S") 
    
    #create the plot    
    png(filename = './plot4.png', width = 480, height = 480)
    
    par(mfrow = c(2, 2))
    
    
    #1
    plot(date_and_time, as.numeric(household_data$Global_active_power), xlab = "", type = 'l', ylab = 'Global Active Power')
    
    #2 (it's actually bad to plot Voltage without units, but the default plot shows this in this way)
    plot(date_and_time, as.numeric(household_data$Voltage), xlab = "datetime", type = 'l', ylab = 'Voltage')
    
    #3
    plot(date_and_time, as.numeric(household_data$Sub_metering_1), xlab = "", type = 'l', ylab = 'Energy sub metering', col = 'black')
    lines(date_and_time, as.numeric(household_data$Sub_metering_2), type = 'l', col = 'red')
    lines(date_and_time, as.numeric(household_data$Sub_metering_3), type = 'l', col = 'blue')
    legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1, bty = 'n', col=c('black', 'red', 'blue'))
    
    #4
    plot(date_and_time, as.numeric(household_data$Global_reactive_power), xlab = "", type = 'l', ylab = 'Global_reactive_power')
    
    dev.off()
}