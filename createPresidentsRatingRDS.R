# create presidentsRating.rds for lecturing use
library(ggplot2)
str(presidents)

# Convert presidents into a dataframe
presidentsRating <- data.frame(
  rating = as.numeric(presidents),
  year = as.numeric(floor(time(presidents))),
  quarter = as.numeric(cycle(presidents))
)
str(presidentsRating)

# Output as RDS file
saveRDS(presidentsRating, "C:/NTUTrainRL2/data/presidentsRating.rds")
