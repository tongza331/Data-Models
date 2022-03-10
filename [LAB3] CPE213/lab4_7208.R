library(tidyverse)
library(ggplot2)
library(corrplot)

df <- read.csv("cars.csv")
df %>% mutate_if(is.character, as.factor) -> df
str(df)

table(df$Style, df$Transmission)

chisq.test(
  table(df$Style, df$Transmission))

ggplot(df,aes(x=Style, fill=Transmission)) + geom_bar(position="fill")

ggplot(data=df, mapping=aes(x=Engine_capacity, y=Price)) + 
  geom_point()

cor(df$Engine_capacity, df$Price)

df2 <- select(df,Year,Distance,Engine_capacity,Price)
res <- cor(df2)
corrplot(res,
         type = "upper",
         order = "hclust",
         tl.col = "black",
         tl.srt = 20)