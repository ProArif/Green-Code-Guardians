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

# Function processes data: CPU Utilization
process_data_cpu <- function(filename, machine, promptType, llm) {
  load(filename)

  # calling data.frame to collapse the time and count vectors.
  df <- data.frame(
    power = new_data_df$cpu.usage,
    machine = factor(rep(machine, nrow(new_data_df))),
    promptType = factor(rep(promptType, nrow(new_data_df))),
    llm = factor(rep(llm, nrow(new_data_df)))
  )
  colnames(df) = c('power', 'machine', 'prompt', 'llm')
  return(df)
}

# Load and process the data
df_linux_generation_chatgpt <- process_data_cpu("formatted-data/RData/linux-generation-chatgpt.Rdata", 'linux', 'generation', 'chatgpt')
df_linux_knowledge_chatgpt <- process_data_cpu("formatted-data/RData/linux-knowledge-chatgpt.Rdata", 'linux', 'knowledge', 'chatgpt')
df_linux_real_chatgpt <- process_data_cpu("formatted-data/RData/linux-realworld-chatgpt.Rdata", 'linux', 'real', 'chatgpt')
df_linux_generation_bard <- process_data_cpu("formatted-data/RData/linux-generation-bard.Rdata", 'linux', 'generation', 'bard')
df_linux_knowledge_bard <- process_data_cpu("formatted-data/RData/linux-knowledge-bard.Rdata", 'linux', 'knowledge', 'bard')
df_linux_real_bard <- process_data_cpu("formatted-data/RData/linux-realworld-bard.Rdata", 'linux', 'real', 'bard')
df_linux_generation_llama <- process_data_cpu("formatted-data/RData/linux-generation-llama.Rdata", 'linux', 'generation', 'llama')
df_linux_knowledge_llama <- process_data_cpu("formatted-data/RData/linux-knowledge-llama.Rdata", 'linux', 'knowledge', 'llama')
df_linux_real_llama <- process_data_cpu("formatted-data/RData/linux-realworld-llama.Rdata", 'linux', 'real', 'llama')
df_m2_generation_chatgpt <- process_data_cpu("formatted-data/RData/m2-generation-chatgpt.Rdata", 'm2', 'generation', 'chatgpt')
df_m2_knowledge_chatgpt <- process_data_cpu("formatted-data/RData/m2-knowledge-chatgpt.Rdata", 'm2', 'knowledge', 'chatgpt')
df_m2_real_chatgpt <- process_data_cpu("formatted-data/RData/m2-realworld-chatgpt.Rdata", 'm2', 'real', 'chatgpt')
df_m2_generation_bard <- process_data_cpu("formatted-data/RData/m2-generation-bard.Rdata", 'm2', 'generation', 'bard')
df_m2_knowledge_bard <- process_data_cpu("formatted-data/RData/m2-knowledge-bard.Rdata", 'm2', 'knowledge', 'bard')
df_m2_real_bard <- process_data_cpu("formatted-data/RData/m2-realworld-bard.Rdata", 'm2', 'real', 'bard')
df_m2_generation_llama <- process_data_cpu("formatted-data/RData/m2-generation-llama.Rdata", 'm2', 'generation', 'llama')
df_m2_knowledge_llama <- process_data_cpu("formatted-data/RData/m2-knowledge-llama.Rdata", 'm2', 'knowledge', 'llama')
df_m2_real_llama <- process_data_cpu("formatted-data/RData/m2-realworld-llama.Rdata", 'm2', 'real', 'llama')
df_windows_generation_chatgpt <- process_data_cpu("formatted-data/RData/windows11-generation-chatgpt.Rdata", 'windows', 'generation', 'chatgpt')
df_windows_knowledge_chatgpt <- process_data_cpu("formatted-data/RData/windows11-knowledge-chatgpt.Rdata", 'windows', 'knowledge', 'chatgpt')
df_windows_real_chatgpt <- process_data_cpu("formatted-data/RData/windows11-realworld-chatgpt.Rdata", 'windows', 'real', 'chatgpt')
df_windows_generation_bard <- process_data_cpu("formatted-data/RData/windows11-generation-bard.Rdata", 'windows', 'generation', 'bard')
df_windows_knowledge_bard <- process_data_cpu("formatted-data/RData/windows11-knowledge-bard.Rdata", 'windows', 'knowledge', 'bard')
df_windows_real_bard <- process_data_cpu("formatted-data/RData/windows11-realworld-bard.Rdata", 'windows', 'real', 'bard')
df_windows_generation_llama <- process_data_cpu("formatted-data/RData/windows11-generation-llama.Rdata", 'windows', 'generation', 'llama')
df_windows_knowledge_llama <- process_data_cpu("formatted-data/RData/windows11-knowledge-llama.Rdata", 'windows', 'knowledge', 'llama')
df_windows_real_llama <- process_data_cpu("formatted-data/RData/windows11-realworld-llama.Rdata", 'windows', 'real', 'llama')

df_m1_generation_chatgpt <- process_data("chatgpt/m1-generation-chatgpt.RData", 'm1', 'generation', 'chatgpt')
df_m1_knowledge_chatgpt <- process_data("chatgpt/m1-knowledge-chatgpt.RData", 'm1', 'knowledge', 'chatgpt')
df_m1_real_chatgpt <- process_data("chatgpt/m1-realworld-chatgpt.RData", 'm1', 'real', 'chatgpt')
df_m1_generation_bard <- process_data("bard/m1-generation-bard.RData", 'm1', 'generation', 'bard')
df_m1_knowledge_bard <- process_data("bard/m1-knowledge-bard.RData", 'm1', 'knowledge', 'bard')
df_m1_real_bard <- process_data("bard/m1-realworld-bard.RData", 'm1', 'real', 'bard')
df_m1_generation_llama <- process_data("llama/m1-generation-llama.RData", 'm1', 'generation', 'llama')
df_m1_knowledge_llama <- process_data("llama/m1-knowledge-llama.RData", 'm1', 'knowledge', 'llama')
df_m1_real_llama <- process_data("llama/m1-realworld-llama.RData", 'm1', 'real', 'llama')

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

df_m1_generation_chatgpt <- remove_outliers(df_m1_generation_chatgpt)
df_m1_knowledge_chatgpt <- remove_outliers(df_m1_knowledge_chatgpt)
df_m1_real_chatgpt <- remove_outliers(df_m1_real_chatgpt)
df_m1_generation_bard <- remove_outliers(df_m1_generation_bard)
df_m1_knowledge_bard <- remove_outliers(df_m1_knowledge_bard)
df_m1_real_bard <- remove_outliers(df_m1_real_bard)
df_m1_generation_llama <- remove_outliers(df_m1_generation_llama)
df_m1_knowledge_llama <- remove_outliers(df_m1_knowledge_llama)
df_m1_real_llama <- remove_outliers(df_m1_real_llama)


hist(df_linux_generation_chatgpt$power, main="Histogram of Power Usage", xlab="Power Usage", ylab="Frequency", col="skyblue", border="black")
boxplot(df_linux_generation_chatgpt$power)

# qqplot
qqnorm(df_linux_generation_chatgpt$power)
qqline(df_linux_generation_chatgpt$power, col = "red")

# Linux-Generation
# Create a new data frame with a grouping variable
combined_data <- bind_rows(
  df_linux_generation_chatgpt %>% mutate(Chatbot = "ChatGPT"),
  df_linux_generation_bard %>% mutate(Chatbot = "Bard"),
  df_linux_generation_llama %>% mutate(Chatbot = "Llama2")
)


# Create a boxplot with grouping
ggplot(combined_data, aes(x = Chatbot, y = power)) +
  geom_boxplot(fill = "gray") +  # Set fill color to grayscale
  labs(title = "Linux-Generation CPU Utilization", y = "Power") +
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
  labs(title = "Linux-Knowledge CPU Utilization", y = "Power") +
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
  labs(title = "Linux-RealWorld CPU Utilization", y = "Power") +
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
  labs(title = "M2-Generation CPU Utilization", y = "Power") +
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
  labs(title = "M2-Knowledge CPU Utilization", y = "Power") +
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
  labs(title = "M2-RealWorld CPU Utilization", y = "Power") +
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
  labs(title = "Windows-Generation CPU Utilization", y = "Power") +
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
  labs(title = "Windows-Knowledge CPU Utilization", y = "Power") +
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
  labs(title = "Windows-RealWorld CPU Utilization", y = "Power") +
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

# M1-Generation
# Create a new data frame with a grouping variable
combined_data <- bind_rows(
  df_m1_generation_chatgpt %>% mutate(Chatbot = "ChatGPT"),
  df_m1_generation_bard %>% mutate(Chatbot = "Bard"),
  df_m1_generation_llama %>% mutate(Chatbot = "Llama2")
)

# Create a boxplot with grouping
ggplot(combined_data, aes(x = Chatbot, y = power)) +
  geom_boxplot(fill = "gray") +  # Set fill color to grayscale
  labs(title = "M1-Generation CPU Utilization", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend


# Save the boxplot as a PNG file
ggsave("visualization/m1-generation-boxplot.png", width = 8, height = 6, units = "in")

# Close the PNG device
dev.off()


# M1-Knowledge
# Create a new data frame with a grouping variable
combined_data <- bind_rows(
  df_m1_knowledge_chatgpt %>% mutate(Chatbot = "ChatGPT"),
  df_m1_knowledge_bard %>% mutate(Chatbot = "Bard"),
  df_m1_knowledge_llama %>% mutate(Chatbot = "Llama2")
)

# Create a boxplot with grouping
ggplot(combined_data, aes(x = Chatbot, y = power)) +
  geom_boxplot(fill = "gray") +  # Set fill color to grayscale
  labs(title = "M1-Knowledge", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend


# Save the boxplot as a PNG file
ggsave("visualization/m1-knowledge-boxplot.png", width = 8, height = 6, units = "in")

# Close the PNG device
dev.off()


# M1-Real
# Create a new data frame with a grouping variable
combined_data <- bind_rows(
  df_m1_real_chatgpt %>% mutate(Chatbot = "ChatGPT"),
  df_m1_real_bard %>% mutate(Chatbot = "Bard"),
  df_m1_real_llama %>% mutate(Chatbot = "Llama2")
)

# Create a boxplot with grouping
ggplot(combined_data, aes(x = Chatbot, y = power)) +
  geom_boxplot(fill = "gray") +  # Set fill color to grayscale
  labs(title = "M1-RealWorld", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend


# Save the boxplot as a PNG file
ggsave("visualization/m1-real-boxplot.png", width = 8, height = 6, units = "in")

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
