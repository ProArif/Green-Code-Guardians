library(jsonlite)

remove_outliers <- function(data) {
  data <- data[data != 0.00]
  q <- quantile(data)
  iqr <- q[4] - q[2]
  lower_bound <- q[2] - 1.5 * iqr
  upper_bound <- q[4] + 1.5 * iqr
  data_filtered <- data[data >= lower_bound & data <= upper_bound]
  return(data_filtered)
}

machines <- c('m1','m2','windows11')
llms <- c('chatgpt','bard','llama')
tasks <- c('generation','knowledge','realworld')

for (m in machines) {
  for (t in tasks) {
    ##### chatgpt ######
    chatgpt_data <- fromJSON(paste0("data/formatted-data/json/",m,"/",m,"-",t,"-chatgpt-formated.json"))
    chatgpt_df <- as.data.frame(chatgpt_data) 
    unlist_chatgpt_cpu <- unlist(chatgpt_df$cpu.usage, use.names=FALSE)
    filtered_chatgpt_cpu <- remove_outliers(unlist_chatgpt_cpu)
    
    ##### llama ######
    llama_data <- fromJSON(paste0("data/formatted-data/json/",m,"/",m,"-",t,"-llama-formated.json"))
    llama_df <- as.data.frame(llama_data) 
    unlist_llama_cpu <- unlist(llama_df$cpu.usage, use.names=FALSE)
    filtered_llama_cpu <- remove_outliers(unlist_llama_cpu)
    
    ##### bard ######
    bard_data <- fromJSON(paste0("data/formatted-data/json/",m,"/",m,"-",t,"-bard-formated.json"))
    bard_df <- as.data.frame(bard_data) 
    unlist_bard_cpu <- unlist(bard_df$cpu.usage, use.names=FALSE)
    filtered_bard_cpu <- remove_outliers(unlist_bard_cpu)
    
    ##### Kruskal-Wallis test ######
    data_list <- list(filtered_bard_cpu, filtered_llama_cpu, filtered_chatgpt_cpu)
    kruskal_result <- kruskal.test(data_list)
    
    # Print the results
    print(paste(m,"-",t))
    print(kruskal_result)
    
    rm(chatgpt_data,chatgpt_df,unlist_chatgpt_cpu,filtered_chatgpt_cpu)
    rm(llama_data,llama_df,unlist_llama_cpu,filtered_llama_cpu)
    rm(bard_data,bard_df,unlist_bard_cpu,filtered_bard_cpu)
    rm(data_list,kruskal_result)
  }
}
