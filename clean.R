vr_data <- data %>%
  # Make the names lowercase
  clean_names() %>%
  mutate(
    primary_type = ifelse(victimization_primary == "HOMICIDE", "FATAL SHOOTING", "NON-FATAL SHOOTING"),
    fatal = victimization_primary == "HOMICIDE",
    # Clean date columns
    date = mdy_hms(date),
    year = year(as_date(date)),
    # tag month of observation (in 3-letter format "Jan", "Feb" and so on)
    month_text = month.abb[month(date)] %>% factor(levels = month.abb),
    # Instead of renaming rd_no = case_number
    rd_no = case_number,
    # Used to check how many are dropped by `drop_na(latitude)`
    na_latitude = is.na(latitude),
    # Again, for viz purposes, create a generic date of the first of the month
    # for each shooting (this is what we group_by later to summarize/count
    # by CCA)
    month_year = floor_date(as_date(date), "month")
  ) %>%
  # Note - for this analysis (and consistent with previous analyses we've done
  # using the VR dashboard dataset, just grab the GV records)
  filter(gunshot_injury_i == "YES") %>%
  # Because we want to be able to map incidents, drop any where latitude
  # is na. The number of dropped observations is 4 as of 1/7/2025
  walk(print(nrow(.))) %>% 
  drop_na(latitude) %>%
  st_as_sf(coords = c("longitude", "latitude"), crs = 4326) %>%
  # Deduplicate (drops 0 records as of 1/7/2025)
  distinct(case_number, unique_id, .keep_all = TRUE) %>% 
  walk(print(nrow(.))) %>% 
  st_transform(3435)


write.csv(vr_data, "~/Documents/GitHub_personal/data/vr_data.csv", row.names = FALSE)
