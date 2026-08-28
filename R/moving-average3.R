# Creating function for finding 9 week moving averages
moving_average <- function(site_data) {
  result <- tibble(
    # Initializing tibble to contain results
    window_start = seq(ymd("1988-01-01"), ymd("1994-12-31"), by = "9 weeks"), # Setting time bounds
    Site = site_data$Sample_ID[1], # Creating site col and assigning Sample_ID from each dataframe
    k_mean = NA, # Creating cols for each chemical, fill with NA
    mg_mean = NA,
    ca_mean = NA,
    nh4_mean = NA,
    no3_mean = NA
  )
  for (i in 1:nrow(result)) {
    w1 <- result$window_start[i] # Define window start and end
    w2 <- w1 + 63 # 63 is 9 weeks in days
    in_window <- site_data$Sample_Date >= w1 & site_data$Sample_Date < w2 # Logical for Sample_Date in_window
    k_window <- site_data$K[in_window] # Pull [chemical] that fall inside window for each chem
    ca_window <- site_data$Ca[in_window]
    mg_window <- site_data$Mg[in_window]
    no3_window <- site_data$`NO3-N`[in_window]
    nh4_window <- site_data$`NH4-N`[in_window]
    result$k_mean[i] <- mean(k_window, na.rm = TRUE) # Find mean of each [chemical] in window, fill in result
    result$ca_mean[i] <- mean(ca_window, na.rm = TRUE)
    result$mg_mean[i] <- mean(mg_window, na.rm = TRUE)
    result$nh4_mean[i] <- mean(nh4_window, na.rm = TRUE)
    result$no3_mean[i] <- mean(no3_window, na.rm = TRUE)
  }

  return(result) # Return result (tibble)
}
