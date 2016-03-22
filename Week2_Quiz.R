#Quiz 2
# 1. Under the lattice graphics system, what do the primary plotting functions like xyplot() and bwplot() return?
#    Answer: an object of class "trellis"
#
# 2. What is produced by the following code?
library(nlme)
library(lattice)
png("Plot_Quiz_2_Question2.png")
xyplot(weight ~ Time | Diet, BodyWeight)
dev.off()
#    Answer: A set of 3 panels showing the relationship between weight and time for each diet.
#    This plot is saved as Plot_Quiz_2_Question2
#
#3.  Annotation of plots in any plotting system involves adding points, lines, or text to the plot, in addition 
#    to customizing axis labels or adding titles. Different plotting systems have different sets of functions 
#    for annotating plots in this way.
#    Which of the following functions can be used to annotate the panels in a multi-panel lattice plot?
#    Answer: panel.lmline() or lpoints
#
#4. The following code does NOT result in a plot appearing on the screen device.
library(lattice)
library(datasets)
data(airquality)
png("Plot_Quiz_2_Question4.png")
p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)
print(p)
dev.off()
#    Answer: The object 'p' has not yet been printed with the appropriate print method.
#    We can use the function print. This plot is saved as Plot_Quiz_2_Question4
#
#5. In the lattice system, which of the following functions can be used to finely control the appearance of all lattice plots?
#   Answer: trellis.par.set()
#
#6. What is ggplot2 an implementation of?
#   Answer: the Grammar of Graphics developed by Leland Wilkinson
#7. Load the `airquality' dataset form the datasets package in R
library(datasets)
data(airquality)
#   I am interested in examining how the relationship between ozone and wind speed varies across each month. 
#   What would be the appropriate code to visualize that using ggplot2?
#   Answer: 
png("Plot_Quiz_2_Question7.png")
airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)
dev.off()
#   This plot is saved as Plot_Quiz_2_Question7
#
#8. What is a geom in the ggplot2 system?
#   Answer: a plotting object like point, line, or other shape
#
#9. When I run the following code I get an error:
library(ggplot2)
library(ggplot2movies)
g <- ggplot(movies, aes(votes, rating))
print(g)
#   I was expecting a scatterplot of 'votes' and 'rating' to appear. What's the problem?  
#   Answer: ggplot does not yet know what type of layer to add to the plot.
#   For example,we can use the geom_point
png("Plot_Quiz_2_Question9.png")
g <- ggplot(movies, aes(votes, rating)) + geom_point()
print(g)
dev.off()
#
#10. The following code creates a scatterplot of 'votes' and 'rating' 
#    from the movies dataset in the ggplot2 package.
#    After loading the ggplot2 package with the library() function, I can run
qplot(votes, rating, data = movies)
#    How can I modify the the code above to add a smoother to the scatterplot?
png("Plot_Quiz_2_Question10.png")
qplot(votes, rating, data = movies) + geom_smooth()
dev.off()


