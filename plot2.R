## Start plot2.R


## When loading the dataset into R, please consider the following:
## The dataset has 2,075,259 rows and 9 columns.
## We will only be using data from the dates 2007-02-01 and 2007-02-02.
## You may find it useful to convert the Date and Time variables
## to Date/Time classes in R using the strptime() and as.Date() functions.
## Missing values are coded as "?".


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


## Plot 2

## Create plot as a png file.

png(filename = "plot2.png",                                       ##Open Device
                width = 480,
                height = 480)

plot(FebOneTwo$Global_active_power~as.POSIXct(FebOneTwo$Time),    ##Plot 2
                type="l",
                xlab="",
                ylab="Global Active Power (kilowatts)")

dev.off()                                                         ##Close Device


## End plot2.R






