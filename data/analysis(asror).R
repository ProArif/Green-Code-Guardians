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

save(m1_generation_chatgpt_df, file = 'chatgpt/m1_generation_chatgpt.Rdata')

# Then convert  the JSON data to dataframe 
m1_generation_chatgpt_df <- as.data.frame(m1_generation_chatgpt_data) 

plot.ts(m1_generation_chatgpt_df)

load("chatgpt/m1_generation_chatgpt.RData")

m1_pwu <- m1_generation_chatgpt_df$power.usage
unlist_m1_pwu <- unlist(m1_pwu, use.names=FALSE)
hist(unlist_m1_pwu)

filtered_m1_pwu <- remove_outliers(unlist_m1_pwu)
hist(filtered_m1_pwu)


##### m1 chatgpt knowledge ######

m1_knowledge_chatgpt_data <- fromJSON("chatgpt/m1-knowledge-chatgpt-formated.json")
m1_knowledge_chatgpt_df <- as.data.frame(m1_knowledge_chatgpt_data) 

save(m1_knowledge_chatgpt_df, file = 'chatgpt/m1_knowledge_chatgpt.Rdata')

plot.ts(m1_knowledge_chatgpt_df)

load("chatgpt/m1_knowledge_chatgpt.RData")

m1_k_pwu <- m1_knowledge_chatgpt_df$power.usage
unlist_m1_k_pwu <- unlist(m1_k_pwu, use.names=FALSE)

hist(unlist_m1_k_pwu)

filtered_m1_k_pwu <- remove_outliers(unlist_m1_k_pwu)
hist(filtered_m1_k_pwu)

log_df = log2(filtered_m1_k_pwu)
for (x in 1:3) {
  log_df = log(log_df)
}
hist(log_df)
shapiro.test(log_df)

##### m1 llama knowledge ######

m1_knowledge_llama_data <- fromJSON("llama/m1-knowledge-llama-formated.json")
m1_knowledge_llama_df <- as.data.frame(m1_knowledge_llama_data) 

save(m1_knowledge_llama_df, file = 'llama/m1_knowledge_llama.Rdata')

plot.ts(m1_knowledge_llama_df)

load("chatgpt/m1_knowledge_llama.RData")

m1_lk_pwu <- m1_knowledge_llama_df$power.usage
unlist_m1_lk_pwu <- unlist(m1_lk_pwu, use.names=FALSE)

filtered_m1_lk_pwu <- remove_outliers(unlist_m1_lk_pwu)
hist(filtered_m1_lk_pwu)

log_df = log(filtered_m1_lk_pwu)
for (x in 1:3) {
  log_df = log(log_df)
}
hist(log_df)
shapiro.test(log_df)
