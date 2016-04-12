#Open the files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Find the values of Vehicles
Vehicles <-grepl("Mobile.*Vehicles", SCC$EI.Sector)
Total_values <- SCC[Vehicles,] 

#Find the values from Vehicle combustion in NEI
#Base of datos, values.
Emissions <- NEI[NEI$SCC %in% Total_values$SCC, ]

#Find Baltimore
Baltimore <- subset(Emissions, fips == 24510)

EmissionsYear <- aggregate(Emissions ~ year, data= Baltimore, FUN = sum)

png("plot5.png")
ggplot(EmissionsYear , aes(x=factor(year), y=Emissions) ) +
    geom_bar(stat="identity", fill="blue") +
    xlab("Year") +
    ylab(expression('Total Emission of PM'[2.5]*' (tons)')) +
    ggtitle("Emissions from Vehicle Related sources Baltimore")
dev.off()