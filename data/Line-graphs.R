# In this script we generate the graphs that show the values 
# of power usage spread over time per experiment execution

library(jsonlite)
library(ggplot2) 

remove_outliers <- function(data) {
  data <- data[data != 0.00]
  q <- quantile(data)
  iqr <- q[4] - q[2]
  lower_bound <- q[2] - 1.5 * iqr
  upper_bound <- q[4] + 1.5 * iqr
  data_filtered <- data[data >= lower_bound & data <= upper_bound]
  return(data_filtered)
}

##### m1 chatgpt generation ######

m1_generation_chatgpt_data <- fromJSON("chatgpt/m1-generation-chatgpt-formated.json")
m1_generation_chatgpt_df <- as.data.frame(m1_generation_chatgpt_data) 
plot.ts(m1_generation_chatgpt_df$power.usage)

load("chatgpt/m1_generation_chatgpt.RData")

m1_pwu <- m1_generation_chatgpt_df$power.usage
unlist_m1_pwu <- unlist(m1_pwu, use.names=FALSE)
hist(unlist_m1_pwu)

filtered_m1_pwu <- remove_outliers(unlist_m1_pwu)

plot.ts(filtered_m1_pwu)
