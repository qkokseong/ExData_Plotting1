# Note: household_power_consumption.txt is stored in the 'data' directory, one level up from this R script file
# File tree structure as below:-
# ExData_Plotting1
# +--data
# |  +--household_power_consumption.txt
# |--plot2.R
# |

#  setwd("C:\\coursera\\ExData_Plotting1") -- pls ignore as it is for my testing on local machine

filename <- "./data/household_power_consumption.txt"
tb <- read.table(filename, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
tb_filtered <- tb[tb$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(tb_filtered$Date, tb_filtered$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
n_global_active_power <- as.numeric(tb_filtered$Global_active_power)

png("plot2.png", width=480, height=480)
plot(datetime, n_global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()