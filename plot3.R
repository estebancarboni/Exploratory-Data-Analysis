df <- read.table("household_power_consumption.txt",
                 header = TRUE, 
                 sep = ";"
)

df2 <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

dt <- strptime(paste(df2$Date,
                     df2$Time, 
                     sep=" "),
               "%d/%m/%Y %H:%M:%S") 

sm1 <- as.numeric(df2$Sub_metering_1)
sm2 <- as.numeric(df2$Sub_metering_2)
sm3 <- as.numeric(df2$Sub_metering_3)

plot(dt,
     sm1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = ""
     )

lines(dt,
      sm2,
      type = "l",
      col = "red"
      )

lines(dt,
      sm3,
      type = "l",
      col = "blue"
      )

legend("topright",
       lty = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", 
                  "Sub_metering_2",
                  "Sub_metering_3"
                  )
       )

dev.copy(png, filename="plot3.png")
dev.off()