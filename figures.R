vr_data <- vr_data %>%
  mutate(
    lat = as.numeric(str_extract(updated, "(?<=\\().+?(?=,)")),
    lon = as.numeric(str_extract(updated, "(?<=,).+?(?=\\))"))
  ) 

ui <- fluidPage(
  selectInput("year", "Select Year:",
              choices = sort(unique(vr_data$year)), selected = 2023),
  checkboxInput("fatal_only", "Fatal Shootings Only", value = FALSE),
  mapviewOutput("map")
)

output$map <- renderMapview({
  mapview(df_filtered(), cex = 0.5, zcol = "gunshot_injury_i", cluster = TRUE)
})

server <- function(input, output, session) {
  output$map <- renderMapview({
    # Must be inside renderMapview
    df_filtered <- reactive({
      df_sf %>%
        filter(year == input$year) %>%
        {if(input$fatal_only) filter(., gunshot_injury_i == "Fatal") else .}
    })
    
    mapview(df_filtered, cex = 0.5, zcol = "gunshot_injury_i", cluster = TRUE)
  })
}

shinyApp(ui, server)


mapview(vr_data["updated"])

mapview(vr_data %>% filter(date > ymd("2010-01-01")),
        cluster = TRUE,
        cex = .05)

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
# Nice filtering! What would this translate to in tidyverse?
vr_subset <- vr_sf[vr_sf$date >= as.POSIXct("2021-01-01 00:00:00") &
                       vr_sf$date <= as.POSIXct("2021-12-31 23:59:59"), ]

# plot
mapview(vr_subset["updated"])

