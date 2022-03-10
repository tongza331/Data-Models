library(tidyverse)
superstoreData <- read.csv("superstore.csv", sep="|")
superstoreData %>% mutate_if(is.character, as.factor) -> superstoreData
summary(superstoreData)

# Graph 1
g1<-superstoreData %>% 
  group_by(Category) %>%
  ggplot() + 
  geom_col(mapping = aes(x=Sub.Category, y=Quantity, fill=Category)) 

# Graph 2
g2 <- superstoreData %>% 
  group_by(Category) %>%
  summarise(avg_profit = mean(Profit), avg_sales = mean(Sales)) %>%
  ggplot(aes(x=avg_sales, y=avg_profit,colour=Category)) + geom_point() + 
  geom_text(aes(label=Category), nudge_y = -0.1)

# Graph 3
g3 <- superstoreData %>% 
  group_by(Region) %>%
  summarise(total_profit=sum(Profit)) %>%
  ggplot(aes(x=Region,y=total_profit,fill=Region)) +
  geom_col(color = "black") 