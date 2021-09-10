# Set file directory
getwd()
setwd("/Users/ryanching/Desktop/COVID DATA/COVID MY (8 SEPT)/epidemic")

# Libraries
library(ggplot2)
library(dplyr)

# Cases in Malaysia
covid_my = read.csv ("cases_malaysia.csv")
covid_my$date = as.Date(covid_my$date)

# Cases by State
covid_state = read.csv ("cases_state.csv")
covid_state$date = as.Date(covid_state$date)

#-------------------------------------------------------------
  
# Simple Line Chart (Daily New Cases in Malaysia)
covid_cases_my <- ggplot(data=covid_my, aes(x=date, y=cases_new)) + 
                    geom_line(colour = "red", size = 1, alpha = 0.7, linetype=1) +
                    geom_point(shape=21,color="black") + 
                    labs(title="Daily New Cases", x="Date", y="New Cases")
covid_cases_my

# Modifications on Date (Sept 1st 2020 till Sept 1 2021)
covid_cases_my <- covid_cases_my + scale_x_date (limits = as.Date(c("2020-09-01","2021-09-01")))
covid_cases_my

#-------------------------------------------------------------

# Stacked Area Chart (Daily New Cases by State in Malaysia)

covid_sag <- ggplot(data=covid_state, aes(x=date, y=cases_new,
                                           fill=state)) +
              geom_area() +
              labs(title ="Daily New Cases By State", x= "Date", y="New Cases")
covid_sag


