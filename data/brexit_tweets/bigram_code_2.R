
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
#################################

df2 <- read.csv("borisjohnson.csv")
borisjohnson_count <- df2 %>%
  unnest_tokens(word, text)
borisjohnson_count
data("stop_words")


borisjohnson_count <- borisjohnson_count %>%
  anti_join(stop_words)


borisjohnson_count %>%
  count(word, sort = TRUE)

#################################

df3 <- read_csv("Conservatives.csv")
Conservatives_count <- df3 %>%
  unnest_tokens(word, text)
Conservatives_count
data("stop_words")


Conservatives_count <- Conservatives_count %>%
  anti_join(stop_words)


Conservatives_count %>%
  count(word, sort = TRUE)

#####################################

df4 <- read_csv("DUPleader.csv")
DUPleader_count <- df4 %>%
  unnest_tokens(word, text)
DUPleader_count
data("stop_words")


DUPleader_count <- DUPleader_count %>%
  anti_join(stop_words)


DUPleader_count %>%
  count(word, sort = TRUE)

#######################################

df5 <- read_csv("duponline.csv")
DUP_count <- df5 %>%
  unnest_tokens(word, text)
DUP_count
data("stop_words")


DUP_count <- DUP_count %>%
  anti_join(stop_words)


DUP_count %>%
  count(word, sort = TRUE)

#########################################

df7 <- read_csv("joswinson.csv")
swinson_count <- df7 %>%
  unnest_tokens(word, text)
swinson_count
data("stop_words")


swinson_count <- swinson_count %>%
  anti_join(stop_words)


swinson_count %>%
  count(word, sort = TRUE)

########################################

df8 <- read_csv("LibDems.csv")
ld_count <- df8 %>%
  unnest_tokens(word, text)
ld_count
data("stop_words")


ld_count <- ld_count %>%
  anti_join(stop_words)


ld_count %>%
  count(word, sort = TRUE)

########################################

df9 <- read_csv("NicolaSturgeon.csv")
sturgeon_count <- df9 %>%
  unnest_tokens(word, text)
sturgeon_count
data("stop_words")


sturgeon_count <- sturgeon_count %>%
  anti_join(stop_words)


sturgeon_count %>%
  count(word, sort = TRUE)

#######################################

df10 <- read_csv("Nigel_Farage.csv")
farage_count <- df10 %>%
  unnest_tokens(word, text)
farage_count
data("stop_words")


farage_count <- farage_count %>%
  anti_join(stop_words)


farage_count %>%
  count(word, sort = TRUE)

#####################################

df11 <- read_csv("theSNP.csv")
snp_count <- df11 %>%
  unnest_tokens(word, text)
snp_count
data("stop_words")


snp_count <- snp_count %>%
  anti_join(stop_words)


snp_count %>%
  count(word, sort = TRUE)

#####################################

df12 <- read_csv("UKLabour.csv")
labour_count <- df12 %>%
  unnest_tokens(word, text)
labour_count
data("stop_words")


labour_count <- labour_count %>%
  anti_join(stop_words)


labour_count %>%
  count(word, sort = TRUE)%>%
  slice(1:10) %>% 
  ggplot() + geom_bar(aes(word, n), stat = "identity", fill = "#de5833") +
  theme_minimal() +
  labs(title = "Top words of labour brexit",
       subtitle = "using Tidytext in R",
       caption = "Data Source: labour-twitter")

####################################

install.packages("ggplot2", dependencies = TRUE)

####################################

df8 <- read_csv("LibDems.csv")
ld_count <- df8 %>%
  unnest_tokens(word, text)
ld_count
data("stop_words")


ld_count <- ld_count %>%
  anti_join(stop_words)


ld_count %>%
  count(word, sort = TRUE)
####################################### didnt work
df8 %>%
  unnest_tokens(word, txt, token = "ngrams", n = 2) %>%
  separate(word, c("word1", "word2"), sep = " ") %>%
  filter(!word1 %in% stop_words$word) %>%
  filter(!word2 %in% stop_words$word) %>%
  unite(word,word1, word2, sep = " ") %>% 
  count(word, sort = TRUE) %>% 
  slice(1:10)
####################### BIGRAM CODE ################################### Lib Dem

df8 %>% 
  unnest_tokens(word, text, token = "ngrams", n = 2) %>% 
  separate(word, c("word1", "word2"), sep = " ") %>% 
  filter(!word1 %in% stop_words$word) %>%
  filter(!word2 %in% stop_words$word) %>% 
  unite(word,word1, word2, sep = " ") %>% 
  count(word, sort = TRUE) %>% 
  slice(1:10) %>% 
  ggplot() + geom_bar(aes(word, n), stat = "identity", fill = "#de5833") +
  theme_minimal() +
  coord_flip() +
  labs(title = "Top Bigrams of Lib Dem Brexit",
       subtitle = "using Tidytext in R",
       caption = "Data Source: Twitter Lib_Dems")

#################################

df3 %>%
  unnest_tokens(word, text, token = "ngrams", n = 2) %>% 
  separate(word, c("word1", "word2"), sep = " ") %>% 
  filter(!word1 %in% stop_words$word) %>%
  filter(!word2 %in% stop_words$word) %>% 
  unite(word,word1, word2, sep = " ") %>% 
  count(word, sort = TRUE) %>% 
  slice(1:10) %>% 
  ggplot() + geom_bar(aes(word, n), stat = "identity", fill = "#de5833") +
  theme_minimal() +
  coord_flip() +
  labs(title = "Top Bigrams of Conservative Brexit",
       subtitle = "using Tidytext in R",
       caption = "Data Source: Twitter Conservatives")

#####################################

df %>%
  unnest_tokens(word, text, token = "ngrams", n = 2) %>% 
  separate(word, c("word1", "word2"), sep = " ") %>% 
  filter(!word1 %in% stop_words$word) %>%
  filter(!word2 %in% stop_words$word) %>% 
  unite(word,word1, word2, sep = " ") %>% 
  count(word, sort = TRUE) %>% 
  slice(1:10) %>% 
  ggplot() + geom_bar(aes(word, n), stat = "identity", fill = "#de5833") +
  theme_minimal() +
  coord_flip() +
  labs(title = "Top Bigrams of Brexit Party",
       subtitle = "using Tidytext in R",
       caption = "Data Source: Twitter brexit_party")

#########################################

df2 %>%
  unnest_tokens(word, text, token = "ngrams", n = 2) %>% 
  separate(word, c("word1", "word2"), sep = " ") %>% 
  filter(!word1 %in% stop_words$word) %>%
  filter(!word2 %in% stop_words$word) %>% 
  unite(word,word1, word2, sep = " ") %>% 
  count(word, sort = TRUE) %>% 
  slice(1:10) %>% 
  ggplot() + geom_bar(aes(word, n), stat = "identity", fill = "#de5833") +
  theme_minimal() +
  coord_flip() +
  labs(title = "Top Bigrams of borisjohnson",
       subtitle = "using Tidytext in R",
       caption = "Data Source: Twitter Boris_Johnson")

########################################### odd results

df4 %>%
  unnest_tokens(word, text, token = "ngrams", n = 2) %>% 
  separate(word, c("word1", "word2"), sep = " ") %>% 
  filter(!word1 %in% stop_words$word) %>%
  filter(!word2 %in% stop_words$word) %>% 
  unite(word,word1, word2, sep = " ") %>% 
  count(word, sort = TRUE) %>% 
  slice(1:10) %>% 
  ggplot() + geom_bar(aes(word, n), stat = "identity", fill = "#de5833") +
  theme_minimal() +
  coord_flip() +
  labs(title = "Top Bigrams of DUP leader",
       subtitle = "using Tidytext in R",
       caption = "Data Source: Twitter DUP Leader")

###############################################

df12 %>%
  unnest_tokens(word, text, token = "ngrams", n = 2) %>% 
  separate(word, c("word1", "word2"), sep = " ") %>% 
  filter(!word1 %in% stop_words$word) %>%
  filter(!word2 %in% stop_words$word) %>% 
  unite(word,word1, word2, sep = " ") %>% 
  count(word, sort = TRUE) %>% 
  slice(1:10) %>% 
  ggplot() + geom_bar(aes(word, n), stat = "identity", fill = "#de5833") +
  theme_minimal() +
  coord_flip() +
  labs(title = "Top Bigrams of Labour Brexit",
       subtitle = "using Tidytext in R",
       caption = "Data Source: Labour Brexit")

###################################################

df10 %>%
  unnest_tokens(word, text, token = "ngrams", n = 2) %>% 
  separate(word, c("word1", "word2"), sep = " ") %>% 
  filter(!word1 %in% stop_words$word) %>%
  filter(!word2 %in% stop_words$word) %>% 
  unite(word,word1, word2, sep = " ") %>% 
  count(word, sort = TRUE) %>% 
  slice(1:10) %>% 
  ggplot() + geom_bar(aes(word, n), stat = "identity", fill = "#de5833") +
  theme_minimal() +
  coord_flip() +
  labs(title = "Top Bigrams of Farage Brexit",
       subtitle = "using Tidytext in R",
       caption = "Data Source: Twitter Farage")