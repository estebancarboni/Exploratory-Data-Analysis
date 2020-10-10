df <- read.table("household_power_consumption.txt",
                   header = TRUE, 
                   sep = ";"
                 )

df2 <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

dt <- strptime(paste(df2$Date,
                     df2$Time, 
                     sep=" "),
               "%d/%m/%Y %H:%M:%S") 

plot(dt, 
     as.numeric(df2$Global_active_power), 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.copy(png, filename="plot2.png")
dev.off()