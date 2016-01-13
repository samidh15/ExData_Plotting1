df <- read.csv('household_power_consumption.txt', sep = ';', header = TRUE)
filtered_df <- df[df$Global_active_power != '?',]
filtered_df_feb <- filtered_df[((filtered_df$Date == '1/2/2007') | (filtered_df$Date == '2/2/2007')),]
z<- paste(as.character(filtered_df_feb$Date), as.character(filtered_df_feb$Time))
Days <- weekdays(as.Date(strptime(z, "%d/%m/%Y %H:%M:%S")), abbreviate = TRUE)
x<-c(seq(from=1,to=length(Days)))
thursday_index <- which(Days %in% c("Thu"))[1]
friday_index <- which(Days %in% c("Fri"))[1]
png(file = 'figure/plot2.png')
plot(x, as.numeric(as.character(filtered_df_feb$Global_active_power)), type="l", ylab = 'Global Active Power (kilowatts)', xlab = "", xaxt='n')
axis(1, at=c(thursday_index, friday_index, length(x)), labels=c("Thu", "Fri", "Sat"))
dev.off()
