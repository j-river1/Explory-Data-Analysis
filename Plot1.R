#Open the files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#You use this code or just use the function tapply
#Get the values of PM2.5 of years 1999, 2002, 2005 and 2008

PM25_1999 <- sum(subset(NEI, year == 1999, Emissions))
PM25_2002 <- sum(subset(NEI, year == 2002, Emissions))
PM25_2005 <- sum(subset(NEI, year == 2005, Emissions))
PM25_2008 <- sum(subset(NEI, year == 2008, Emissions))

#Plot the graphic

y <- c(PM25_1999, PM25_2002, PM25_2005, PM25_2008)
x <- c(1999, 2002, 2005, 2008)

png("plot1.png")
barplot(y, x, names.arg = x, col="blue", main= expression('Total Emission of PM'[2.5]*' in U.S.'), ylab = expression('Emission of PM'[2.5]*' (tons)'))
dev.off()
