
library(tidytext)
library(dplyr)
library(tidyr)
library(readr)
df <- read_csv("borisjohnson.csv")
head(df)
df$date
head(df$date)
tail(df$date)
head(df$date,10)
stop
df

## getting rid of stopwords and filtering by word count

df <- read_csv("brexitparty_uk.csv")
head(df)
brexit_party_count <- df %>%
  unnest_tokens(word, text)
brexit_party_count
data("stop_words")

brexit_party_count <- brexit_party_count %>%
  anti_join(stop_words)

brexit_party_count %>%
  count(word, sort = TRUE)

library() ## doesnt work so far because no ggplot detected

library(tidytext)

brexit_party_count %>%
  count(word, sort = TRUE) %>%
  filter(n > 60) %>%
  mutate(word = reorder(word,n)) %>%
  ggplot(aes(word, n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip()
