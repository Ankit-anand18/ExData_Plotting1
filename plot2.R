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
        
        par(lty = 1)
        plot(powerPlot$Global_active_power ~ powerPlot$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "",pch = 20)
        
        # Copy to jpeg
        dev.copy(jpeg, "plot2.jpeg")
        dev.off()