imdb <- read.csv("IMDB.csv", stringsAsFactors = F)
glimpse(imdb)
head(imdb)
tail(imdb)

## Select columns
select(imdb, MOVIE_NAME, RATING)
select(imdb, 1 ,5)
select(imdb, movie_name = MOVIE_NAME, released_year = YEAR)

## pipe operator
imdb %>%
  select(movie_name = MOVIE_NAME, released_year = YEAR)%>%
  head(10)
## Create new data frame
imdb_top_ten <- imdb %>%
  select(movie_name = MOVIE_NAME, released_year = YEAR)%>%
  head(10)

## filter data
filter(imdb, SCORE >= 9.0)

imdb %>%
  filter(SCORE >= 9.0)

## Change column names to lower-case
names(imdb) <- tolower(names(imdb))
names(imdb)

## using pipe to create data pipeline
imdb %>%
  select(movie_name, year, score) %>%
  filter(score >= 9 & year > 2000)

imdb %>%
  select(movie_name, year, score) %>%
  filter(score == 8.8 | score == 8.3 | score == 9.0)

imdb %>%
  select(movie_name, year, score) %>%
  filter(score %in% c(8.3, 8.8, 9.0))

## filter string columns (characters)
imdb %>%
  select (movie_name, genre, rating) %>%
  filter(grepl("Drama", imdb$genre))

## create new columns
imdb %>%
  select(movie_name, score, length) %>%
  mutate(score_group = if_else (score >= 9, "High Rating", "Low Rating"),
         length_group = if_else (length >= 120, "Long Film", "Short Film"))%>%
  head(10)

imdb %>%
  select(movie_name, score) %>%
  mutate(score = score + 0.1) %>%
  head(10)

## sort data from low to high (ascending order)
imdb %>%
  arrange(length) %>%
  head(10)

## sort data from high to low (descending order)
imdb %>%
  arrange(desc(length)) %>%
  head(10)

## sort multiple columns
imdb %>%
  filter(rating != "") %>%
  arrange(rating, desc(length))

## summarise data by group
imdb %>%
  filter(rating != "") %>% ## filter out blank rating
  group_by(rating) %>%
  summarise(mean_length = mean(length),
            sum_length = sum(length),
            sd_length = sd(length),
            min_length = min(length),
            max_length = max(length),
            n = n())
## join two tables
favourite_films <- data.frame(id = c(5,10, 25, 30, 98))
favourite_films %>%
  inner_join(imdb, by = c("id" = "no")) ## join these key

## create a new dataframe
imdb_prep <- imdb %>%
  select(movie_name, released_year = year, rating, length, score) %>%
  filter(rating == "R" & released_year > 2000)

## export file
write.csv(imdb_prep, "imdb_prep.csv", row.names = F)