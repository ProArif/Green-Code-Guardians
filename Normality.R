# In this script we generate the graphs that show the values 
# of power usage spread over time per experiment execution

library(jsonlite)
library(ggplot2) 

machines <- c('m1','m2','windows11')
llms <- c('chatgpt','bard','llama')
tasks <- c('generation','knowledge','realworld')

remove_outliers <- function(data) {
  data <- data[data != 0.00]
  q <- quantile(data)
  iqr <- q[4] - q[2]
  lower_bound <- q[2] - 1.5 * iqr
  upper_bound <- q[4] + 1.5 * iqr
  data_filtered <- data[data >= lower_bound & data <= upper_bound]
  return(data_filtered)
}

for (m in machines) {
  for (t in tasks) {
    for (l in llms) {
      fname = paste0(m,'-',t,'-',l,'-formated')
      json_path = paste0('data/formatted-data/json/',m,'/',fname,'.json') 
      
      task_data <- fromJSON(json_path)
      task_df <- as.data.frame(task_data)
      
      ##### power usage ######
      plot.ts(task_df$power.usage, main = paste(m,t,l,"power usage"), 
        xlab= "Timepoints", ylab = "Power (microwatt)")
        
      unlist_task_df_pwu <- unlist(task_df$power.usage, use.names=FALSE)
      filtered_task_df_pwu <- remove_outliers(unlist_task_df_pwu)
      hist(filtered_task_df_pwu, main = paste("Histogram for Power usage of",m,t,l))
             
      qqnorm(filtered_task_df_pwu, main = paste("QQ Plot for Power usage",m,t,l), 
        xlab = "Theoretical Quantiles", ylab = "Sample Quantiles")
        qqline(filtered_task_df_pwu)
      
      ##### cpu usage ######
      plot.ts(task_df$cpu.usage, main = paste(m,t,l,"CPU usage"),
              xlab= "Timepoints", ylab = "CPU usage (microwatt)")
      
      unlist_task_df_cpu <- unlist(task_df$cpu.usage, use.names=FALSE)
      filtered_task_df_cpu <- remove_outliers(unlist_task_df_cpu)
      hist(filtered_task_df_cpu, main = paste("Histogram for CPU usage of",m,t,l))
      
      qqnorm(filtered_task_df_cpu, main = paste("QQ Plot for CPU usage",m,t,l), 
             xlab = "Theoretical Quantiles", ylab = "Sample Quantiles")
      qqline(filtered_task_df_cpu)
      
      rm(task_data,task_df)
      rm(unlist_task_df_pwu,filtered_task_df_pwu)
      rm(unlist_task_df_cpu,filtered_task_df_cpu)
    }
  }
}


m = 'linux'
  for (t in tasks) {
    for (l in llms) {
      fname = paste0(m,'-',t,'-',l,'-formated')
      json_path = paste0('data/formatted-data/json/',m,'/',fname,'.json') 
      
      task_data <- fromJSON(json_path)
      task_df <- as.data.frame(task_data)
      
      ##### cpu usage ######
      plot.ts(task_df$cpu.usage, main = paste(m,t,l,"CPU usage"),
              xlab= "Timepoints", ylab = "CPU usage (microwatt)")
      
      unlist_task_df_cpu <- unlist(task_df$cpu.usage, use.names=FALSE)
      filtered_task_df_cpu <- remove_outliers(unlist_task_df_cpu)
      hist(filtered_task_df_cpu, main = paste("Histogram for CPU usage of",m,t,l))
      
      qqnorm(filtered_task_df_cpu, main = paste("QQ Plot for CPU usage",m,t,l), 
             xlab = "Theoretical Quantiles", ylab = "Sample Quantiles")
      qqline(filtered_task_df_cpu)
      
      rm(task_data,task_df)
      rm(unlist_task_df_cpu,filtered_task_df_cpu)
    }
  }
