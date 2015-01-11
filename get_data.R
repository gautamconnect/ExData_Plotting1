library(lubridate)

#This code checks if the data has been saved from earlier downloads.
#If not, it will download fresh zip file, unzip it, extract and save relevant data as RDS file
#If the data exists, the code will use the existing file
if (!file.exists('household_data.rds')) {
        #Fetch data
        download.file(paste0('https://d396qusza40orc.cloudfront.net/',
                             'exdata%2Fdata%2Fhousehold_power_consumption.zip'),
                        method='curl', 
                        destfile='household_raw_data.zip')
        
        #Unzip the data
        unzip('household_raw_data.zip')
        
        #Read data file
        power_data_df <- read.table('household_power_consumption.txt', header=TRUE,
                                    sep=';', 
                                    na.strings='?',
                                    colClasses=c(rep('character', 2), 
                                                 rep('numeric', 7)))
        
        #Convert Date and Time columns
        power_data_df$Date <- dmy(power_data_df$Date)
        power_data_df$Time <- hms(power_data_df$Time)
        
        #Extract relevant data
        start <- ymd('2007-02-01')
        end <- ymd('2007-02-02')
        power_data_df <- subset(power_data_df, 
                                year(Date) == 2007 & 
                                month(Date) == 2 &
                                (day(Date) == 1 | day(Date) == 2))
        
        #Combine Date and Time columns
        power_data_df$Date_time <- power_data_df$Date + power_data_df$Time
        
        #Save file
        saveRDS(power_data_df, file='household_data.rds')
        
        #Remove the unzipped data
        file.remove('household_power_consumption.txt')
        
        #Remove zipped data
        file.remove('household_raw_data.zip')
} else {
        power_data_df <- readRDS('household_data.rds')
}