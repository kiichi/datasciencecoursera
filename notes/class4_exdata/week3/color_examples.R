library(datasets)

sl<-iris$Sepal.Length
sw<-iris$Sepal.Width
sepal<-data.frame(sl=sl,sw=sw)

# xy2.png
plot(sl,sw,col=c("red","blue","green")[iris$Species],pch=19,cex=3) 

# heat_color1.png
par(bg="lightgray")
plot(sl,sw,col=heat.colors(sl),pch=19,cex=3) 

# topo.png
plot(sl,sw,col=topo.colors(sl),pch=19,cex=3) 

#---------------------------------------------------
# Color Ramp - Color Palette Generator 
# It takes value between 0 and 1
# and it interpolate the color in between

cpal<-colorRamp(c("red","blue"))

# R G B

cpal(1)
# [,1] [,2] [,3]
# [1,]    0    0  255

cpal(0)
# [,1] [,2] [,3]
# [1,]  255    0    0

cpal(0.5)
# [,1] [,2]  [,3]
# [1,] 127.5    0 127.5

# color_ramp.png
plot(sl,sw,col=cpal(sl/max(sl)),pch=19,cex=3) 


#----------------------------------------------
# Color Ramp Palette - Hex code list generator
# This function takes the number of "Split" of colors
cpal2<-colorRampPalette(c("red","blue"))

# Give me 2 colors
cpal2(2)
#"#FF0000" "#0000FF"

# Give me 10 colors
cpal2(10)
# [1] "#FF0000" "#E2001C" "#C60038" "#AA0055" "#8D0071" "#71008D" "#5500AA" "#3800C6"
# [9] "#1C00E2" "#0000FF"


#-------------------------------------------------------------------
# RColorBrewer Library
library(RColorBrewer)
# For more details, see cpan_color_packages.png files from CPAN


colors <- brewer.pal(3, "BuGn")
# "#E5F5F9" "#99D8C9" "#2CA25F"
pale <- colorRampPalette(colors)

# See color1.png
image(volcano, col = pale(20))

# smooth.png
smoothScatter(sepal)












