library(tidyverse)
library(ggplot2)

df <- read.csv("cars.csv")
df %>% mutate_if(is.character, as.factor) -> df
str(df)

make_count <- df %>%
  group_by(Make) %>%
  summarise(n=n()) %>%
  arrange(desc(n))

df %>% ggplot(aes(Make)) + geom_bar() + coord_flip()
df %>% 
  ggplot(aes(x=Engine_capacity)) +
  geom_histogram(bins=20)

df %>%
  group_by(Model) %>%
  summarise(Max = max(Engine_capacity),
            Min = min(Engine_capacity),
            Q1 = quantile(Engine_capacity),
            mean = mean(Engine_capacity),
            Q3 = quantile(Engine_capacity,0.75),
            IQR = IQR(Engine_capacity),
            Upper = Q3 + (1.5*IQR),
            Lower = Q1 - (1.5*IQR))

df %>%
  summarise(Max = max(Engine_capacity),
            Min = min(Engine_capacity),
            Q1 = quantile(Engine_capacity),
            mean = mean(Engine_capacity),
            Q3 = quantile(Engine_capacity,0.75),
            IQR = IQR(Engine_capacity),
            Upper = Q3 + (1.5*IQR),
            Lower = Q1 - (1.5*IQR))

df %>% ggplot(aes(Engine_capacity)) +
  geom_boxplot()
