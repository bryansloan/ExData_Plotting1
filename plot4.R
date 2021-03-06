## Start plot4.R


## When loading the dataset into R, please consider the following:
## The dataset has 2,075,259 rows and 9 columns.
## We will only be using data from the dates 2007-02-01 and 2007-02-02.
## You may find it useful to convert the Date and Time variables
## to Date/Time classes in R using the strptime() and as.Date() functions.
## Missing values are coded as ?.


## Read the Dataset from the current working directory.
## Use data from 2007-02-01 and 2007-02-02.
## Missing values are coded as "?".

FebOneTwo <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),
                        header=FALSE,
                        sep=';')


## Correct the column headings

colnames(FebOneTwo) <-names(read.table('household_power_consumption.txt',
                            header=TRUE,
                            sep=";",nrows=1))


## Convert Date and Time columns to Date/Time Class.

FebOneTwo$Time <- strptime(paste(FebOneTwo$Date, FebOneTwo$Time), "%d/%m/%Y %H:%M:%S")
FebOneTwo$Date <- as.Date(FebOneTwo$Date, "%d/%m/%Y")


## Making Plots
## Examine how household energy usage varies over 2-days in February 2007.
## Reconstruct project plots using the base plotting system.
## Construct the plot and save it to a PNG file
## Plot width is 480 pixels and the height is 480 pixels.
## Name each of the plot files as plot1.png, plot2.png, etc.


## Plot 4

## Create plot as a png file.

png(filename = "plot4.png",                                       ##Open Device
                width = 480,
                height = 480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))                 ##2 Col/2 Rows

plot(FebOneTwo$Global_active_power~as.POSIXct(FebOneTwo$Time),    ##First Plot
     type="l",
     xlab="",
     ylab="Global Active Power")

plot(FebOneTwo$Voltage~as.POSIXct(FebOneTwo$Time),                ##Second Plot
     type="l",
     xlab="datetime",
     ylab="Voltage")

plot(FebOneTwo$Sub_metering_1~as.POSIXct(FebOneTwo$Time),         ##Third Plot
     type="l",
     xlab="",
     ylab="Energy sub metering")

lines(FebOneTwo$Sub_metering_2~as.POSIXct(FebOneTwo$Time),col='Red')  ##Add Data

lines(FebOneTwo$Sub_metering_3~as.POSIXct(FebOneTwo$Time),col='Blue') ##Add Data

legend("topright", col=c("black", "red", "blue"),                 ##Add Legend
       lty=1,
       lwd=2,
       bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(FebOneTwo$Global_reactive_power~as.POSIXct(FebOneTwo$Time),  ##Fourth Plot
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()                                                         ##Close Device


## End plot4.R






