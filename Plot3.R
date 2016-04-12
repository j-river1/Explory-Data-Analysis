#Open the files 
library(data.table)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Use subset for split the NEI by Baltimore, types and years

Split_Balt <- subset(NEI, NEI$fips == 24510)

# Values of emissions

Sum_Emissions <-as.data.table(Split_Balt)[, sum(Emissions), by = .(type, year)]
colnames(Sum_Emissions) <- c("Type", "Year", "Emissions")

# Year and Type convert to factor
Sum_Emissions$Year <- factor(Sum_Emissions$Year, levels = c("1999","2002","2005","2008"))
Sum_Emissions$Type <- factor(Sum_Emissions$Type)

# Plot the graphics
png("plot3.png")
ggplot(data=Sum_Emissions, aes(x=Year, y=Emissions, fill=Type)) + geom_bar(stat="identity", position=position_dodge())
dev.off()