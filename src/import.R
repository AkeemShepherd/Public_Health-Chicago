# import data
data <- read.csv("~/Documents/GitHub_personal/Public_Health-Chicago/data/Violence_Reduction_-_Victims_of_Homicides_and_Non-Fatal_Shootings_20260106.csv")

# import file through path
vr_data <- read.csv("~/Documents/GitHub_personal/Public_Health-Chicago/data/vr_data.csv", 
                    header = TRUE, 
                    sep = ",", 
                    row.names = NULL)

#import boundary file using st_read which requires the "sf" package and converts file to an sf object
boundary_file <- st_read("~/Documents/GitHub_personal/Public_Health-Chicago/data/Boundaries - Community Areas_20260126/geo_export_72abcdaa-ed06-4240-95a9-1ac31523b938.shp")
