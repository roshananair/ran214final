# Library and Reading CSVs ----------------------------------------------
library(tidyverse)
source("R/moving-average.R")

prm_data <- read_csv("data/knb-lter-luq.20.4923064/RioMameyesPuenteRoto.csv")
bq1_data <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca1-Bisley.csv")
bq2_data <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca2-Bisley.csv")
bq3_data <- read_csv("data/knb-lter-luq.20.4923064/QuebradaCuenca3-Bisley.csv")


# Pulling out columns for figure -----------------------------------------
prm <- prm_data |>
  select("Sample_ID", "Sample_Date", "NO3-N", "Mg", "Ca", "NH4-N", "K") |>
  glimpse()
bq1 <- bq1_data |>
  select("Sample_ID", "Sample_Date", "NO3-N", "Mg", "Ca", "NH4-N", "K") |>
  glimpse()
bq2 <- bq2_data |>
  select("Sample_ID", "Sample_Date", "NO3-N", "Mg", "Ca", "NH4-N", "K") |>
  glimpse()
bq3 <- bq3_data |>
  select("Sample_ID", "Sample_Date", "NO3-N", "Mg", "Ca", "NH4-N", "K") |>
  glimpse()


# Finding moving averages ---------------------------------------
moving_average(site_data = prm) # for prm

prm_longer <-
  pivot_longer(
    means,
    cols = 2:6,
    names_to = "chemical",
    values_to = "concentration"
  )

# Plotting ---------------------------------------------------------------
prm_longer |>
  ggplot(
    mapping = aes(x = start, y = concentration, color = chemical)
  ) +
  geom_line() +
  theme_bw() +
  facet_wrap(~chemical, ncol = 1, scales = "free_y")

##### Need to implement the 9-day moving average!!

#### This is the edit I am making to "edit a line on the remote server"! ON SERVER
