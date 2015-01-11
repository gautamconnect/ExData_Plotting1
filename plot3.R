#Get data
source('get_data.R')

#Open PNG device
png(filename='plot3.png')

#Make the plot
plot(power_data_df$Date_time, 
     power_data_df$Sub_metering_1, 
     xlab='', 
     ylab='Energy sub metering',
     type='l')

lines(power_data_df$Date_time, 
      power_data_df$Sub_metering_2, 
      col='red')

lines(power_data_df$Date_time, 
      power_data_df$Sub_metering_3, 
      col='blue')

legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid')

#Close device
dev.off()