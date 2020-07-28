
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

# join the words with library
afinn_words <- tidy_text %>%
  inner_join(get_sentiments("afinn"), by = "word")

# scores by date
word_scores <- afinn_words %>%
  group_by(date) %>%
  summarise(score = sum(value))

# plot by date
ggplot(word_scores, aes(x = date, y = score)) + geom_line() +
  ggtitle("Sentiment Score of Tweets Each Day")


########### Here's another version where you group by month
month_scores <- afinn_words %>%
  group_by(month=floor_date(date, "month")) %>%
  summarize(score=mean(value)) # I'm taking the average score for the month here

# plot by date
ggplot(month_scores, aes(x = month, y = score)) + geom_line() + 
  ggtitle("Average Sentiment Score of Tweets Each Month")

