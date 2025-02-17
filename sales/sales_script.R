# Pizza sales

# Denver's addition:
rm(list = ls())

##### 1. Load packages #######
library(tidyverse)
library(lubridate)
# Emma's addition:
library(dplyr)
library(ggplot2)
# Eric's addition:
library(magrittr)
library(readr)

##### 2. Load data #######
sales_data <- read.csv("sales/202003_sales.csv")

# Eric's addition:
sales_data <- read.csv("~/Desktop/EricTrot_AnimalBehav/pizza_shop/sales/202003_sales.csv")
my_sales_data <- read.csv("~/Desktop/EricTrot_AnimalBehav/pizza_shop/sales/202210_sales_Trotman.csv")
# Denver's addition:
# create new sales data and export to sales folder
day <- rep(1, length.out = 20)
month <- rep(12, length.out = 20)
year <- rep(2022, length.out = 20)
pizza <- rep(c("margherita","hawaiian","meat lovers","vegetarian","four cheese"),length.out = 20)
number <- sample(1:5, 20, replace = T)
date <- ymd(paste(year,month,day, sep = "-"))

new_sales_data <- data.frame(day, month, year, pizza, number, date)
#write.csv(new_sales_data, "sales/202212_sales_CAYETANO.csv")

##### 3. Create summaries #####
# Medelin's addition:
# Here we are summarizing the pizza sales by summing up the total
# sales for each pizza type by month using a pipe 
# We use sales_data, group by pizza type and the month it was sold,
# and sum the total number of pizza sold of each type by month sold.

# Denver's addition:
sales_summary <- sales_data %>%
  group_by(pizza, month) %>% # groups data by pizza and month columns
  summarize(total_sales = sum(number)) # Sums number of sales per pizza type per month
  
# Eric's additions:
#This code groups the sales data by pizza and then month and sums the sales of each order type.

# Emma's addition:
## This summary shows the amount of pizzas of each pizza type was sold in March.

# Monique's additions:
# The codes provided by the lines 13 to 15 give an output (graph) of the monthly
# sales per pizza type.
# In order to get that result it was created a nested function. First, it was 
# created a new object called "sales_summary"  where we used the data frame
# "sales_data, grouped the variables "pizza" and "month" and made a sum of the 
# total pizzas sold called here as "total_sales.

# The pipes are designed to be used in this nested functions, where the result
# of one function becomes the argument for the next function. 
# Monthly sales per pizza type   

# Kim's additions:
# Monthly sales per pizza type
# This code creates a new dataframe (summary table), sales_summary, with three
# columns: pizza, month, and total sales by pizza and month. The group_by() 
# function grouped the sales_data by pizza and month, and the summarize() 
# function summed summed the number of pizzas sold for each pizza x month 
# combination.

# Jinyi's additions:
# Group the sales_data by pizza type and then month. Then calculate the total
# sales for each group, which is the sum of the number value.
# Monthly sales per pizza type

# Juneaid's additions:
# This is a pipe that orders the data in sequence and sorts/groups the data based
# on pizza type and month and then gives the total sales each month per pizza type.

# Diego's comments:
sales_summary <- sales_data %>% # In this line we are assigning all the code to 
  # a new object called sales_summary, we started with the dataset sales_data, 
  # then we used pipes to move forward with this dataset. When we see the pipes 
  # symbol %>% it means that we are doing a sequence of actions. 
  group_by(pizza, month) %>% # Here we use group_by() to put the observations 
  # in groups, and the following operations will be performed "by group". 
  # Because we put two arguments inside the function, this will group both by 
  # the pizza type, and month. (then pipes again)
  summarize(total_sales = sum(number)) # The function summarise() creates a new 
  # dataframe, it will have one (or more) rows for each combination of grouping 
  # variables. In this case, because we said sum(number), this column called 
  # "total_sales" will show the sum of the elements in the "number" rows for each 
  # of the groups above. The result will allow us to see the total of each 
  # flavor of pizza sold and which month that was sold. It is worth to note 
  # that after running this, the console pane returns the following message: 
  # `summarise()` has grouped output by 'pizza'. You can override using the 
  #`.groups` argument.
  # I checked on Google and found the following about it: The reason for the 
  # message is that the dplyr package drops the last group variable that was 
  # specified in the group_by function, in case we are using multiple columns to 
  # group our data before applying the summarise function. This message helps to 
  # make the user aware that a grouping was performed. However, the message does 
  # not have an impact on the final result.
  
# Jason's comments
sales_summary <- sales_data %>% 
  #The creation of a new table/dataframe, using a pipe flow
  group_by(pizza, month) %>% 
  #Taking a group of data, the pizza and month columns, from sales_data
  # continuing the pipe, combining all matching data of the groups into single
  # rows. In this case, each type of pizza per month gets its own row.
  summarize(total_sales = sum(number))
  # Summarizing the two pizza and month columns with the creation of a new 
  # column, total_sales, that sums all the data in the number column that 
  # corrresponds to the grouped data of pizza/month.

# Monthly sales per pizza type
# Cloe's additions:
sales_summary <- sales_data %>% # calls data from sales_data to create new
  group_by(pizza, month) %>%  # groups pizza by month (ties each data point of pizza to the 
                              # month it was purchased in)
  summarize(total_sales = sum(number)) # creates total_sales as y-axis and input is the sum
                                      # of the number of pizza sold
                                      
# Ana's addition:
sales_summary <- sales_data %>% 
  group_by(pizza, month) %>% # does not create anything, only categorical data
  summarize(total_sales = sum(number)) # summarizes the total monthly sales per pizza type

sales_summary <- sales_data %>%
  group_by(pizza, month) %>% 
  summarize(total_sales = sum(number))


# Monique's additions:
# Here we are using ggplot to make a bar plot of sales_summary, where the x axis
# it the variable pizza and y axis the total sales.
# It is possible to identify that margheritta pizza had the highest sales for
# pizza of the month.

# Shubeksya's addition:
# Monthly sales per pizza type
sales_summary <- sales_data %>% ###pipe takes the output of sales_data and 
                                      ###use this output as an argument in another function
  group_by(pizza, month) %>%   ### it groups the dataframe by given column name, 
                                  ## Here, it will group the sales data by pizza and month
  summarize(total_sales = sum(number))    ###It calculates the sum of each pizza type in the 
                                  ###given month ( 3, grouped by above code) and puts that in the col (total sales)
ggplot(data = sales_summary, aes(x = pizza, y = total_sales))+
  geom_bar(stat = "identity")   ###creates the bar chart of the summary table for pizza and total sales 
   ##with total sales as an dependent y variable provided in the ggplot function.  
  ##otherwise Geom_bar by default will count the no.of obs based on the x-variable(pizza) grouping.

# Ashlynn's addition:
#Bar graph of total pizza sales (by type) for March 2020

ggplot(data = sales_summary, aes(x = pizza, y = total_sales))+
  geom_bar(stat = "identity")
# makes x-axis pizza (which is now grouped by month) and y-axis total sales 
# (total sum of the number of types of pizza for that month)

# Daily sales
# Create "proper" dates
sales_data$date <- ymd(paste(sales_data$year, "/", sales_data$month, "/", sales_data$day))
# Cloe's addition:
# creates a new column in sales_data specifying day, year, and month within each date.

# Medelin's addition:
# Here we are combining the year, month, and day columns into one date vector
# with the proper data type of date instead of integer and saving over our old data object

# Medelin's addition:
# Here we are again using a pipe to summarize the total sales for each pizza type but this
# time by date instead of month.
# First line tells us to use sales_data in our pipe and to create object sales_summary_daily
# Second line groups our data by pizza and then by our new date vector
# Third line summarizes the daily sales by summing the total sales for each pizza type for each 
# day it was sold and creates new column called total_sales in our df

# Emma's addition:
## This code uses lubridate to transform the day/month/year columns into a date 
## column that is more analyze-able by R. 
sales_data$date <- ymd(paste(sales_data$year, "/", sales_data$month, "/", sales_data$day))  

# Shubeksya's comments:
###1st line; pipes the sales data and stores in variable sales_summary_daily
###2nd line: groups the sale of pizza type  by date
##Calculates the total number of sales of pizza each day 

# Ana's addition:
sales_summary_daily <- sales_data %>%
  group_by(pizza, date) %>% # groups by pizza and date columns
  summarize(total_sales = sum(number)) # Sums number of sales per pizza type per date

#Denver's addition:  
# Summarize data

# Cloe's addition:
sales_summary_daily <- sales_data %>% # creating summary of daily sales from sales_data
  group_by(pizza, date) %>% # grouping pizza by date 
  summarize(total_sales = sum(number)) # creates total_sales as y-axis and input is the sum
                                      # of the number of pizza sold

# Medelin?
sales_summary_daily <- sales_data %>%
  group_by(pizza, date) %>% 
  summarize(total_sales = sum(number)) # summarizes the number of recorded daily sales for each type of pizza

# Eric's addition
#This code creates a new df that groups by pizza type and then by date. This tells you how much of each pizza was bought on a specific day.

# Monique's additions
# Here, it was also created a nested function very similar with the one above 
# using sales_data , but instead of grouping by pizza type and month, 
# it grouped by day, that is, sales made from mar 09 to 13. 
# It used the summarize function here as well, and it counted total_sales
# as the sum of the column "number".

# Juneaid's addition?
# Creates a column named date and pastes the data from three columns into the 
# newly created date column.

# Kim's additions:
# Summarize data
# This code creates a new dataframe (summary table), sales_summary_daily, with 
# three columns: pizza, date, and total sales by pizza and date. The group_by()
# function grouped the sales_data by pizza and date (created in the step above),
# and the summarize() function summed the number of pizzas sold for each 
# pizza x date combination.

# Jinyi's additions:
# Group the sales_data by pizza type and then date. Then calculate the total
# sales for each group, which is the sum of number value.

# Juneaid's comments
sales_summary_daily <- sales_data %>%
  # Beginning of a new pipe after creating a date column that looks at days.
  group_by(pizza, date) %>% 
  # The columns being grouped are pizza and date, so each row of a type of pizza
  # on a given day will be combined into a single row.
  summarize(total_sales = sum(number))
  # The new summary column based on the grouped data is totaling the number of
  # each type of pizza on each day using the sum function on the number column.

# Also Juneaid? Jason
# Summarize data
sales_summary_daily <- sales_data %>%
  group_by(pizza, date) %>% 
  summarize(total_sales = sum(number))
# This is a pipe that orders the data in sequence and sorts/groups the data based
# on pizza type and date and then gives the total sales per pizza type date-wise.

# Diego's comments
# Summarize data
sales_summary_daily <- sales_data %>% # Once again creating a new object, 
  # selecting our dataset, and using pipes to establish a sequence of actions. 
  group_by(pizza, date) %>% # We are doing the same thing we did in question 3, 
  # but now the second group will be the actual date, which now has its columns 
  # that was created in the previous step. (then pipes again)
  summarize(total_sales = sum(number)) # This is very similar to what we did 
  # before, but here we are working with the dates and not months. The result 
  # is a dataframe where we'll see all the pizza flavors, the day they were sold, 
  # and how many pizzas were sold that day.

# Summarize data
sales_summary_daily <- sales_data %>%
  group_by(pizza, date) %>% 
  summarize(total_sales = sum(number))

# Monique's addition:
# Here we got a plot of the just created "sales_summary_daily". With date 
# from mar 09 to 13 on the x axis and total_sales on the y axis. 
# It is possible to identify that margheritta and vegetarian were highly 
# consumed on march 11.
# on the bar plot, it is easier to visualize and identify the consumption 
# of each type of  pizza per day, given here by color. 

# Shubeksya's addition:
###Groups the sales by pizza type and date
### Calculates the mean of the number of each sales in the column ave_sales.

# Ashlynn's addition:
# Line graph of total sales for each type of pizza on each day in March 2020

# Emma's addition:
## This is a line graph plots the number of each pizza type sold throughout March 
# Plot
ggplot(data = sales_summary_daily, aes(x = date, y = total_sales, color = pizza))+
  geom_line()
# line plot of specific dates and total sales. Data/color is filled in by type of pizza.


# Emma's addition:
## This is the same information as the previous graph, except communicated in a 
## bar graph. 
ggplot(data = sales_summary_daily, aes(x = date, y = total_sales, fill = pizza))+
  geom_bar(stat = "identity")
# bar chart of specific dates and total sales. Data/color is filled in by type of pizza.
# In my opinion, this is harder to read than the preceding line plot of the same data. 
# I played around with color and fill = with both of these plots and saw that if you fill=
# the line plot, all lines are gray and the key with the pizzas is gone. In using color= 
# in the bar graph, an outline of color is provided instead of a filled-in bar graph.

# Shubeksya's addition:
#Bar graph of pizza sales by type foe each day in March 2020. Pizza type is stacked 

# Denver's addition:
# Average data
sales_ave_daily <- sales_data %>%
  group_by(pizza, date) %>% # groups by pizza and date columns
  summarize(ave_sales = mean(number)) # Averages number of sales per pizza type per date
  
# Ana's addition:
sales_ave_daily <- sales_data %>%
  group_by(pizza, date) %>% 
  summarize(ave_sales = mean(number)) # summarizes the average daily sales for each type of pizza

# Monique's additions
# Here, it was created another nested function, where sales_data was used again,
# it grouped by pizza and date, however instead of getting the sum of the 
# total sales, it gets the mean of the column number, that is, the mean of 
# the total of sales per day for each pizza type.

  # Junaid's comments:
  # Bar graph showing pizza-type sales date-wise with hawaiian sales starting off
# high on Mar 9 followed by four cheese and hawaiian pizza peak sales on 11 Mar
# which then dips down afterwards.However, four cheese pizza maintains the 
# dominance in sales compared to other pizzas. Bar graph looks more intuitive 
# compared to line graph.

# Kim's additions:
# Average data
# This code creates a new dataframe (summary table), sales_ave_daily, with three
# columns: pizza, date, and mean number of sales by pizza and date. The group_by() 
# function grouped the sales_data by pizza and date, and the summarize() 
# function averages number of sales for each pizza x date combination. The 

# Jinyi's additions:
# Group the sales_data by pizza type and then date. Then calculate the ave_sales,
# which is the mean of the number value.

# Juneaid's comments
sales_ave_daily <- sales_data %>%
  #Beginning of a new pipe looking at average daily instead of total daily sales.
  group_by(pizza, date) %>% 
  # Columns being grouped are the same as the last summary, pizza and date.
  summarize(ave_sales = mean(number))
  # This summary is performing the mean function on the number column for each 
  # type of pizza on each day to find the average number per day per type.

# Diego's comments
# Average data
sales_ave_daily2 <- sales_data %>% # Once again, this is similar to what was done 
  # before, new object <- dataset %>% (pipes to create sequence),
  group_by(pizza, date) %>% # function group_by() to group variables together, 
  # then pipes to keep the sequence. 
  summarize(ave_sales = mean(number)) # This will result in an average of how 
  # many pizzas were sold that day. Checking the original dataset, I saw that 
  # there are multiple entries for the same day and same pizza. For example, 
  # for the Hawaiian pizza, there are 4 different rows but all are from the same 
  # day. Even though this is the case, each of this rows for Hawaiian has a 
  # different amount of pizzas sold (number column), so the mean here is the 
  # average of the pizzas sold on that day. This is taking all the repetitive 
  # dates, and making an average from that. 

# Eric's addition
# Average data
sales_ave_daily <- sales_data %>%
  group_by(pizza, date) %>% 
  summarize(ave_sales = mean(number), .groups = "keep")
#This code again groups the sales data by pizza and date then summarizes the sales of these grouping by averaging the sales numbers. This way you can see how sales of each pizza type change on average across days. 

# Average data
sales_ave_daily <- sales_data %>%
  group_by(pizza, date) %>% 
  summarize(ave_sales = mean(number))

# Medelin's addition:
# Here we are using a pipe to average the sales by pizza and date instead of calculating 
# a total 
# First line tells us to use sales_data in our pipe and to creat sales_ave_daily object
# Second line tells us to group first by pizza type and then date vector. 
# Thrid line tells us to summarize data by calculating the mean number of pizzas sold for 
# each groupsand create a column called ave_sales. 

# Monique's addition:
# It gives a bar plot with the results from the nested functions above.
# Our data here is sales_ave_daily, with date on the x axis and ave_sales on the 
# y axis, and it is filled the bars with the variable pizza. 
# From the average sales perceptive, all pizzas types vary each day, but
# margheritta seems to be one of the most promising ones, especially on mar 09. 
ggplot(data = sales_ave_daily, aes(x = date, y = ave_sales, fill = pizza))+
  geom_bar(stat = "identity", position = "dodge")

# Cloe's addition:
# bar chart of specific dates and average sales per day. Data/color is filled in by type of pizza.

# Jason?
ggplot(data = sales_ave_daily, aes(x = date, y = ave_sales, fill = pizza))+
  geom_bar(stat = "identity", position = "dodge")
  # Juneaid's comments
# Line graph showing pizza-type sales date-wise with margherita sales starting off
# high on Mar 9 followed by four cheese and margherita pizza peak sales on 11 Mar
# which then dips down afterwards.
# Emma's addition:
## This plots the average number of each pizza type sold each day. 

# Shubeksya's addition:
#Bar graph of the average daily sales for each pizza type for each day in March 2020
#This data is not stacked, but I am also not sure if this is 
#useful because wouldn't you want to know the total sales for a day rather than the average?