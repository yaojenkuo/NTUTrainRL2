# To test the display of Chinese characters in R's plotting system
# Base Plotting System
plot(x = cars$speed, y = cars$dist, main = "測試中文字型顯示", family = "STHeiti")

# ggplot2
#install.packages("ggplot2")
library(ggplot2)
ggplot(cars, aes(x = cars$speed, y = cars$dist)) + geom_point() + ggtitle("測試中文字型顯示") + xlab("速度") + ylab("距離") + theme(text = element_text(family = "STHeiti"))