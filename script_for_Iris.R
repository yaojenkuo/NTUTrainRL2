# Revise to your own location of data
k_csv_wide <- read.csv("/Users/tkuo/Downloads/k.csv")

# Transforming from wide data to long data
library(tidyr)
k_csv_long <- gather(k_csv_wide, key = c_no, value = c_value, c1:c8)

# Give Q a new order
k_csv_long[, "Q"] <- factor(k_csv_long[, "Q"], levels = c("F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12", "F13", "F14", "F15", "F16", "F17", "F18", "F19", "F20"))

# Draw a plot
library(ggplot2)
plot_facet_wrap <- ggplot(k_csv_long, aes(x = Q, y = c_value, fill = c_no)) + geom_bar(stat = "identity") + facet_wrap(~ c_no, ncol = 4) + coord_flip() + guides(fill = FALSE)
plot_facet_wrap