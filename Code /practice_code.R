install.packages("ggmap")
library("ggmap")
library("ggplot2")
filename = "stream_tweets28.json"
q = "flu, influenza, #flu, fever, cough, cold, fever, feverish, aches"
livestream28 <- stream_tweets(q = q, timeout = 10*60, file_name = filename)

times <- livestream28$created_at
plot_mins <- ts_plot(livestream28, by = "min")
?ts_plot
length(livestream28$created_at)
unique(livestream28$source)
unique(livestream28$coords_coords)
unique(livestream28$lang)
unique(livestream28$geo_coords)
unique(livestream28$place_url)
unique(livestream28$country)
unique(livestream28$bbox_coords)
##Usage resembles the following: bounding_box:[west_long south_lat east_long north_lat]
unique(livestream28$bbox_coords)
livestream28$place_name
livestream28$coords_coords
unique(livestream28$coords_coords)
?read_json
unique(livestream28$place_name)
unique(livestream28$place_url)
coord <- which(livestream28$country =='United States')
head(livestream28)
UStweet <- livestream28[coord,]
length(UStweet$place_name)
UStweet$bbox_coords
usa <- map_data("usa")
states <- map_data("state")
ggplot() + 
  geom_polygon(data = usa, aes(x=long, y = lat, group = group), fill = NA, color = "red") + 
  coord_fixed(1.3)
gg1 <- ggplot() + 
  geom_polygon(data = usa, aes(x=long, y = lat, group = group), fill = "violet", color = "blue") + 
  coord_fixed(1.3)
gg1
ggplot(data = states) + 
  geom_polygon(aes(x = long, y = lat, fill = region, group = group), color = "white") + 
  coord_fixed(1.3) +
  guides(fill=FALSE)


####
# getwd()
# setwd("/Users/triptirathi/documents/Stat-Experiment-")
# ili <- read.csv("ILInet.csv", header = TRUE)
# head(ili)
# 
# install.packages("dplyr")
# library("dplyr")
# install.packages("ggplot2")
library("ggplot2")
# install.packages("ggplot2")
# install.packages("datasets")
# install.packages("car")
# install.packages("gcookbook")
# install.packages("MASS")
# install.packages("Hmisc")
# library(ggplot2)
# library(car)
# library(gcookbook)
# library(MASS)
# library(Hmisc)

group_by(ili)
flu_date <- arrange(ili, REGION)
header(flu_date)
colnames(flu_date)
col_names <- c("REGION", "WEEK","YEAR","X.UNWEIGHTED.ILI","ILITOTAL","NUM..OF.PROVIDERS","TOTAL.PATIENTS")
state_ili <- flu_date[,col_names]
x.unweighted.ili <- as.character(state_ili$X.UNWEIGHTED.ILI)
x.unweighted.ili <- as.numeric(x.unweighted.ili)
state_ili["x.unweighted.ili"] <- x.unweighted.ili
state_ili_w <- state_ili[which(state_ili$YEAR == 2018),]
colnames(state_ili_w)
alabama <- state_ili_w[1:5,]
length(state_ili_w$REGION)
ggplot(alabama, aes(x = WEEK, y = x.unweighted.ili, colour = REGION)) + geom_point()
alabama_plot <- ggplot(alabama, aes(x = WEEK, y = x.unweighted.ili, colour = REGION)) + geom_point()
state_line_plot <- ggplot(state_ili_w[1:25,], aes(x = WEEK, y = x.unweighted.ili, colour = REGION)) + geom_point()

ggplot(state_ili_w, aes(x = "REGION", y = "X.UNWEIGHTED.ILI")) + geom_point()
plot(state_ili_w$WEEK, state_ili_w$X.UNWEIGHTED.ILI)
groupBy(state_ili_w, REGION)
group_by(state_ili_w, REGION)

####
install.packages("rtweet")
install.packages("tidytext")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("httpuv")
install.packages("jsonlite")
library("rtweet")
library("tidytext")
library("ggplot2")
library("dplyr")
library("httpuv")

app_name <- "flutracking1"
key <- "nQ8HlR0WO0iWsX5O7OCcifUzB"
secret <- "1cACcfLbrkvZmkPxHT8eVBiRvaCQEwCGoVUYBtlEwelbi2M8B5"

twitter_token <- create_token(app = app_name, consumer_key = key, consumer_secret = secret)

twitter_token
flu_tweets <- search_tweets(q = "#flu",
                            n = 100,
                            include_rts = FALSE)
flu_tweets[10:20]
unique(flu_tweets$text)
head(flu_tweets)
?search_tweets
flu_tweets1 <- search_tweets(q = "flu",
                             n = 100,
                             include_rts = FALSE)
unique(flu_tweets1$text)

flu_tweets2518 <- search_tweets(q = "#flu",
                                n = 18000,
                                include_rts = FALSE)
unique(head(flu_tweets2518))
length(flu_tweets2518$text)
date <- unique(flu_tweets2518$created_at)
location <- flu_tweets2518$geo_coords
country <- flu_tweets2518$country
head(flu_tweets2518)
unique(flu_tweets2518$ext_media_type)
flu_tweets2518$source
unique(flu_tweets2518$media_type)
flu_tweets2518[2,][,5]
unique(country)
length(date)
length(date)
?write.json
write.json(flu_tweets2518)



