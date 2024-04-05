df <- read_csv("Data/pittsburgh_pollution_data.csv")
# Get valid data
df <- filter(df, is_valid == TRUE)

# Filter to where locations have wind
df <- filter(df, site == "Avalon" |
                 site == "Lawrenceville" |
                 site == "Liberty" |
                 site == "North Braddock" |
                 site == "South Fayette" |
                 site == "USS Clairton Sodar Site" |
                 site == "Parkway East" |
                 site == "Liberty 2" |
                 site == "Lawrenceville 2")

# Combine Lawrenceville 2 and Liberty 2 to Liberty and Lawrenceville
df$site <- replace(df$site, df$site == "Lawrenceville 2", "Lawrenceville")
df$site <- replace(df$site, df$site == "Liberty 2", "Liberty")

# Only use parameters of interest
df <- filter(df, parameter == "WNDR" |
                 parameter == "WNSP" |
                 parameter == "SONICWD" |
                 parameter == "SONICWS" |
                 parameter == "SO2" |
                 parameter == "CO" |
                 parameter == "RAINFALL" |
                 parameter == "Peak Wind Gust" |
                 parameter == "OZONE" |
                 parameter == "NO" |
                 parameter == "NO2" |
                 parameter == "NO" |
                 parameter == "OUT_T" |
                 parameter == "INT_T" |
                 parameter == "OUT_RH" |
                 parameter == "BP" |
                 parameter == "PM10B" |
                 parameter == "PM25B" |
                 parameter == "PM25T")

write_csv(df, "/PIT_air_pollution/Data/cleaned_pollution_data.csv")
