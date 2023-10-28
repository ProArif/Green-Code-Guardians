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

m1_generation_chatgpt_data <- fromJSON("data/formatted-data/json/m1/m1-generation-chatgpt-formated.json")
m1_generation_chatgpt_df <- as.data.frame(m1_generation_chatgpt_data) 

##### m1 chatgpt generation power ######
plot.ts(m1_generation_chatgpt_df$power.usage, main = "Power usage", 
        xlab= "Timepoints", ylab = "Power (microwatt)")

unlist_m1_pwu <- unlist(m1_generation_chatgpt_df$power.usage, use.names=FALSE)
filtered_m1_pwu <- remove_outliers(unlist_m1_pwu)
hist(filtered_m1_pwu, main = "Histogram for Power usage")

qqnorm(filtered_m1_pwu, main = "QQ Plot for Power usage", 
       xlab = "Theoretical Quantiles", ylab = "Sample Quantiles")
qqline(filtered_m1_pwu)

##### m1 chatgpt generation cpu ######
plot.ts(m1_generation_chatgpt_df$cpu.usage, main = "CPU usage",
        xlab= "Timepoints", ylab = "CPU usage (microwatt)")

unlist_m1_cpu <- unlist(m1_generation_chatgpt_df$cpu.usage, use.names=FALSE)
filtered_m1_cpu <- remove_outliers(unlist_m1_cpu)
hist(filtered_m1_cpu, main = "Histogram for CPU usage")

qqnorm(filtered_m1_cpu, main = "QQ Plot for CPU usage", 
       xlab = "Theoretical Quantiles", ylab = "Sample Quantiles")
qqline(filtered_m1_cpu)
