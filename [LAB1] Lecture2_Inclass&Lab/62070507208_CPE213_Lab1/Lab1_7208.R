library(tidyr)
library(dplyr)
flightData = read.csv("flights.csv")
airlineData = read.csv("airlines.csv")

flight = select(flightData,carrier,dep_delay)
airline = select(airlineData,-X)

mean_carrier_delay = flight %>% filter(!is.na(dep_delay))  %>% group_by(carrier) %>% summarise(mean_delay=mean(dep_delay)) %>% inner_join(airline,flight,by="carrier") %>% arrange(desc(mean_delay))
mean_carrier_delay