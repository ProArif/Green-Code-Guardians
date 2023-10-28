library(jsonlite)

machines <- c('m1','m2','windows11')
llms <- c('chatgpt','bard','llama')
tasks <- c('generation','knowledge','realworld')
nanowatt = 1000000000

for (m in machines) {
  for (t in tasks) {
    print(paste(m,"-",t))
    for (l in llms) {
      fname = paste0(m,'-',t,'-',l,'-formated')
      json_path = paste0('data/formatted-data/json/',m,'/',fname,'.json')
      
      task_data <- fromJSON(json_path)
      task_df <- as.data.frame(task_data)
      task_pwu = watt = round(sum(task_df$power.usage) / nanowatt,1)
      
      print(paste(l,':', task_pwu,'Watt'))
      
      rm(task_data)
      rm(task_df)
    }
  }
}