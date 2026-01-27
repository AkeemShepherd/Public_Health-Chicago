## <base_processing>----
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
    month_year = floor_date(as_date(date), "month") # generic date threw an error
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

## <total_shootings25>----

# goal: build a df that includes a subset of all data corresponding to year 2025
#       from vr_sf dataset.
#       join the new dataframe with the boundary file.
#       In the joined file, aggregate total shootings and drop geometric data. 
#       left join this file to the original boundary file by community area.


# filter vr_sf to represent 2021 based on date and time
vr_2025subset <- vr_sf[ # in the vr_sf dataframe column case_number, select all values 
  # corresponding to the first hour of 2025 to the last hour of 2025
  vr_sf$case_number >= as.POSIXct("2025-01-01 00:00:00") &
    vr_sf$case_number <= as.POSIXct("2025-12-31 23:59:59"), ]

# plot
#mapview(vr_2025subset["updated"])

# check the EPSG (these numbers should match)
#st_crs(vr_2025subset)
#st_crs(boundary_file)

# join the files
shootings_by_CA <- st_join(
  vr_2025subset,
  boundary_file,
  join = st_within
)

# aggreate shootings by community area
shootings_by_CA <- shootings_by_CA %>%
  st_drop_geometry() %>%
  count(ward, name = "total shootings") %>%
  rename(shootings = 'total shootings',
         communtity = 'ward')

#shootings_by_CA <- shootings_by_CA %>%
#rename(shootings = 'total shootings',
#community = 'ward')

# join shootings by_CA to boundary map
community_areas_map <- boundary_file %>%
  left_join(shootings_by_CA, by = "community") %>%
  mutate(shootings = replace_na(shootings, 0))

# save shapefile
write_sf(community_areas_map, "~/Documents/GitHub_personal/Public_Health-Chicago/data/community_areas.shp" )





