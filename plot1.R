# Plot 1
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
        # Plot Histogram
        hist(powerPlot$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
        
        # Copy to jpeg
        dev.copy(jpeg, "plot1.jpeg")
        dev.off()

