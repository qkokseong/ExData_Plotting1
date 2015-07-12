# Note: household_power_consumption.txt is stored in the 'data' directory, one level up from this R script file
# File tree structure as below:-
# ExData_Plotting1
# +--data
# |  +--household_power_consumption.txt
# |--plot1.R
# |

#  setwd("C:\\coursera\\ExData_Plotting1") -- pls ignore as it is for my testing on local machine

filename <- "./data/household_power_consumption.txt"
tb <- read.table(filename, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
tb_filtered <- tb[tb$Date %in% c("1/2/2007","2/2/2007") ,]

n_global_active_power <- as.numeric(tb_filtered$Global_active_power)

png("plot1.png", width=480, height=480)
hist(n_global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()