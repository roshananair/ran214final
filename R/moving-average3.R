# The input to this function should be a data frame containing stream chemistry data
moving_average <- function(site_data) {
  # Initialize a tibble to contain the results
  result <- tibble(
    window_start = seq(ymd("1988-01-01"), ymd("1994-12-31"), by = "9 weeks"),
    Site = site_data$Sample_ID[1],
    k_mean = NA,
    mg_mean = NA,
    ca_mean = NA,
    nh4_mean = NA,
    no3_mean = NA
  )
  for (i in 1:nrow(result)) {
    w1 <- result$window_start[i]
    w2 <- w1 + 63
    # Create a logical vector, called "in_window", that says which samples are inside the window
    # Hint: you'll compare sample dates to the start and end of the window
    in_window <- site_data$Sample_Date >= w1 & site_data$Sample_Date < w2
    # Use indexing to pull out the ion concentrations that fall inside the window
    k_window <- site_data$K[in_window]
    ca_window <- site_data$Ca[in_window]
    mg_window <- site_data$Mg[in_window]
    no3_window <- site_data$`NO3-N`[in_window]
    nh4_window <- site_data$`NH4-N`[in_window]
    # The line above gets potassium in the window. Get the rest of the ions too#
    # Calculate the mean of each ion concentration and fill in the result
    result$k_mean[i] <- mean(k_window, na.rm = TRUE)
    result$ca_mean[i] <- mean(ca_window, na.rm = TRUE)
    result$mg_mean[i] <- mean(mg_window, na.rm = TRUE)
    result$nh4_mean[i] <- mean(nh4_window, na.rm = TRUE)
    result$no3_mean[i] <- mean(no3_window, na.rm = TRUE)
  }

  return(result)
}
