
# data <- read.csv("~/Documents/GitHub_personal/Public_Health-Chicago/data/Violence_Reduction_-_Victims_of_Homicides_and_Non-Fatal_Shootings_20260106.csv")
# columns_needed <- read.csv("~/Documents/GitHub_personal/Public_Health-Chicago/data/Affordable_Rental_Housing_Developments_20260203.csv", header = TRUE)

# import file through path
vr_data <- read.csv("~/Documents/GitHub_personal/Public_Health-Chicago/data/vr_data.csv", 
                    header = TRUE, 
                    sep = ",", 
                    row.names = NULL)

#import boundary file using st_read which requires the "sf" package and converts file to an sf object
boundary_file <- st_read("~/Documents/GitHub_personal/Public_Health-Chicago/data/Boundaries - Community Areas_20260126/geo_export_72abcdaa-ed06-4240-95a9-1ac31523b938.shp")

# import Chicago_population data
Chicago_population_data <- read.csv("~/Documents/GitHub_personal/Public_Health-Chicago/data/VR data/Chicago_Population_Counts_20260202.csv",
                                    header = TRUE)




  