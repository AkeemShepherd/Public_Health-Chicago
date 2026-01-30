# import data
data <- read.csv("~/Documents/GitHub_personal/Public_Health-Chicago/data/Violence_Reduction_-_Victims_of_Homicides_and_Non-Fatal_Shootings_20260106.csv")

# import file through path
vr_data <- read.csv("~/Documents/GitHub_personal/Public_Health-Chicago/data/vr_data.csv", 
                    header = TRUE, 
                    sep = ",", 
                    row.names = NULL)

#import boundary file using st_read which requires the "sf" package and converts file to an sf object
boundary_file <- st_read("~/Documents/GitHub_personal/Public_Health-Chicago/data/Boundaries - Community Areas_20260126/geo_export_72abcdaa-ed06-4240-95a9-1ac31523b938.shp")

# for rate-based analysis, import census data

# run with 'install = TRUE'
census_api_key("c81eef1a35779f425e2bfda2260666dee050faba")

# acs beyond year 2024 hasn't been released
years <- 2020

# acs beyond year 2022 accounting for race hasn't been released
race <- c(
  total_pop = "B03002_001",
  white = "B03002_003",
  black = "B03002_004",
  asian = "B03002_006",
  hispanic = "B03002_012"
)

# write a function that gathers race data by year 
# I mat have to pull these one year at a time
chi_pop <- purrr::map_dfr(
  years,
  ~ purrr::insistently(
  function(y) {
    get_acs(
      geography = "place",
      variables = race,
      state = "IL",
      #county = "Cook", # for some reason, accounting for county causes the database to crash
      place = "Chicago",
      year = y,
      survey = "acs5",
      output = "wide",
    ) %>%
      mutate(year = y)
  },
  rate = purrr::rate_delay(pause = 2, max_times = 5)
  )(.x)
)

# remove columns referencing the M-margin of error
chi_pop <- chi_pop %>%
  select(-ends_with("M"))

write.csv(chi_pop, 
          "~/Documents/GitHub_personal/Public_Health-Chicago/data/chicago_demographic.csv", 
          row.names = FALSE)

# write a function that gathers median income by year
income_chi_pop <- map_dfr(
  years,
  function(y) {
    get_acs(
      geography = "place",
      variables = c(median_income = "B19013_001"),
      state = "IL",
      place = "Chicago",
      year = y,
      survey = "acs5",
      output = "wide",
    ) %>%
      mutate(year = y)
  }
)

# remove M-margin of error
income_chi_pop <- income_chi_pop %>%
  select(-ends_with("M"))

write.csv(income_chi_pop, 
          "~/Documents/GitHub_personal/Public_Health-Chicago/data/median_income.csv",
          row.names = FALSE)

