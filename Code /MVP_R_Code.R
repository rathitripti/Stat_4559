install.packages("twitteR")
install.packages("ROAuth")
install.packages("jsonlite")
install.packages("rtweet")
install.packages("tidytext")
library("twitteR")
library("ROAuth")
library("jsonlite")
library("rtweet")
library("tidytext")

###I've uploaded all of the tweet data I've collected so far along with my code to GitHub

getwd()
setwd("/Users/triptirathi/Documents/Stat-Experiment-")

###SUITE OF KEYS TO THE API,YOU MUST HAVE A TWITTER ACCOUNT

appname <- "flutracking1"
key <- "nQ8HlR0WO0iWsX5O7OCcifUzB"
secret <- "1cACcfLbrkvZmkPxHT8eVBiRvaCQEwCGoVUYBtlEwelbi2M8B5"

###CREATE TOKEN TO ACCESS TWEETS
twitter_token <- create_token(app=appname,consumer_key=key,consumer_secret=secret)

###TEST TO MAKE SURE CODE IS WORKING
test_tweets <- search_tweets(q = "#flu",
                            n = 100,
                            include_rts = FALSE)
test_tweets[1:10,]

###Code to extract tweets. Twitter has an hourly restriction on how many tweets you can 
###extract. 
influenza_tweets <- search_tweets(q = "influenza", n = 18000)

###Code to convert to JSON file
jinfluenza_tweets <- toJSON(influenza_tweets, pretty = TRUE)
write(influenza_tweets, "jinfluenza_tweets.json")

###TUESDAY 2/6/18, code for various flu like symptoms
flu_tweet26 <- search_tweets(q = "#flu", n = 18000)
jflu_tweet2618 <- toJSON(flu_tweet26, pretty = TRUE)
write(jflu_tweet2618, "jflu_tweet2618.json")
max(flu_tweet26$created_at)##earliest date
min(flu_tweet26$created_at)##latest date

test_tweets26 <- search_tweets(q = "flu", n = 18000)
jtest_tweet2618 <- toJSON(test_tweets26, pretty = TRUE)
write(jtest_tweet2618, "jtest_tweet2618.json")

influenza_tweets26 <- search_tweets(q= "influenza", n = 18000)
jinfluenza_tweet2618 <- toJSON(influenza_tweets26, pretty = TRUE)
write(jinfluenza_tweet2618, "jinfluenzaflu_tweet2618.json")

fever_tweets26 <- search_tweets(q= "fever", n = 18000)
jfever_tweet2618 <- toJSON(fever_tweets26, pretty = TRUE)
write(jfever_tweet2518, "jfever_tweets2618.json")

aches_tweets26 <- search_tweets(q= "body aches", n = 18000)
jaches_tweet2618 <- toJSON(aches_tweets26, pretty = TRUE)
write(jaches_tweets2618, "jaches_tweets2618.json")

feverish_tweets26 <- search_tweets(q= "feverish", n = 18000)
jfeverish_tweet2618 <- toJSON(feverish_tweets26, pretty = TRUE)
write(jfeverish_tweet2618, "jfeverish_tweet2618.json")

###2/8/18
flu_tweet28 <- search_tweets(q = "#flu", n = 18000)
jflu_tweet2818 <- toJSON(flu_tweet28, pretty = TRUE)
write(jflu_tweet2818, "jfeverish_tweet2818.json")

test_tweets28 <- search_tweets(q = "flu", n = 18000)
jtest_tweet2818 <- toJSON(test_tweets28, pretty = TRUE)
write(jtest_tweet2818, "jtest_tweet2818.json")

influenza_tweets28 <- search_tweets(q= "influenza", n = 18000)
jinfluenza_tweet2818 <- toJSON(influenza_tweets28, pretty = TRUE)
write(jinfluenza_tweet2818, "jinfluenza_tweet2818.json")

fever_tweets28 <- search_tweets(q= "fever", n = 18000)
jfever_tweet2818 <- toJSON(fever_tweets28, pretty = TRUE)
write(jfever_tweet2818, "jfever_tweet2818.json")

aches_tweets28 <- search_tweets(q= "body aches", n = 18000)
jaches_tweet2818 <- toJSON(aches_tweets28, pretty = TRUE)
write(jaches_tweet2818, "jaches_tweet2818.json")

feverish_tweets28 <- search_tweets(q= "feverish", n = 18000)
jfeverish_tweet2818 <- toJSON(feverish_tweets28, pretty = TRUE)
write(jfeverish_tweet2818, "jfeverish_tweet2818.json")

####Alternative option to collect tweets: LIVESTREAM TWEETS
filename = "stream_tweets28.json"
q = "flu, influenza, #flu, fever, cough, cold, fever, feverish, aches"
livestream28 <- stream_tweets(q = q, timeout = 10*60, file_name = filename)
