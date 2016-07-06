
makePlot1 <- function() {
    
    ## Read only the useful subset of the data
    ## We use a simple awk script to preparse the data file
    ## and extract rows between 2007/02/01 and 2007/02/02
    data <- read.csv(pipe("awk 'BEGIN {FS=\";\"} {if ($1 == \"1/2/2007\" || $1 == \"2/2/2007\") print $0}' household_power_consumption.txt"), sep = ';', col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    ## Create png file to hold the final drawing
    png(filename = 'plot1.png', width = 480, height = 480)
    
    ## Plot histogram
    hist(data$Global_active_power, main = 'Global Active Power', 
         xlab = 'Global Active Power (kilowatts)', col = 'red')
    
    dev.off()
}

makePlot1()

