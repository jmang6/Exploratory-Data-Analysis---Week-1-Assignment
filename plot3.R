# Code to download and save .zip files for project

zipURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(zipURL, destfile = "~/GitHub/CourseraPersonalPC/Practical Assignment/Exploratory Data Analysis - Week 1 Practical Assignment/zipfile.zip")

# Code to unzip the .zip files for project

projectfiles <- "~/GitHub/CourseraPersonalPC/Practical Assignment/Exploratory Data Analysis - Week 1 Practical Assignment/zipfile.zip"
unzip(projectfiles)

# Code to read in all data and combine Date and Time variables

projectdata <- read.table("~/GitHub/CourseraPersonalPC/Practical Assignment/Exploratory Data Analysis - Week 1 Practical Assignment/household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?")
projectdata$Date <- as.Date(projectdata$Date, format = "%d/%m/%Y")

dataforplot <- subset(projectdata, Date >= "2007-02-01" & Date <= "2007-02-02")

dataforplot$DateTime <- as.POSIXct(as.character(paste(dataforplot$Date, dataforplot$Time)), format = "%Y-%m-%d %H:%M:%S")

# Histogram for specific date range and global active power

png("plot3.png", width = 480, height = 480)
with(dataforplot, plot(x = dataforplot$DateTime, y = dataforplot$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy Sub Metering"))
lines(x = dataforplot$DateTime, y = dataforplot$Sub_metering_2, type = "l", col = "red")
lines(x = dataforplot$DateTime, y = dataforplot$Sub_metering_3, type = "l", col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
dev.off()