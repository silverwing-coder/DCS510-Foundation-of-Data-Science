
## Google Cloud Platform -> select Project_id -> goto credentials
## -> copy api_key
## or
## Go to Dashboard/library: activate "Geocoding API" and "Maps Static API" 
## use: register_google(key="YOUR KEY")

source("./yelp_api_key.R") # the `yelp_key` variable is now available

base_uri <- "https://api.yelp.com/v3"
endpoint <- "/businesses/search"
search_uri <- paste0(base_uri, endpoint)

# Store a list of query parameters for Cuban restaurants around Seattle
query_params <- list(
  term = "restaurant",
  categories = "mexican",
  location = "Winston-Salem, NC",
  sort_by = "rating",
  radius = 10000 # measured in meters, as detailed in the documentation
)

#install.packages("httr")
library("httr")

# Make a GET request, including the API key (as a header) and the list of
response <- GET(
  search_uri,
  query = query_params,
  add_headers(Authorization = paste("bearer", yelp_key))
)

response_text <- content(response, type = "text")

#install.packages("jsonlite")
library("jsonlite")
response_data <- fromJSON(response_text)

names(response_data) 
#View(response_data)
restaurants <- flatten(response_data$businesses)
#View(restaurants)

library("dplyr")
restaurants_best <- restaurants %>%
  filter(review_count >= 30) %>% 
  arrange(-rating) %>% 
  mutate(Rank = row_number()) %>%
  mutate("Name" = name) %>% 
  mutate(Rating = rating) %>% 
  mutate("Review Count" = review_count) %>% 
  mutate(Address = paste0(location.address1, ", ", location.city, ", ", location.zip_code, ", ", location.state)) %>% 
  mutate("Phone Number" = phone) %>% 
  mutate("Latitude" = coordinates.latitude) %>% 
  mutate("Longitude" = coordinates.longitude) %>% 
  select(Rank, Name, Rating, "Review Count", Address, "Phone Number", Latitude, Longitude) %>% 
  filter(Rating >= 4.5)

print(restaurants_best, row.names = FALSE) 

library("ggmap")
library("ggrepel")

register_google(key = "YOUR_KEY")

## mapping by ggmap()
base_map <- ggmap(get_map(location = "Winston-Salem, NC", zoom = 10))
base_map +
  geom_label_repel(
    data = restaurants_best,
    aes(x = Longitude, y = Latitude, label = Name)
  )

## mapping by qmplot()
library("ggplot2")

base_plot <- qmplot(
  data = restaurants_best,
  x = Longitude,
  y = Latitude,
  maptype = "toner-background", 
  darken = 0.3
)

base_plot +
  geom_label(data = restaurants_best, aes(x = Longitude, y = Latitude, label = Name)) +
  geom_point(mappings = aes(x = Longitude, y = Latitude), color = "red")
             
