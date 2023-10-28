# In this script we generate the graphs that show the values 
# of power usage spread over time per experiment execution

library(jsonlite)
library(ggplot2) 

##### m1 chatgpt generation ######

m1_generation_chatgpt_data <- fromJSON("m1/m1-generation-chatgpt-formated.json")
m1_generation_chatgpt_df <- as.data.frame(m1_generation_chatgpt_data) 
plot.ts(m1_generation_chatgpt_df$power.usage, main = "Power usage (M1)", 
        xlab= "Timepoints", ylab = "Power (microwatt)")


##### windows11 bard knowledge ######

windows_knowledge_bard_data <- fromJSON("windows11/windows11-knowledge-bard-formated.json")
windows_knowledge_bard_df <- as.data.frame(windows_knowledge_bard_data)
plot.ts(windows_knowledge_bard_df$power.usage, main = "Power usage (Windows)",
        xlab= "Timepoints", ylab = "Power (microwatt)")
