# Library and Reading CSVs ----------------------------------------------
library(tidyverse)

prm_data <- read_csv("data/knb-lter-luq.20.4923064/RioMameyesPuenteRoto.csv")
bq1_data <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca1-Bisley.csv")
bq2_data <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca2-Bisley.csv")
bq3_data <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca3-Bisley.csv")


# Pulling out columns for figure -----------------------------------------
prm <- prm_data |>
  select("Sample_ID", "Sample_Date", "NO3-N", "Mg", "Ca", "NH4-N") |>
  glimpse()
bq1 <- bq1_data |>
  select("Sample_ID", "Sample_Date", "NO3-N", "Mg", "Ca", "NH4-N") |>
  glimpse()
bq2 <- bq2_data |>
  select("Sample_ID", "Sample_Date", "NO3-N", "Mg", "Ca", "NH4-N") |>
  glimpse()
bq3 <- bq3_data |>
  select("Sample_ID", "Sample_Date", "NO3-N", "Mg", "Ca", "NH4-N") |>
  glimpse()


# Combining 4 subsetted dataframes ---------------------------------------

data <- combined <- rbind(prm, bq1, bq2, bq3) |>
  pivot_longer(3:6) |>
  glimpse() |>
  rename(chemical = name) |>
  glimpse()

# Plotting ---------------------------------------------------------------
data |>
  ggplot(
    mapping = aes(x = Sample_Date, y = value)
  ) +
  geom_line() +
  theme_bw() +
  facet_wrap(~chemical, ncol = 1, scales = "free_y")

##### Need to implement the 9-day moving average!!!

#### EDITING FILE LOCALLY!!!!
