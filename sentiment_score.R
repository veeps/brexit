
library(tidytext)
library(dplyr)
library(tidyr)
library(readr)
library(lubridate)
library(ggplot2)

df <- read_csv("data/brexit_tweets/brexitparty_uk.csv")

## emotion analysis


# get the words in my text
tidy_text <- df %>%
  unnest_tokens(word,text) 

# join the words with AFINN library
afinn_words <- tidy_text %>%
  inner_join(get_sentiments("afinn"), by = "word")

########### Get the sum of scores for each day
word_scores <- afinn_words %>%
  group_by(date) %>% # group by date
  summarise(score = sum(value)) # add all values for the score

# plot by date
ggplot(word_scores, aes(x = date, y = score)) + geom_line() +
  ggtitle("Sentiment Score of Tweets Each Day")


########### Here's another version where you group by month
month_scores <- afinn_words %>%
  group_by(month=floor_date(date, "month")) %>% # group by month
  summarize(score=mean(value)) # Take the average score for month

# plot by date
ggplot(month_scores, aes(x = month, y = score)) + geom_line() + 
  ggtitle("Average Sentiment Score of Tweets Each Month")

