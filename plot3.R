# Note: household_power_consumption.txt is stored in the 'data' directory, one level up from this R script file
# File tree structure as below:-
# ExData_Plotting1
# +--data
# |  +--household_power_consumption.txt
# |--plot3.R
# |

#  setwd("C:\\coursera\\ExData_Plotting1") -- pls ignore as it is for my testing on local machine

filename <- "./data/household_power_consumption.txt"
tb <- read.table(filename, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
tb_filtered <- tb[tb$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(tb_filtered$Date, tb_filtered$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
n_Sub_metering_1 <- as.numeric(tb_filtered$Sub_metering_1)
n_Sub_metering_2 <- as.numeric(tb_filtered$Sub_metering_2)
n_Sub_metering_3 <- as.numeric(tb_filtered$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, n_Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, n_Sub_metering_2, col="red")
lines(datetime, n_Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1), col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()