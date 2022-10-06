

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
restaurants <- restaurants %>%
  filter(review_count >= 30) %>% 
  arrange(-rating) %>% 
  mutate(Rank = row_number()) %>%
  mutate("Restaurant Name" = name) %>% 
  mutate(Rating = rating) %>% 
  mutate("Review Count" = review_count) %>% 
  mutate(Address = paste0(location.address1, ", ", location.city, ", ", location.zip_code, ", ", location.state)) %>% 
  mutate("Phone Number" = phone) %>% 
  select(Rank, "Restaurant Name", Rating, "Review Count", Address, "Phone Number")

print(restaurants, row.names = FALSE) 
write.csv(restaurants, file = "ws_mexican_restaurants.csv", append = FALSE, row.names = FALSE)


install.packages("dbplyr")
library("DBI")

install.packages("RSQLite")
library(RSQLite)

#db_connection <- dbConnect(SQLite(), dbname = "./Sqlite3/textbook_ch13.db")
db_connection <- dbConnect(SQLite(), dbname = "c:/Users/parksm/Documents/R/dcs510.db")
#db_connection <- dbConnect(SQLite(), dbname = "c:/Users/sangp/Documents/Sqlite/api_keys.db")
dbListTables(db_connection)

restaurants_table <- tbl(db_connection, "restaurants_table")
restaurants_table
best_restaurants <- restaurants_table %>% 
  filter(Rating >= 4.5) %>% 
  select(Rank, 'Restaurant Name', Rating, 'Phone Number')
best_restaurants
show_query(best_restaurants)
best_restaurants_data <- collect(best_restaurants)
best_restaurants_data
dbDisconnect(db_connection)


