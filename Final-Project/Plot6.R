#Open the files 
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Find the values of Vehicles
#Vehicles <-grepl("vehicle", SCC$SCC.Level.Two,) 
Vehicles <-grepl("Mobile.*Vehicles", SCC$EI.Sector)
Total_values <- SCC[Vehicles,] 

#Find the values from Vehicle combustion in NEI
#Base of datos, values.
Emissions <- NEI[NEI$SCC %in% Total_values$SCC, ]


#Find Baltimore
Baltimore <- subset(Emissions, fips == "24510")
Baltimore$city  <- "Baltimore City"

#Find Angeles
LosAngeles <- subset(Emissions, fips == "06037")
LosAngeles$city  <- "Angeles Country"

#Combine two plots
Combine <- rbind(Baltimore, LosAngeles)

#Plot

png("plot6.png")

ggplot(Combine, aes(x=factor(year), y=Emissions, fill=city)) +
 geom_bar(aes(fill=year),stat="identity") +
 facet_grid(scales="free", space="free", .~city) +
 guides(fill=FALSE) + theme_bw() +
 labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
 labs(title=expression("Motor Vehicle Source Emissions in Baltimore and Los Angeles"))

dev.off()










