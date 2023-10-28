library(jsonlite)

machines <- c('linux','m1','m2','windows11')
llms <- c('chatgpt','bard','llama')
tasks <- c('generation','knowledge','realworld')

for (m in machines) {
  for (l in llms) {
    for (t in tasks) {
      fname = paste0(m,'-',t,'-',l,'-formated')
      json_path = paste0('json/',m,'/',fname,'.json')
      rdata_path = paste0('RData/',fname,'.Rdata')
      
      new_data <- fromJSON(json_path)
      new_data_df <- as.data.frame(new_data) 
      save(new_data_df, file = rdata_path)
    }
  }
}
