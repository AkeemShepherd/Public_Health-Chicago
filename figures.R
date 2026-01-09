mapview(vr_data["updated"])

head(vr_data$updated)

vr_data <- vr_data %>%
  mutate(
    lat = as.numeric(str_extract(updated, "(?<=\\().+?(?=,)")),
    lon = as.numeric(str_extract(updated, "(?<=,).+?(?=\\))"))
  ) 


vr_sf <- st_as_sf(
  vr_data,
    # use "wkt=" if column is formated at Point(lat, long)
  wkt = "updated",
  crs = 4326
)

class(vr_sf)
# should include "sf"

st_geometry(vr_sf)
# should not be NULL

# filter vr_sf to represent 2021 based on date and time
vr_subset <- vr_sf[vr_sf$case_number >= as.POSIXct("2021-01-01 00:00:00") &
                       vr_sf$case_number <= as.POSIXct("2021-12-31 23:59:59"), ]

# plot
mapview(vr_subset["updated"])

