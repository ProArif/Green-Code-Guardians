# Install the required packages (if not already installed)
if (!requireNamespace("tidyverse", quietly = TRUE)) {
  install.packages("tidyverse")
}

if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}

if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}

# Load the necessary libraries
library(tidyverse)
library(dplyr)
library(ggplot2)
#library(viridis)  # For color palette


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

# Linux-Generation
# Create a new data frame with a grouping variable
combined_data <- bind_rows(
  df_linux_generation_chatgpt %>% mutate(Dataset = "ChatGPT"),
  df_linux_generation_bard %>% mutate(Dataset = "Bard"),
  df_linux_generation_llama %>% mutate(Dataset = "Llama2")
)


# Create a boxplot with grouping
ggplot(combined_data, aes(x = Dataset, y = power)) +
  geom_boxplot(fill = "gray") +  # Set fill color to grayscale
  labs(title = "Linux-Generation", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend

# Save the plot as a PNG file
ggsave("visualization/linux-generation-boxplot.png", width = 8, height = 6, units = "in")


# Linux-Knowledge
# Create a new data frame with a grouping variable
combined_data <- bind_rows(
  df_linux_knowledge_chatgpt %>% mutate(Chatbot = "ChatGPT"),
  df_linux_knowledge_bard %>% mutate(Chatbot = "Bard"),
  df_linux_knowledge_llama %>% mutate(Chatbot = "Llama2")
)

# Create a boxplot with grouping
ggplot(combined_data, aes(x = Chatbot, y = power)) +
  geom_boxplot(fill = "gray") +  # Set fill color to grayscale
  labs(title = "Linux-Knowledge", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend


# Save the boxplot as a PNG file
ggsave("visualization/linux-knowledge-boxplot.png", width = 8, height = 6, units = "in")

# Close the PNG device
dev.off()

# Linux-Real
# Create a new data frame with a grouping variable
combined_data <- bind_rows(
  df_linux_real_chatgpt %>% mutate(Chatbot = "ChatGPT"),
  df_linux_real_bard %>% mutate(Chatbot = "Bard"),
  df_linux_real_llama %>% mutate(Chatbot = "Llama2")
)

# Create a boxplot with grouping
ggplot(combined_data, aes(x = Chatbot, y = power)) +
  geom_boxplot(fill = "gray") +  # Set fill color to grayscale
  labs(title = "Linux-RealWorld", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend


# Save the boxplot as a PNG file
ggsave("visualization/linux-real-boxplot.png", width = 8, height = 6, units = "in")

# Close the PNG device
dev.off()

# M2-Generation
# Create a new data frame with a grouping variable
combined_data <- bind_rows(
  df_m2_generation_chatgpt %>% mutate(Chatbot = "ChatGPT"),
  df_m2_generation_bard %>% mutate(Chatbot = "Bard"),
  df_m2_generation_llama %>% mutate(Chatbot = "Llama2")
)

# Create a boxplot with grouping
ggplot(combined_data, aes(x = Chatbot, y = power)) +
  geom_boxplot(fill = "gray") +  # Set fill color to grayscale
  labs(title = "M2-Generation", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend


# Save the boxplot as a PNG file
ggsave("visualization/m2-generation-boxplot.png", width = 8, height = 6, units = "in")

# Close the PNG device
dev.off()


# M2-Knowledge
# Create a new data frame with a grouping variable
combined_data <- bind_rows(
  df_m2_knowledge_chatgpt %>% mutate(Chatbot = "ChatGPT"),
  df_m2_knowledge_bard %>% mutate(Chatbot = "Bard"),
  df_m2_knowledge_llama %>% mutate(Chatbot = "Llama2")
)

# Create a boxplot with grouping
ggplot(combined_data, aes(x = Chatbot, y = power)) +
  geom_boxplot(fill = "gray") +  # Set fill color to grayscale
  labs(title = "M2-Knowledge", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend


# Save the boxplot as a PNG file
ggsave("visualization/m2-knowledge-boxplot.png", width = 8, height = 6, units = "in")

# Close the PNG device
dev.off()


# M2-Real
# Create a new data frame with a grouping variable
combined_data <- bind_rows(
  df_m2_real_chatgpt %>% mutate(Chatbot = "ChatGPT"),
  df_m2_real_bard %>% mutate(Chatbot = "Bard"),
  df_m2_real_llama %>% mutate(Chatbot = "Llama2")
)

# Create a boxplot with grouping
ggplot(combined_data, aes(x = Chatbot, y = power)) +
  geom_boxplot(fill = "gray") +  # Set fill color to grayscale
  labs(title = "M2-RealWorld", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend


# Save the boxplot as a PNG file
ggsave("visualization/m2-real-boxplot.png", width = 8, height = 6, units = "in")

# Close the PNG device
dev.off()

# Windows-Generation
combined_data <- bind_rows(
  df_windows_generation_chatgpt %>% mutate(Chatbot = "ChatGPT"),
  df_windows_generation_bard %>% mutate(Chatbot = "Bard"),
  df_windows_generation_llama %>% mutate(Chatbot = "Llama2")
)

# Create a boxplot with grouping
ggplot(combined_data, aes(x = Chatbot, y = power)) +
  geom_boxplot(fill = "gray") +  # Set fill color to grayscale
  labs(title = "Windows-Generation", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend


# Save the boxplot as a PNG file
ggsave("visualization/windows-generation-boxplot.png", width = 8, height = 6, units = "in")

# Close the PNG device
dev.off()


# Windows-Knowledge
combined_data <- bind_rows(
  df_windows_knowledge_chatgpt %>% mutate(Chatbot = "ChatGPT"),
  df_windows_knowledge_bard %>% mutate(Chatbot = "Bard"),
  df_windows_knowledge_llama %>% mutate(Chatbot = "Llama2")
)

# Create a boxplot with grouping
ggplot(combined_data, aes(x = Chatbot, y = power)) +
  geom_boxplot(fill = "gray") +  # Set fill color to grayscale
  labs(title = "Windows-Knowledge", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend


# Save the boxplot as a PNG file
ggsave("visualization/windows-knowledge-boxplot.png", width = 8, height = 6, units = "in")

# Close the PNG device
dev.off()


# Windows-Real
combined_data <- bind_rows(
  df_windows_real_chatgpt %>% mutate(Chatbot = "ChatGPT"),
  df_windows_real_bard %>% mutate(Chatbot = "Bard"),
  df_windows_real_llama %>% mutate(Chatbot = "Llama2")
)

# Create a boxplot with grouping
ggplot(combined_data, aes(x = Chatbot, y = power)) +
  geom_boxplot(fill = "gray") +  # Set fill color to grayscale
  labs(title = "Windows-RealWorld", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend
boxplot(list(df_windows_real_chatgpt$power, 
             df_windows_real_bard$power,
             df_windows_real_llama$power), 
        main="Windows-Real", names=c("ChatGPT", "Bard", "Llama2"),
        ylab="Power")
ggsave("visualization/windows-real-boxplot.png", width = 8, height = 6, units = "in")

# Close the PNG device
dev.off()



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
