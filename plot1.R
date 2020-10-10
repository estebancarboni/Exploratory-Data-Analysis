df <- read.table("household_power_consumption.txt",
                 sep = ";", 
                 header = TRUE)
df$Date <- strptime(as.character(df$Date), "%d/%m/%Y")

df2 <- subset(df, df$Date== "2007-02-01" | df$Date== "2007-02-02")

hist(as.numeric(df2$Global_active_power), 
     main= "Global Active Power", 
     xlab= "Global Active Power (kilowatts)", 
     col="red")

dev.copy(png, filename="plot1.png")
dev.off()