### Load Libraries
library(httr)
library(jsonlite)
library(tidyverse)
###

# URL for ISS location Data:
base_url <- "http://celestrak.org/NORAD/elements/gp.php?GROUP=stations&FORMAT=json"

info_url <- "elements/gp.php?GROUP=stations&FORMAT=json"

full_url <- stringr::str_c(base_url, info_url)


### call API

api_call <- httr::GET(full_url)


## API response

api_call_status <- api_call$status_code

## Convert Response to usable data

api_char <- base::rawToChar(api_call$content)

api_JSON <- jsonlite::fromJSON(api_char, flatten = TRUE)

## Creating tables

