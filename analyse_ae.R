library(tidyverse) #i use tidyverse for data cleaning, and visualisation
library(lubridate) # i use this package to manipulate date and time columns
library(fpp3)

#--------------------------------
ae_raw <- read_csv("data/ed_wales_hospital.csv")

ae <- ae_raw |> mutate(MonthYear = lubridate::ym(MonthYear)) |> janitor::clean_names()

ae_total <- ae |> group_by(month_year) |> summarise(admissions=sum(admissions))

p1 <- ggplot(data = ae_total, mapping = aes(x = month_year, y = admissions))+
  geom_point()+
  geom_line()


p2 <- ggplot(data = ae, mapping = aes(x = admissions, y= fct_reorder(organisation,admissions)))+
  geom_boxplot()

# in this figure we observe that 

#write_csv(ae_total, "result/ae_total.csv")
#ggsave("result/plot2.png", p2)

#
