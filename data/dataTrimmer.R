# Install the jsonlite package (if not already installed)
if (!requireNamespace("jsonlite", quietly = TRUE)) {
  install.packages("jsonlite")
}

# Load the jsonlite library
library(jsonlite)

# Create a list of file paths to JSON files
file_paths <- c(
  # data from macOS M2
  "chatgpt/m2-generation-chatGPT.json",
  "chatgpt/m2-knowledge-chatGPT.json",
  "chatgpt/m2-realWorld-chatGPT.json",
  "bard/m2-generation-bard.json",
  "bard/m2-knowledge-bard.json",
  "bard/m2-realWorld-bard.json",
  "llama/m2-generation-llama2.json",
  "llama/m2-knowledge-llama2.json",
  "llama/m2-realworld-llama2.json",

# data from linux
  "chatgpt/linux-generation-chatgpt.json",
  "chatgpt/linux-knowledge-chatgpt.json",
  "chatgpt/linux-real-chatgpt.json",
  "bard/linux-generation-bard.json",
  "bard/linux-knowledge-bard.json",
  "bard/linux-real-bard.json",

  "llama/linux-generation-llama.json",
  "llama/linux-knowledge-llama.json",
  "llama/linux-real-llama.json",
  "llama/linux-real-llama.json",
  "llama/linux-generation-llama.json",
  "llama/linux-knowledge-llama.json",

 # data from windows
  "chatgpt/windows11-generation-chatgpt.json",
  "chatgpt/windows11-knowledge-chatgpt.json",
  "chatgpt/windows11-real-chatgpt.json",
  "bard/windows11-generation-bard.json",
  "bard/windows11-knowledge-bard.json",
  "bard/windows11-real-bard.json",
  "llama/windows11-real-llama.json",
  "llama/windows11-generation-llama.json",
  "llama/windows11-knowledge-llama.json" 

)

# function to format and save the counter data as RData
format_and_save_rdata <- function(file_path) {
  # Load JSON data from the file
  data <- fromJSON(file_path)
  
  # Access the 'counters' element
  counter_data <- data[["counters"]]
  
  # Specify the output RData file path to save the counter data
  output_rdata_file <- gsub(".json$", ".RData", file_path)
  
  # Save the counter data as RData
  save(counter_data, file = output_rdata_file)
  
  # Print a message indicating the processing is done
  cat("Formatted and saved counter data", file_path, "as", output_rdata_file, "\n")
}

# Loop through the list of file paths and format/save counter data as RData
for (file_path in file_paths) {
  format_and_save_rdata(file_path)
}

