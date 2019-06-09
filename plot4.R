# Plot 2

        library(lubridate)
        # read the dataset
        powerCon <- read.table("household_power_consumption.txt", 
                               header = TRUE,
                               sep = ";", 
                               na.strings = "?"
        )
        # coerce column1 to Date 
        powerCon$Date <- as.Date(powerCon$Date, "%d/%m/%Y")
        
        # Subset to get data only for 1-feb-2007 & 2-feb-2007
        powerPlot <- subset(powerCon,  Date == as.Date("2/2/2007", "%d/%m/%Y") | Date == as.Date("1/2/2007","%d/%m/%Y") )
        
        powerPlot$Datetime <- paste(powerPlot$Date,powerPlot$Time)
        powerPlot$Datetime <- ymd_hms(powerPlot$Datetime)
        #dev.set(jpeg)
        
        par(mfrow = c(2,2))
        # Plot top left
        plot(powerPlot$Global_active_power ~ powerPlot$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "",pch = 20)
        
        # Plot top right
        plot(powerPlot$Voltage ~ powerPlot$Datetime, type = "l", ylab = "Voltage", xlab = "",pch = 20)
        
        # Plot botton left
        with(powerPlot, plot( powerPlot$Datetime, powerPlot$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "",pch = 20) )
        points( powerPlot$Datetime, powerPlot$Sub_metering_2, type = 'l', col = "red")
        points( powerPlot$Datetime, powerPlot$Sub_metering_3, type = 'l', col = "blue")
        legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"), lty = 1 )
        
        # plot bottom right
        plot(powerPlot$Global_reactive_power ~ powerPlot$Datetime, type = "l", ylab = "Global_reactive_power", xlab = "",pch = 20)

        # Copy to jpeg
        dev.copy(jpeg, "plot4.jpeg", width = 500 )
        dev.off()