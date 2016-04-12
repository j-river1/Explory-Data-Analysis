#Open the files 
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Find the combustion related sources from Coal
#Position 
Coal <-grepl("Fuel Comb.*Coal", SCC$EI.Sector)

#Total values from Coal in SCC.
Total_values <- SCC[Coal,]

#Find the values from coal combustion in NEI
#Base of datos, values.
Emissions <- NEI[NEI$SCC %in% Total_values$SCC, ]
EmissionsYear <- aggregate(Emissions ~ year, data= Emissions, FUN = sum)

#Plot 
png("plot4.png")
ggplot(EmissionsYear , aes(x=factor(year), y=Emissions) ) +
    geom_bar(stat="identity", fill="blue") +
    xlab("Year") +
    ylab(expression('Total Emission of PM'[2.5]*' (tons)')) +
    ggtitle("Emissions from Coal Related sources")
dev.off()