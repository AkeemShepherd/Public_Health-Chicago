

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

