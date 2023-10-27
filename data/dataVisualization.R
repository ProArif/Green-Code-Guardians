install.packages("tidyverse")
install.packages("ggplot2")

library(tidyverse)
library(ggplot2)

# Define the factors
prompt_type <- c('generation', 'knowledge', 'real')
machine <- c('linux', 'm2', 'm1', 'windows')
llm <- c('chatgpt', 'bard', 'llama2')

# Function processes data
process_data <- function(filename, machine, promptType, llm) {
  load(filename)
  sample <- counter_data$sampleGroups[[1]]$samples
  colnames(sample)[colnames(sample) == "count"] <- "powerUsage"
  
  # calling data.frame to collapse the time and count vectors.
  df <- data.frame(
    time = sample$time,
    power = sample$powerUsage,
    machine = factor(rep(machine, nrow(sample))),
    promptType = factor(rep(promptType, nrow(sample))),
    llm = factor(rep(llm, nrow(sample)))
  )
  colnames(df) = c('time', 'power', 'machine', 'prompt', 'llm')
  return(df)
}

# Load and process the data
df_linux_generation_chatgpt <- process_data("chatgpt/linux-generation-chatgpt.RData", 'linux', 'generation', 'chatgpt')
df_linux_knowledge_chatgpt <- process_data("chatgpt/linux-knowledge-chatgpt.RData", 'linux', 'knowledge', 'chatgpt')
df_linux_real_chatgpt <- process_data("chatgpt/linux-real-chatgpt.RData", 'linux', 'real', 'chatgpt')
df_linux_generation_bard <- process_data("bard/linux-generation-bard.RData", 'linux', 'generation', 'bard')
df_linux_knowledge_bard <- process_data("bard/linux-knowledge-bard.RData", 'linux', 'knowledge', 'bard')
df_linux_real_bard <- process_data("bard/linux-real-bard.RData", 'linux', 'real', 'bard')
df_linux_generation_llama <- process_data("llama/linux-generation-llama.RData", 'linux', 'generation', 'llama')
df_linux_knowledge_llama <- process_data("llama/linux-knowledge-llama.RData", 'linux', 'knowledge', 'llama')
df_linux_real_llama <- process_data("llama/linux-real-llama.RData", 'linux', 'real', 'llama')
df_m2_generation_chatgpt <- process_data("chatgpt/m2-generation-chatGPT.RData", 'm2', 'generation', 'chatgpt')
df_m2_knowledge_chatgpt <- process_data("chatgpt/m2-knowledge-chatGPT.RData", 'm2', 'knowledge', 'chatgpt')
df_m2_real_chatgpt <- process_data("chatgpt/m2-realWorld-chatGPT.RData", 'm2', 'real', 'chatgpt')
df_m2_generation_bard <- process_data("bard/m2-generation-bard.RData", 'm2', 'generation', 'bard')
df_m2_knowledge_bard <- process_data("bard/m2-knowledge-bard.RData", 'm2', 'knowledge', 'bard')
df_m2_real_bard <- process_data("bard/m2-realWorld-bard.RData", 'm2', 'real', 'bard')
df_m2_generation_llama <- process_data("llama/m2-generation-llama2.RData", 'm2', 'generation', 'llama')
df_m2_knowledge_llama <- process_data("llama/m2-knowledge-llama2.RData", 'm2', 'knowledge', 'llama')
df_m2_real_llama <- process_data("llama/m2-realworld-llama2.RData", 'm2', 'real', 'llama')
df_windows_generation_chatgpt <- process_data("chatgpt/windows11-generation-chatgpt.RData", 'windows', 'generation', 'chatgpt')
df_windows_knowledge_chatgpt <- process_data("chatgpt/windows11-knowledge-chatgpt.RData", 'windows', 'knowledge', 'chatgpt')
df_windows_real_chatgpt <- process_data("chatgpt/windows11-real-chatgpt.RData", 'windows', 'real', 'chatgpt')
df_windows_generation_bard <- process_data("bard/windows11-generation-bard.RData", 'windows', 'generation', 'bard')
df_windows_knowledge_bard <- process_data("bard/windows11-knowledge-bard.RData", 'windows', 'knowledge', 'bard')
df_windows_real_bard <- process_data("bard/windows11-real-bard.RData", 'windows', 'real', 'bard')
df_windows_generation_llama <- process_data("llama/windows11-generation-llama.RData", 'windows', 'generation', 'llama')
df_windows_knowledge_llama <- process_data("llama/windows11-knowledge-llama.RData", 'windows', 'knowledge', 'llama')
df_windows_real_llama <- process_data("llama/windows11-real-llama.RData", 'windows', 'real', 'llama')

# Summary statistics
summary(df_linux_generation_chatgpt$power)

# Raw visualization
hist(df_linux_generation_chatgpt$power, main="Histogram of Power Usage", xlab="Power Usage", ylab="Frequency", col="skyblue", border="black")
boxplot(df_linux_generation_chatgpt$power)

# Function removes outlier by IQR rule
remove_outliers <- function(df) {
  q1 <- quantile(df[['power']], 0.25)
  q3 <- quantile(df[['power']], 0.75)
  iqr <- q3 - q1
  
  lower_threshold <- q1 - 1.5 * iqr
  upper_threshold <- q3 + 1.5 * iqr
  
  df_filtered <- df[df[['power']] >= lower_threshold & df[['power']] <= upper_threshold, ]
  return(df_filtered)
}

df_linux_generation_chatgpt <- remove_outliers(df_linux_generation_chatgpt)
df_linux_knowledge_chatgpt <- remove_outliers(df_linux_knowledge_chatgpt)
df_linux_real_chatgpt <- remove_outliers(df_linux_real_chatgpt)
df_linux_generation_bard <- remove_outliers(df_linux_generation_bard)
df_linux_knowledge_bard <- remove_outliers(df_linux_knowledge_bard)
df_linux_real_bard <- remove_outliers(df_linux_real_bard)
df_linux_generation_llama <- remove_outliers(df_linux_generation_llama)
df_linux_knowledge_llama <- remove_outliers(df_linux_knowledge_llama)
df_linux_real_llama <- remove_outliers(df_linux_real_llama)
df_m2_gneration_chatgpt <- remove_outliers(df_m2_generation_chatgpt)
df_m2_knowledge_chatgpt <- remove_outliers(df_m2_knowledge_chatgpt)
df_m2_real_chatgpt <- remove_outliers(df_m2_real_chatgpt)
df_m2_generation_bard <- remove_outliers(df_m2_generation_bard)
df_m2_knowledge_bard <- remove_outliers(df_m2_knowledge_bard)
df_m2_real_bard <- remove_outliers(df_m2_real_bard)
df_m2_generation_llama <- remove_outliers(df_m2_generation_llama)
df_m2_knowledge_llama <- remove_outliers(df_m2_knowledge_llama)
df_m2_real_llama <- remove_outliers(df_m2_real_llama)
df_windows_gneration_chatgpt <- remove_outliers(df_windows_generation_chatgpt)
df_windows_knowledge_chatgpt <- remove_outliers(df_windows_knowledge_chatgpt)
df_windows_real_chatgpt <- remove_outliers(df_windows_real_chatgpt)
df_windows_generation_bard <- remove_outliers(df_windows_generation_bard)
df_windows_knowledge_bard <- remove_outliers(df_windows_knowledge_bard)
df_windows_real_bard <- remove_outliers(df_windows_real_bard)
df_windows_generation_llama <- remove_outliers(df_windows_generation_llama)
df_windows_knowledge_llama <- remove_outliers(df_windows_knowledge_llama)
df_windows_real_llama <- remove_outliers(df_windows_real_llama)


hist(df_linux_generation_chatgpt$power, main="Histogram of Power Usage", xlab="Power Usage", ylab="Frequency", col="skyblue", border="black")
boxplot(df_linux_generation_chatgpt$power)

# qqplot
qqnorm(df_linux_generation_chatgpt$power)
qqline(df_linux_generation_chatgpt$power, col = "red")

# Boxplot: Linux-Generation
boxplot(list(df_linux_generation_chatgpt$power, 
            df_linux_generation_bard$power,
            df_linux_generation_llama$power), 
        main="Linux-Generation", names=c("ChatGPT", "Bard", "Llama2"),
        ylab="Power"
        )
# TODO: Linux has a admin right problem about saving image through png()
# save the image as png
png("figures/linux-generation-boxplot.jpeg")

# Linux-Knowledge
boxplot(list(df_linux_knowledge_chatgpt$power, 
             df_linux_knowledge_bard$power,
             df_linux_knowledge_llama$power), 
        main="Linux-Knowledge", names=c("ChatGPT", "Bard", "Llama2"),
        ylab="Power")
# Save image
png("figures/linux-knowledge-boxplot.jpeg")

# Linux-Real
boxplot(list(df_linux_real_chatgpt$power, 
             df_linux_real_bard$power,
             df_linux_real_llama$power), 
        main="Linux-Real", names=c("ChatGPT", "Bard", "Llama2"),
        ylab="Power")
# Save image
png("figures/linux-real-boxplot.jpeg")

# M2-Generation
boxplot(list(df_m2_generation_chatgpt$power, 
             df_m2_generation_bard$power,
             df_m2_generation_llama$power), 
        main="M2-Generation", names=c("ChatGPT", "Bard", "Llama2"),
        ylab="Power")
png("figures/m2-generation-boxplot.jpeg")

# M2-Knowledge
boxplot(list(df_m2_knowledge_chatgpt$power, 
             df_m2_knowledge_bard$power,
             df_m2_knowledge_llama$power), 
        main="M2-Knowledge", names=c("ChatGPT", "Bard", "Llama2"),
        ylab="Power")
png("figures/m2-knowledge-boxplot.jpeg")

# M2-Real
boxplot(list(df_m2_real_chatgpt$power, 
             df_m2_real_bard$power,
             df_m2_real_llama$power), 
        main="M2-Real", names=c("ChatGPT", "Bard", "Llama2"),
        ylab="Power")
png("figures/m2-real-boxplot.jpeg")

# Windows-Generation
boxplot(list(df_windows_generation_chatgpt$power, 
             df_windows_generation_bard$power,
             df_windows_generation_llama$power), 
        main="Windows-Generation", names=c("ChatGPT", "Bard", "Llama2"),
        ylab="Power")
png("figures/windows-generation-boxplot.jpeg")

# Windows-Knowledge
boxplot(list(df_windows_knowledge_chatgpt$power, 
             df_windows_knowledge_bard$power,
             df_windows_knowledge_llama$power), 
        main="Windows-Knowledge", names=c("ChatGPT", "Bard", "Llama2"),
        ylab="Power")
png("figures/windows-knowledge-boxplot.jpeg")

# Windows-Real
boxplot(list(df_windows_real_chatgpt$power, 
             df_windows_real_bard$power,
             df_windows_real_llama$power), 
        main="Windows-Real", names=c("ChatGPT", "Bard", "Llama2"),
        ylab="Power")
png("figures/windows-real-boxplot.jpeg")



# Violin plot of interesting 
ggplot(list(df_windows_real_chatgpt$power, 
            df_windows_real_bard$power,
            df_windows_real_llama$power), aes(x = "Linux Generation", y = power)) +
  geom_violin() +
  ylab("Power") +
  xlab("Linux")


# Scatterplot
# take the average of all the dataframe powers
# plot the average power of LLM interaction per LLM by operating system.
ggplot(df_linux_generation_chatgpt, aes(x = llm, y = power, label = llm)) +
  geom_point(aes(color = llm), size = 3) +
  geom_text(aes(label = llm), vjust = 1.5, hjust = 1.5) +
  labs(title = "Average power of LLM interaction per LLM by operating system.",
       x = "Machine Type",
       y = "Power Usage (Watts)") +
  theme_minimal()
