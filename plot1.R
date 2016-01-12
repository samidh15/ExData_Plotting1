df <- read.csv('household_power_consumption.txt', sep = ';', header = TRUE)
filtered_df <- df[df$Global_active_power != '?',]
filtered_df_feb <- filtered_df[((filtered_df$Date == '1/2/2007') | (filtered_df$Date == '2/2/2007')),]
png(file = 'figure/plot1.png')
hist(as.numeric(as.character(filtered_df_feb$Global_active_power)), xlab = 'Global Active Power (kilowatts)', col = 'red', main = 'Global Active Power', axes=F)
axis(side = 2, at = c(seq(from=0,to=1200,by=200)))
axis(side = 1, at = c(0,2,4,6))
dev.off()
