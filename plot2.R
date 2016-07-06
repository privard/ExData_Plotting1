
makePlot2 <- function() {
    
    ## Read only the useful subset of the data
    ## We use a simple awk script to preparse the data file
    ## and extract rows between 2007/02/01 and 2007/02/02
    data <- read.csv(pipe("awk 'BEGIN {FS=\";\"} {if ($1 == \"1/2/2007\" || $1 == \"2/2/2007\") print $0}' household_power_consumption.txt"), sep = ';', col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    ## Create png file to hold the final drawing
    png(filename = 'plot2.png', width = 480, height = 480)
    
    ## Initialize plot and axis
    plot(data$Global_active_power, type='n', ylab = 'Global Active Power (kilowatts)', xlab = '', xaxt = 'n')
    axis(1, at=c(0, nrow(data)/2, nrow(data)), labels = c("Thu", "Fri", "Sat"))
    
    ## Add line drawing
    lines(data$Global_active_power)
    
    dev.off()
}

makePlot2()
