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

# Load and process CPU Utilization data
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
df_m1_generation_chatgpt <- process_data_cpu("formatted-data/RData/m1-generation-chatgpt.Rdata", 'm1', 'generation', 'chatgpt')
df_m1_knowledge_chatgpt <- process_data_cpu("formatted-data/RData/m1-knowledge-chatgpt.Rdata", 'm1', 'knowledge', 'chatgpt')
df_m1_real_chatgpt <- process_data_cpu("formatted-data/RData/m1-realworld-chatgpt.Rdata", 'm1', 'real', 'chatgpt')
df_m1_generation_bard <- process_data_cpu("formatted-data/RData/m1-generation-bard.Rdata", 'm1', 'generation', 'bard')
df_m1_knowledge_bard <- process_data_cpu("formatted-data/RData/m1-knowledge-bard.Rdata", 'm1', 'knowledge', 'bard')
df_m1_real_bard <- process_data_cpu("formatted-data/RData/m1-realworld-bard.Rdata", 'm1', 'real', 'bard')
df_m1_generation_llama <- process_data_cpu("formatted-data/RData/m1-generation-llama.Rdata", 'm1', 'generation', 'llama')
df_m1_knowledge_llama <- process_data_cpu("formatted-data/RData/m1-knowledge-llama.Rdata", 'm1', 'knowledge', 'llama')
df_m1_real_llama <- process_data_cpu("formatted-data/RData/m1-realworld-llama.Rdata", 'm1', 'real', 'llama')

# Function processes data: Power Utilization (as Linux does not have power utilization)
process_data_power <- function(filename, machine, promptType, llm) {
  load(filename)
  
  # calling data.frame to collapse the time and count vectors.
  df <- data.frame(
    power = new_data_df$power.usage,
    machine = factor(rep(machine, nrow(new_data_df))),
    promptType = factor(rep(promptType, nrow(new_data_df))),
    llm = factor(rep(llm, nrow(new_data_df)))
  )
  colnames(df) = c('power', 'machine', 'prompt', 'llm')
  return(df)
}

# Load dataframes for Power Utilization
power_df_m2_generation_chatgpt <- process_data_power("formatted-data/RData/m2-generation-chatgpt.Rdata", 'm2', 'generation', 'chatgpt')
power_df_m2_knowledge_chatgpt <- process_data_power("formatted-data/RData/m2-knowledge-chatgpt.Rdata", 'm2', 'knowledge', 'chatgpt')
power_df_m2_real_chatgpt <- process_data_power("formatted-data/RData/m2-realworld-chatgpt.Rdata", 'm2', 'real', 'chatgpt')
power_df_m2_generation_bard <- process_data_power("formatted-data/RData/m2-generation-bard.Rdata", 'm2', 'generation', 'bard')
power_df_m2_knowledge_bard <- process_data_power("formatted-data/RData/m2-knowledge-bard.Rdata", 'm2', 'knowledge', 'bard')
power_df_m2_real_bard <- process_data_power("formatted-data/RData/m2-realworld-bard.Rdata", 'm2', 'real', 'bard')
power_df_m2_generation_llama <- process_data_power("formatted-data/RData/m2-generation-llama.Rdata", 'm2', 'generation', 'llama')
power_df_m2_knowledge_llama <- process_data_power("formatted-data/RData/m2-knowledge-llama.Rdata", 'm2', 'knowledge', 'llama')
power_df_m2_real_llama <- process_data_power("formatted-data/RData/m2-realworld-llama.Rdata", 'm2', 'real', 'llama')
power_df_windows_generation_chatgpt <- process_data_power("formatted-data/RData/windows11-generation-chatgpt.Rdata", 'windows', 'generation', 'chatgpt')
power_df_windows_knowledge_chatgpt <- process_data_power("formatted-data/RData/windows11-knowledge-chatgpt.Rdata", 'windows', 'knowledge', 'chatgpt')
power_df_windows_real_chatgpt <- process_data_power("formatted-data/RData/windows11-realworld-chatgpt.Rdata", 'windows', 'real', 'chatgpt')
power_df_windows_generation_bard <- process_data_power("formatted-data/RData/windows11-generation-bard.Rdata", 'windows', 'generation', 'bard')
power_df_windows_knowledge_bard <- process_data_power("formatted-data/RData/windows11-knowledge-bard.Rdata", 'windows', 'knowledge', 'bard')
power_df_windows_real_bard <- process_data_power("formatted-data/RData/windows11-realworld-bard.Rdata", 'windows', 'real', 'bard')
power_df_windows_generation_llama <- process_data_power("formatted-data/RData/windows11-generation-llama.Rdata", 'windows', 'generation', 'llama')
power_df_windows_knowledge_llama <- process_data_power("formatted-data/RData/windows11-knowledge-llama.Rdata", 'windows', 'knowledge', 'llama')
power_df_windows_real_llama <- process_data_power("formatted-data/RData/windows11-realworld-llama.Rdata", 'windows', 'real', 'llama')
power_df_m1_generation_chatgpt <- process_data_power("formatted-data/RData/m1-generation-chatgpt.Rdata", 'm1', 'generation', 'chatgpt')
power_df_m1_knowledge_chatgpt <- process_data_power("formatted-data/RData/m1-knowledge-chatgpt.Rdata", 'm1', 'knowledge', 'chatgpt')
power_df_m1_real_chatgpt <- process_data_power("formatted-data/RData/m1-realworld-chatgpt.Rdata", 'm1', 'real', 'chatgpt')
power_df_m1_generation_bard <- process_data_power("formatted-data/RData/m1-generation-bard.Rdata", 'm1', 'generation', 'bard')
power_df_m1_knowledge_bard <- process_data_power("formatted-data/RData/m1-knowledge-bard.Rdata", 'm1', 'knowledge', 'bard')
power_df_m1_real_bard <- process_data_power("formatted-data/RData/m1-realworld-bard.Rdata", 'm1', 'real', 'bard')
power_df_m1_generation_llama <- process_data_power("formatted-data/RData/m1-generation-llama.Rdata", 'm1', 'generation', 'llama')
power_df_m1_knowledge_llama <- process_data_power("formatted-data/RData/m1-knowledge-llama.Rdata", 'm1', 'knowledge', 'llama')
power_df_m1_real_llama <- process_data_power("formatted-data/RData/m1-realworld-llama.Rdata", 'm1', 'real', 'llama')

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

# CPU Utilization
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

# Power Utilization
power_df_m1_generation_bard <- remove_outliers(power_power_df_m1_generation_bard)
power_df_m2_knowledge_chatgpt <- remove_outliers(power_df_m2_knowledge_chatgpt)
power_df_m2_real_chatgpt <- remove_outliers(power_df_m2_real_chatgpt)
power_df_m2_generation_bard <- remove_outliers(power_df_m2_generation_bard)
power_df_m2_knowledge_bard <- remove_outliers(power_df_m2_knowledge_bard)
power_df_m2_real_bard <- remove_outliers(power_df_m2_real_bard)
power_df_m2_generation_llama <- remove_outliers(power_df_m2_generation_llama)
power_df_m2_knowledge_llama <- remove_outliers(power_df_m2_knowledge_llama)
power_df_m2_real_llama <- remove_outliers(power_df_m2_real_llama)
power_df_windows_gneration_chatgpt <- remove_outliers(power_df_windows_generation_chatgpt)
power_df_windows_knowledge_chatgpt <- remove_outliers(power_df_windows_knowledge_chatgpt)
power_df_windows_real_chatgpt <- remove_outliers(power_df_windows_real_chatgpt)
power_df_windows_generation_bard <- remove_outliers(power_df_windows_generation_bard)
power_df_windows_knowledge_bard <- remove_outliers(power_df_windows_knowledge_bard)
power_df_windows_real_bard <- remove_outliers(power_df_windows_real_bard)
power_df_windows_generation_llama <- remove_outliers(power_df_windows_generation_llama)
power_df_windows_knowledge_llama <- remove_outliers(power_df_windows_knowledge_llama)
power_df_windows_real_llama <- remove_outliers(power_df_windows_real_llama)
power_df_m1_generation_chatgpt <- remove_outliers(power_df_m1_generation_chatgpt)
power_df_m1_knowledge_chatgpt <- remove_outliers(power_df_m1_knowledge_chatgpt)
power_df_m1_real_chatgpt <- remove_outliers(power_df_m1_real_chatgpt)
power_df_m1_generation_bard <- remove_outliers(power_df_m1_generation_bard)
power_df_m1_knowledge_bard <- remove_outliers(power_df_m1_knowledge_bard)
power_df_m1_real_bard <- remove_outliers(power_df_m1_real_bard)
power_df_m1_generation_llama <- remove_outliers(power_df_m1_generation_llama)
power_df_m1_knowledge_llama <- remove_outliers(power_df_m1_knowledge_llama)
power_df_m1_real_llama <- remove_outliers(power_df_m1_real_llama)

hist(df_linux_generation_chatgpt$power, main="Histogram of Power Usage", xlab="Power Usage", ylab="Frequency", col="skyblue", border="black")
boxplot(df_linux_generation_chatgpt$power)

# qqplot
qqnorm(df_linux_generation_chatgpt$power)
qqline(df_linux_generation_chatgpt$power, col = "red")

# Boxplots of CPU Utilization:
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
ggsave("visualization/cpu-linux-generation-boxplot.png", width = 8, height = 6, units = "in")


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
ggsave("visualization/cpu-linux-knowledge-boxplot.png", width = 8, height = 6, units = "in")

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
ggsave("visualization/cpu-linux-real-boxplot.png", width = 8, height = 6, units = "in")

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
ggsave("visualization/cpu-m2-generation-boxplot.png", width = 8, height = 6, units = "in")

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
ggsave("visualization/cpu-m2-knowledge-boxplot.png", width = 8, height = 6, units = "in")

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
ggsave("visualization/cpu-m2-real-boxplot.png", width = 8, height = 6, units = "in")

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
ggsave("visualization/cpu-windows-generation-boxplot.png", width = 8, height = 6, units = "in")

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
ggsave("visualization/cpu-windows-knowledge-boxplot.png", width = 8, height = 6, units = "in")

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

ggsave("visualization/cpu-windows-real-boxplot.png", width = 8, height = 6, units = "in")

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
ggsave("visualization/cpu-m1-generation-boxplot.png", width = 8, height = 6, units = "in")

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
  labs(title = "M1-Knowledge CPU Utilization", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend


# Save the boxplot as a PNG file
ggsave("visualization/cpu-m1-knowledge-boxplot.png", width = 8, height = 6, units = "in")

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
  labs(title = "M1-RealWorld CPU Utilization", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend


# Save the boxplot as a PNG file
ggsave("visualization/cpu-m1-real-boxplot.png", width = 8, height = 6, units = "in")

# Close the PNG device
dev.off()

# Boxplot of Power Utilization
# M2-Generation
# Create a new data frame with a grouping variable
combined_data <- bind_rows(
  power_df_m2_generation_chatgpt %>% mutate(Chatbot = "ChatGPT"),
  power_df_m2_generation_bard %>% mutate(Chatbot = "Bard"),
  power_df_m2_generation_llama %>% mutate(Chatbot = "Llama2")
)

# Create a boxplot with grouping
ggplot(combined_data, aes(x = Chatbot, y = power)) +
  geom_boxplot(fill = "gray") +  # Set fill color to grayscale
  labs(title = "M2-Generation Power Utilization", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend


# Save the boxplot as a PNG file
ggsave("visualization/power-m2-generation-boxplot.png", width = 8, height = 6, units = "in")

# Close the PNG device
dev.off()


# M2-Knowledge
# Create a new data frame with a grouping variable
combined_data <- bind_rows(
  power_df_m2_knowledge_chatgpt %>% mutate(Chatbot = "ChatGPT"),
  power_df_m2_knowledge_bard %>% mutate(Chatbot = "Bard"),
  power_df_m2_knowledge_llama %>% mutate(Chatbot = "Llama2")
)

# Create a boxplot with grouping
ggplot(combined_data, aes(x = Chatbot, y = power)) +
  geom_boxplot(fill = "gray") +  # Set fill color to grayscale
  labs(title = "M2-Knowledge Power Utilization", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend


# Save the boxplot as a PNG file
ggsave("visualization/power-m2-knowledge-boxplot.png", width = 8, height = 6, units = "in")

# Close the PNG device
dev.off()


# M2-Real
# Create a new data frame with a grouping variable
combined_data <- bind_rows(
  power_df_m2_real_chatgpt %>% mutate(Chatbot = "ChatGPT"),
  power_df_m2_real_bard %>% mutate(Chatbot = "Bard"),
  power_df_m2_real_llama %>% mutate(Chatbot = "Llama2")
)

# Create a boxplot with grouping
ggplot(combined_data, aes(x = Chatbot, y = power)) +
  geom_boxplot(fill = "gray") +  # Set fill color to grayscale
  labs(title = "M2-RealWorld Power Utilization", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend


# Save the boxplot as a PNG file
ggsave("visualization/power-m2-real-boxplot.png", width = 8, height = 6, units = "in")

# Close the PNG device
dev.off()

# Windows-Generation
combined_data <- bind_rows(
  power_df_windows_generation_chatgpt %>% mutate(Chatbot = "ChatGPT"),
  power_df_windows_generation_bard %>% mutate(Chatbot = "Bard"),
  power_df_windows_generation_llama %>% mutate(Chatbot = "Llama2")
)

# Create a boxplot with grouping
ggplot(combined_data, aes(x = Chatbot, y = power)) +
  geom_boxplot(fill = "gray") +  # Set fill color to grayscale
  labs(title = "Windows-Generation Power Utilization", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend


# Save the boxplot as a PNG file
ggsave("visualization/power-windows-generation-boxplot.png", width = 8, height = 6, units = "in")

# Close the PNG device
dev.off()

# Windows-Knowledge
combined_data <- bind_rows(
  power_df_windows_knowledge_chatgpt %>% mutate(Chatbot = "ChatGPT"),
  power_df_windows_knowledge_bard %>% mutate(Chatbot = "Bard"),
  power_df_windows_knowledge_llama %>% mutate(Chatbot = "Llama2")
)

# Create a boxplot with grouping
ggplot(combined_data, aes(x = Chatbot, y = power)) +
  geom_boxplot(fill = "gray") +  # Set fill color to grayscale
  labs(title = "Windows-Knowledge Power Utilization", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend


# Save the boxplot as a PNG file
ggsave("visualization/power-windows-knowledge-boxplot.png", width = 8, height = 6, units = "in")

# Close the PNG device
dev.off()


# Windows-Real
combined_data <- bind_rows(
  power_df_windows_real_chatgpt %>% mutate(Chatbot = "ChatGPT"),
  power_df_windows_real_bard %>% mutate(Chatbot = "Bard"),
  power_df_windows_real_llama %>% mutate(Chatbot = "Llama2")
)

# Create a boxplot with grouping
ggplot(combined_data, aes(x = Chatbot, y = power)) +
  geom_boxplot(fill = "gray") +  # Set fill color to grayscale
  labs(title = "Windows-RealWorld Power Utilization", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend

ggsave("visualization/power-windows-real-boxplot.png", width = 8, height = 6, units = "in")

# Close the PNG device
dev.off()

# M1-Generation
# Create a new data frame with a grouping variable
combined_data <- bind_rows(
  power_df_m1_generation_chatgpt %>% mutate(Chatbot = "ChatGPT"),
  power_df_m1_generation_bard %>% mutate(Chatbot = "Bard"),
  power_df_m1_generation_llama %>% mutate(Chatbot = "Llama2")
)

# Create a boxplot with grouping
ggplot(combined_data, aes(x = Chatbot, y = power)) +
  geom_boxplot(fill = "gray") +  # Set fill color to grayscale
  labs(title = "M1-Generation Power Utilization", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend


# Save the boxplot as a PNG file
ggsave("visualization/power-m1-generation-boxplot.png", width = 8, height = 6, units = "in")

# Close the PNG device
dev.off()

# M1-Knowledge
# Create a new data frame with a grouping variable
combined_data <- bind_rows(
  power_df_m1_knowledge_chatgpt %>% mutate(Chatbot = "ChatGPT"),
  power_df_m1_knowledge_bard %>% mutate(Chatbot = "Bard"),
  power_df_m1_knowledge_llama %>% mutate(Chatbot = "Llama2")
)

# Create a boxplot with grouping
ggplot(combined_data, aes(x = Chatbot, y = power)) +
  geom_boxplot(fill = "gray") +  # Set fill color to grayscale
  labs(title = "M1-Knowledge Power Utilization", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend


# Save the boxplot as a PNG file
ggsave("visualization/power-m1-knowledge-boxplot.png", width = 8, height = 6, units = "in")

# Close the PNG device
dev.off()


# M1-Real
# Create a new data frame with a grouping variable
combined_data <- bind_rows(
  power_df_m1_real_chatgpt %>% mutate(Chatbot = "ChatGPT"),
  power_df_m1_real_bard %>% mutate(Chatbot = "Bard"),
  power_df_m1_real_llama %>% mutate(Chatbot = "Llama2")
)

# Create a boxplot with grouping
ggplot(combined_data, aes(x = Chatbot, y = power)) +
  geom_boxplot(fill = "gray") +  # Set fill color to grayscale
  labs(title = "M1-RealWorld Power Utilization", y = "Power") +
  theme_minimal() +
  theme(legend.position = "none")  # Hide the legend


# Save the boxplot as a PNG file
ggsave("visualization/power-m1-real-boxplot.png", width = 8, height = 6, units = "in")

# Close the PNG device
dev.off()

# Scatterplot CPU Utilization
# ggplot2 grouping:
# Combine all dataframes into one
combined_df <- bind_rows(
  df_linux_generation_bard,
  df_linux_generation_chatgpt,
  df_linux_generation_llama,
  df_linux_knowledge_bard,
  df_linux_knowledge_chatgpt,
  df_linux_knowledge_llama,
  df_linux_real_bard,
  df_linux_real_chatgpt,
  df_linux_real_llama,
  df_m2_generation_bard,
  df_m2_generation_chatgpt,
  df_m2_generation_llama,
  df_m2_knowledge_bard,
  df_m2_knowledge_chatgpt,
  df_m2_knowledge_llama,
  df_m2_real_bard,
  df_m2_real_chatgpt,
  df_m2_real_llama,
  df_windows_generation_bard,
  df_windows_generation_chatgpt,
  df_windows_generation_llama,
  df_windows_knowledge_bard,
  df_windows_knowledge_chatgpt,
  df_windows_knowledge_llama,
  df_windows_real_bard,
  df_windows_real_chatgpt,
  df_windows_real_llama,
  df_m1_generation_bard,
  df_m1_generation_chatgpt,
  df_m1_generation_llama,
  df_m1_knowledge_bard,
  df_m1_knowledge_chatgpt,
  df_m1_knowledge_llama,
  df_m1_real_bard,
  df_m1_real_chatgpt,
  df_m1_real_llama
)

# Calculate the average power for each llm factor and machine
cpu_scatter_plot_all <- combined_df %>%
  group_by(llm, machine) %>%
  summarise(mean_power = mean(power, na.rm = TRUE))

# plot the average power of LLM interaction per LLM by operating system.
ggplot(cpu_scatter_plot_all, aes(x=llm, y=mean_power, color=machine)) +
  geom_point(size=3) +                                
  labs(title="Scatterplot of CPU Utilization of LLMs vs. Mean Power",     
       x="LLM",                                       
       y="Mean Power",                                
       color="Machine") +                             
  theme_minimal()

# save the scatterplot
ggsave("visualization/scatter-cpu-all.png", width = 8, height = 6, units = "in")
dev.off()

# Grouping only on Apple machines
apple_scatter <- cpu_scatter_plot_all %>% filter(machine %in% c("m1", "m2"))

# Plotting the filtered data
ggplot(apple_scatter, aes(x=llm, y=mean_power, color=machine)) +
  geom_point(size=3) +
  labs(title="Scatterplot of CPU Utilization Llm vs. Mean Power (M1 and M2)",
       x="Chatbot",
       y="Mean Power",
       color="Machine") +
  theme_minimal()
ggsave("visualization/scatter-cpu-apple.png", width = 8, height = 6, units = "in")
dev.off()

# Grouping only on Apple machines
apple_scatter <- cpu_scatter_plot_all %>% filter(machine %in% c("m1", "m2"))

# Plotting the filtered data
ggplot(apple_scatter, aes(x=llm, y=mean_power, color=machine)) +
  geom_point(size=3) +
  labs(title="Scatterplot of CPU Utilization Llm vs. Mean Power (M1 and M2)",
       x="Chatbot",
       y="Mean Power",
       color="Machine") +
  theme_minimal()
ggsave("visualization/scatter-cpu-apple.png", width = 8, height = 6, units = "in")
dev.off()

# Scatterplot of power utilization
combined_power_df <- bind_rows(
  power_df_m2_generation_bard,
  power_df_m2_generation_chatgpt,
  power_df_m2_generation_llama,
  power_df_m2_knowledge_bard,
  power_df_m2_knowledge_chatgpt,
  power_df_m2_knowledge_llama,
  power_df_m2_real_bard,
  power_df_m2_real_chatgpt,
  power_df_m2_real_llama,
  power_df_windows_generation_bard,
  power_df_windows_generation_chatgpt,
  power_df_windows_generation_llama,
  power_df_windows_knowledge_bard,
  power_df_windows_knowledge_chatgpt,
  power_df_windows_knowledge_llama,
  power_df_windows_real_bard,
  power_df_windows_real_chatgpt,
  power_df_windows_real_llama,
  power_df_m1_generation_bard,
  power_df_m1_generation_chatgpt,
  power_df_m1_generation_llama,
  power_df_m1_knowledge_bard,
  power_df_m1_knowledge_chatgpt,
  power_df_m1_knowledge_llama,
  power_df_m1_real_bard,
  power_df_m1_real_chatgpt,
  power_df_m1_real_llama
)

# grouping
power_scatter_plot_all <- combined_power_df %>%
  group_by(llm, machine) %>%
  summarise(mean_power = mean(power, na.rm = TRUE))

# plot the average power of LLM interaction per LLM by operating system.
ggplot(power_scatter_plot_all, aes(x=llm, y=mean_power, color=machine)) +
  geom_point(size=3) +                                
  labs(title="Scatterplot of Power Utilization of LLMs vs. Mean Power",     
       x="LLM",                                       
       y="Mean Power",                                
       color="Machine") +                             
  theme_minimal()

# save the scatterplot
ggsave("visualization/scatter-power-all.png", width = 8, height = 6, units = "in")
dev.off()

# Grouping only on Apple machines
apple_power_scatter <- power_scatter_plot_all %>% filter(machine %in% c("m1", "m2"))

# Plotting the filtered data
ggplot(apple_power_scatter, aes(x=llm, y=mean_power, color=machine)) +
  geom_point(size=3) +
  labs(title="Scatterplot of CPU Utilization Llm vs. Mean Power (M1 and M2)",
       x="Chatbot",
       y="Mean Power",
       color="Machine") +
  theme_minimal()
ggsave("visualization/scatter-power-apple.png", width = 8, height = 6, units = "in")
dev.off()

# Mean power vs machine type (Interaction type): Power Utilization
power_scatter_machine <- combined_power_df %>%
  group_by(prompt, machine) %>%
  summarise(mean_power = mean(power, na.rm = TRUE))

# Plotting the filtered data
ggplot(power_scatter_machine, aes(x=machine, y=mean_power, color=prompt)) +
  geom_point(size=3) +
  labs(title="Scatterplot of Power Utilization for Task Interactions",
       x="Machine",
       y="Mean Power",
       color="Task Interaction") +
  theme_minimal()
ggsave("visualization/scatter-power-machine-task.png", width = 8, height = 6, units = "in")
dev.off()

# Mean power vs machine type (Interaction type) (M1 and M2)
apple_power_machine_scatter <- power_scatter_machine %>% filter(machine %in% c("m1", "m2"))

# Plotting the filtered data
ggplot(apple_power_machine_scatter, aes(x=machine, y=mean_power, color=prompt)) +
  geom_point(size=3) +
  labs(title="Scatterplot of CPU Utilization for Task Interactions(M1 and M2)",
       x="Machine",
       y="Mean Power",
       color="Task Interaction") +
  theme_minimal()
ggsave("visualization/scatter-power-machine-task-apploe.png", width = 8, height = 6, units = "in")
dev.off()
