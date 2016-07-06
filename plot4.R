
makePlot4 <- function() {
    
    ## Read only the useful subset of the data
    ## We use a simple awk script to preparse the data file
    ## and extract rows between 2007/02/01 and 2007/02/02
    data <- read.csv(pipe("awk 'BEGIN {FS=\";\"} {if ($1 == \"1/2/2007\" || $1 == \"2/2/2007\") print $0}' household_power_consumption.txt"), sep = ';', col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    
    ## Create png file to hold the final drawing
    png(filename = 'plot4.png', width = 480, height = 480)
    
    ## Change global plotting settings for this session
    par(mfrow = c(2,2))
    
    ## Draw topleft graph
    plot(data$Global_active_power, type='n', ylab = 'Global Active Power', xlab = 'datetime', xaxt = 'n')
    axis(1, at=c(0, nrow(data)/2, nrow(data)), labels = c("Thu", "Fri", "Sat"))
    lines(data$Global_active_power)
    
    ## Draw topright graph
    plot(data$Voltage, type='n', ylab = 'Voltage', xlab = '', xaxt = 'n')
    axis(1, at=c(0, nrow(data)/2, nrow(data)), labels = c("Thu", "Fri", "Sat"))
    lines(data$Voltage)
    
    ## Draw bottom left graph
    plot(data$Sub_metering_1, type='n', ylab = 'Energy sub metering', xlab = '', xaxt = 'n')
    axis(1, at=c(0, nrow(data)/2, nrow(data)), labels = c("Thu", "Fri", "Sat"))

    lines(data$Sub_metering_1, col = 'black')
    lines(data$Sub_metering_2, col = 'red')
    lines(data$Sub_metering_3, col = 'blue')
    
    legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1, col = c('black','red', 'blue'), y.intersp = 1, text.width = 1400)
    
    ## Draw bottom right graph
    plot(data$Global_reactive_power, type='n', ylab = 'Global_reactive_power', xlab = 'datetime', xaxt = 'n')
    axis(1, at=c(0, nrow(data)/2, nrow(data)), labels = c("Thu", "Fri", "Sat"))
    lines(data$Global_reactive_power)
    
    dev.off()
}

makePlot4()