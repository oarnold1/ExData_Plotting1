plot2 <- function(){
    
    #This function creates plot2 of the Week1 assignment
    
    #load the data (whole data, memore capacity is enough)
    household_data <- read.csv('household_power_consumption.txt', sep = ';', stringsAsFactors = FALSE, dec = '.')
    
    #convert the date format
    household_data$Date <- as.Date(household_data$Date, format = '%d/%m/%Y')
    
    #Select only the two dates 2007-02-01 and 2007-02-02
    Lvec <- household_data$Date == '2007-02-01' | household_data$Date == '2007-02-02'
    household_data <- household_data[Lvec, ]
    
    date_and_time <- strptime(paste(household_data$Date, household_data$Time, sep = " "), "%Y-%m-%d %H:%M:%S") 
    
    #create the plot    
    png(filename = './plot2.png', width = 480, height = 480)
    
    plot(date_and_time, as.numeric(household_data$Global_active_power), xlab = "", type = 'l', ylab = 'Global Active Power (kilowatts)')

    dev.off()
}