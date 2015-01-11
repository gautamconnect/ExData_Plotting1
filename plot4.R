#Get data
source('get_data.R')

#Open PNG device
png(filename='plot4.png')

#Set the grid
par(mfrow=c(2,2))

#Top left plot
plot(power_data_df$Date_time, 
     power_data_df$Global_active_power,
     xlab='', 
     ylab='Global Active Power', 
     type='l')

#Top right plot
plot(power_data_df$Date_time, 
     power_data_df$Voltage,
     xlab='datetime', 
     ylab='Voltage', 
     type='l')

#Bottom left plot
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
       lty='solid', 
       bty='n')

#Bottom right plot
plot(power_data_df$Date_time, 
     power_data_df$Global_reactive_power,
     xlab='datetime', 
     ylab='Global_reactive_power', 
     type='l')

#Close device
dev.off()