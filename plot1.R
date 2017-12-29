plot1 <- function(){
    
    #This function creates plot1 of the Week1 assignment
    
    #load the data (whole data, memore capacity is enough)
    household_data <- read.csv('household_power_consumption.txt', sep = ';', stringsAsFactors = FALSE, dec = '.')
    
    #convert the date format
    household_data$Date <- as.Date(household_data$Date, format = '%d/%m/%Y')
    
    #Select only the two dates 2007-02-01 and 2007-02-02
    Lvec <- household_data$Date == '2007-02-01' | household_data$Date == '2007-02-02'
    household_data <- household_data[Lvec, ]

    #create the plot    
    png(filename = './plot1.png', width = 480, height = 480)
    
    hist(as.numeric(household_data$Global_active_power), xlab = 'Global Active Power (kilowatts)', 
         col = 'red', main = 'Global Active Power')
    
    dev.off()
}