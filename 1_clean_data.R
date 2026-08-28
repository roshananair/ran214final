# Library and Reading .CSVs
library(tidyverse)
source("R/moving-average.R")

prm_data <- read_csv("data/knb-lter-luq.20.4923064/RioMameyesPuenteRoto.csv")
bq1_data <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca1-Bisley.csv")
bq2_data <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca2-Bisley.csv")
bq3_data <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca3-Bisley.csv")


# Pulling out columns needed for analysis and figure
prm <- prm_data |>
  select("Sample_ID", "Sample_Date", `NO3-N`, "Mg", "Ca", `NH4-N`, "K") |>
  glimpse()
bq1 <- bq1_data |>
  select("Sample_ID", "Sample_Date", `NO3-N`, "Mg", "Ca", `NH4-N`, "K") |>
  glimpse()
bq2 <- bq2_data |>
  select("Sample_ID", "Sample_Date", `NO3-N`, "Mg", "Ca", `NH4-N`, "K") |>
  glimpse()
bq3 <- bq3_data |>
  select("Sample_ID", "Sample_Date", `NO3-N`, "Mg", "Ca", `NH4-N`, "K") |>
  glimpse()


# Finding moving averages for each site
ma_prm <- moving_average(site_data = prm)
ma_bq1 <- moving_average(site_data = bq1)
ma_bq2 <- moving_average(site_data = bq2)
ma_bq3 <- moving_average(site_data = bq3)


# Combining moving average frames by row
combined <- bind_rows(ma_prm, ma_bq1, ma_bq2, ma_bq3)

# Pivoting longer to prep for visualization
combined_long <-
  pivot_longer(
    combined,
    cols = 3:7, # Chemical cols
    names_to = "Chemical",
    values_to = "Concentration"
  )

# Writing the combined_long frame as .csv into the output folder
write_csv(combined_long, "output/clean_data.csv")
