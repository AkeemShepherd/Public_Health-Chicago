

head(vr_data$updated)

vr_data <- vr_data %>%
  mutate(
    # from vr_data extract (latitude, as numeric
    lat = as.numeric(str_extract(updated, "(?<=\\().+?(?=,)")),
    # from vr_data extract ,longitude) as numeric
    lon = as.numeric(str_extract(updated, "(?<=,).+?(?=\\))"))
  ) 

# convert vr_data to a spatial dataframe using function "st_as_sf" from the sf package
vr_sf <- st_as_sf(
  vr_data,
    # use "wkt=" if column is formatted as Point(lat, long)
  wkt = "updated",
  crs = 4326
)

# check to make sure vr_sf is spatial and a dataframe
class(vr_sf)

# check geometry column in vr_sf; this should not be NULL
st_geometry(vr_sf)


# filter vr_sf to represent 2021 based on date and time
vr_subset <- vr_sf[ # in the vr_sf dataframe column case_number, select all values 
  # corresponding to the first hour of 2021 to the last hour of 2021
  vr_sf$case_number >= as.POSIXct("2021-01-01 00:00:00") &
                       vr_sf$case_number <= as.POSIXct("2021-12-31 23:59:59"), ]

# plot
mapview(vr_subset["updated"])

# What have shootings trends been like over the past 10 years? (Have they gone up? Down?) Try one or more of:
# LINE GRAPH: total citywide shootings for each year from 2016-2025
# BAR CHART: % change in total shootings for each year over time, using 2015 as the "start" year

# filter the dataset to represent the past 10 years
data2016_25 <- vr_data[vr_data$case_number >= as.POSIXct("2016-01-01 00:00:00") &
  vr_data$case_number <= as.POSIXct("2025-12-31 23:59:59"), ]


data2016_25$case_number <- substr(data2016_25$case_number, 1, 4) 
  

line_viz <- data2016_25 %>%
  mutate(case_number = as.integer(case_number)) %>%   # make year numeric
  group_by(case_number) %>%
  summarise(incident_primary = n(), .groups = "drop") %>%
  arrange(case_number)                            # order by year

ggplot(line_viz, aes(x = case_number, y = incident_primary)) +
  geom_line() +
  geom_point() +
  scale_x_continuous(breaks = line_viz$case_number) +
  labs(
    title = "Total Shooting Incidents",
    x = "",
    y = ""
  ) +
  theme_minimal() +
  theme(panel.grid.minor = element_blank())

# BAR CHART: % change in total shootings for each year over time, using 2015 as the "start" year

data2015_25 <- vr_data[vr_data$case_number >= as.POSIXct("2015-01-01 00:00:00") &
                         vr_data$case_number <= as.POSIXct("2025-12-31 23:59:59"), ]

data2015_25$case_number <- substr(data2015_25$case_number, 1, 4) 

# Aggregate total incidents by year
per_chg <- data2015_25 %>%
  mutate(year = as.integer(case_number)) %>%
  filter(year >= 2015) %>%    # only 2015 to current
  group_by(year) %>%
  summarise(incidents = n(), .groups = "drop") %>%
  arrange(year) %>%
  mutate(
    pct_change = (incidents / lag(incidents) - 1) * 100
  )

#barchart 
ggplot(per_chg, aes(x = year, y = pct_change)) +
  geom_col(fill = "#DF536B") +
  geom_text(aes(label = round(pct_change, 1)), vjust = -0.5) +  # show percent on top
  labs(
    title = "% Change in Shooting Incidents",
    x = "",
    y = "%"
  ) +
  theme_minimal() +
  scale_x_continuous(breaks = per_chg$year) +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_rect())



