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
means <- tibble(
  n_windows = c(1:41),
  k_mean = NA,
  mg_mean = NA,
  ca_mean = NA,
  nh4_mean = NA,
  no3_mean = NA
) |>
  mutate("start" = seq(ymd("1988-01-01"), ymd("1994-12-31"), by = "9 weeks"))


for (i in 1:nrow(means)) {
  w1 <- means$start[i]
  w2 <- w1 + 63
  k <- prm$K[prm$Sample_Date >= w1 & prm$Sample_Date < w2]
  mg <- prm$Mg[
    prm$Sample_Date >= w1 & prm$Sample_Date < w2
  ]
  ca <- prm$Ca[
    prm$Sample_Date >= w1 & prm$Sample_Date < w2
  ]
  nh4 <- prm$`NH4-N`[
    prm$Sample_Date >= w1 & prm$Sample_Date < w2
  ]
  no3 <- prm$`NO3-N`[
    prm$Sample_Date >= w1 & prm$Sample_Date < w2
  ]
  means$k_mean[i] <- mean(k, na.rm = TRUE)
  means$mg_mean[i] <- mean(mg, na.rm = TRUE)
  means$ca_mean[i] <- mean(ca, na.rm = TRUE)
  means$nh4_mean[i] <- mean(nh4, na.rm = TRUE)
  means$no3_mean[i] <- mean(no3, na.rm = TRUE)
}

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
