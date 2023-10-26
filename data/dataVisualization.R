install.packages("tidyverse")
install.packages("ggplot2")

library(tidyverse)
library(ggplot2)

# Define the factors
prompt_type <- c('generation', 'knowledge', 'real')
machine <- c('linux', 'm2', 'm1', 'windows')
llm <- c('chatgpt', 'bard', 'llama2')

# Generalize this to all
load("chatgpt/linux-generation-chatgpt.RData")
sample <- counter_data$sampleGroups[[1]]$samples
colnames(sample)[colnames(sample) == "count"] <- "powerUsage"

df <- data.frame(
  sample$time,
  sample$powerUsage
)
colnames(df) = c('time', 'power')
df$machine <- factor(rep('linux', nrow(sample)))
df$promptType <- factor(rep('generation', nrow(sample)))
df$llm <- factor(rep('chatgpt', nrow(sample)))

# Summary statistics
summary(df$power)

# Raw visualization
hist(df$power, main="Histogram of Power Usage", xlab="Power Usage", ylab="Frequency", col="skyblue", border="black")
boxplot(df$power)

# Calculate the IQR
q1 <- quantile(df$power, 0.25)
q3 <- quantile(df$power, 0.75)
iqr <- q3 - q1

# Define lower and upper bounds
lower_threshold <- q1 - 1.5 * iqr
upper_threshold <- q3 + 1.5 * iqr

# Remove outliers
df <- df[df$power >= lower_threshold & df$power <= upper_threshold, ]

hist(df$power, main="Histogram of Power Usage", xlab="Power Usage", ylab="Frequency", col="skyblue", border="black")
boxplot(df$power)

# qqplot
qqnorm(df$power)
qqline(df$power, col = "red")

# Violin plot
ggplot(df, aes(x = "ChatGPT Generation", y = power)) +
  geom_violin() +
  ylab("Power") +
  xlab("Linux")

# Scatterplot
# take the average of all the dataframe powers

# plot the average power of LLM interaction per LLM by operating system.
ggplot(df, aes(x = llm, y = power, label = llm)) +
  geom_point(aes(color = llm), size = 3) +
  geom_text(aes(label = llm), vjust = 1.5, hjust = 1.5) +
  labs(title = "Average power of LLM interaction per LLM by operating system.",
       x = "Machine Type",
       y = "Power Usage (Watts)") +
  theme_minimal()
