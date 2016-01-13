df <- read.csv('household_power_consumption.txt', sep = ';', header = TRUE)
filtered_df <- df[df$Global_active_power != '?',]
filtered_df_feb <- filtered_df[((filtered_df$Date == '1/2/2007') | (filtered_df$Date == '2/2/2007')),]
z<- paste(as.character(filtered_df_feb$Date), as.character(filtered_df_feb$Time))
Days <- weekdays(as.Date(strptime(z, "%d/%m/%Y %H:%M:%S")), abbreviate = TRUE)
x<-c(seq(from=1,to=length(Days)))
thursday_index <- which(Days %in% c("Thu"))[1]
friday_index <- which(Days %in% c("Fri"))[1]
png(file = 'figure/plot4.png')
par(mfrow=c(2,2))
###Global Active
plot(x, as.numeric(as.character(filtered_df_feb$Global_active_power)), type="l", ylab = 'Global Active Power (kilowatts)', xlab = "", xaxt='n')
axis(1, at=c(thursday_index, friday_index, length(x)), labels=c("Thu", "Fri", "Sat"))
###Voltage
plot(x, as.numeric(as.character(filtered_df_feb$Voltage)), type="l", xlab='datetime', ylab = 'Voltage', xaxt='n')
axis(1, at=c(thursday_index, friday_index, length(x)), labels=c("Thu", "Fri", "Sat"))
####SubRating
plot(x, as.numeric(as.character(filtered_df_feb$Sub_metering_1)), col = "black" , type ='l', ylab = 'Energy sub metering', yaxt='n', xlab="", xaxt='n')
axis(2, at=c(0,10,20,30), labels = c('0', '10', '20', '30'))
axis(1, at=c(thursday_index, friday_index, length(x)), labels=c("Thu", "Fri", "Sat"))
lines(x, as.numeric(as.character(filtered_df_feb$Sub_metering_2)), col = "red")
lines(x, as.numeric(as.character(filtered_df_feb$Sub_metering_3)), col = "blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
###Global ReActive Power
plot(x, as.numeric(as.character(filtered_df_feb$Global_reactive_power)), type="l", xlab='datetime', ylab = 'Global_reactive_power', xaxt='n', yaxt='n')
axis(2, at=c(seq(from=0.0,to=0.6, by=0.1)), labels = c('0.0', '0.1', '0.2', '0.3', '0.4', '0.5', '0.6'))
axis(1, at=c(thursday_index, friday_index, length(x)), labels=c("Thu", "Fri", "Sat"))
dev.off()
