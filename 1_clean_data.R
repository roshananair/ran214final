# Library and Reading CSVs ----------------------------------------------
library(tidyverse)
source("R/moving-average3.R")

prm_data <- read_csv("data/knb-lter-luq.20.4923064/RioMameyesPuenteRoto.csv")
bq1_data <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca1-Bisley.csv")
bq2_data <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca2-Bisley.csv")
bq3_data <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca3-Bisley.csv")


# Pulling out columns for figure -----------------------------------------
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


# Finding moving averages ---------------------------------------
ma_prm <- moving_average(site_data = prm)
ma_bq1 <- moving_average(site_data = bq1)
ma_bq2 <- moving_average(site_data = bq2)
ma_bq3 <- moving_average(site_data = bq3)


# Combining moving average frames ----------------------------------------
combined <- bind_rows(ma_prm, ma_bq1, ma_bq2, ma_bq3)

# Pivoting longer --------------------------------------------------------
combined_long <-
  pivot_longer(
    combined,
    cols = 3:7,
    names_to = "Chemical",
    values_to = "[Concentration]"
  )

write_csv(combined_long, "output/clean_data.csv")
