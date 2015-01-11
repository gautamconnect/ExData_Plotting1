#Get data
source('get_data.R')

#Open PNG device
png(filename='plot1.png')

#Make the plot
hist(power_data_df$Global_active_power, 
     main='Global Active Power', 
     xlab='Global Active Power (kilowatts)', 
     col='red')

#Close device
dev.off()