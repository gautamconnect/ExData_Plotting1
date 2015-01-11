#Get data
source('get_data.R')

#Open PNG device
png(filename='plot2.png')

#Make the plot
plot(power_data_df$Date_time, 
     power_data_df$Global_active_power,
     ylab='Global Active Power (kilowatts)', 
     xlab='', 
     type='l')

#Close device
dev.off()