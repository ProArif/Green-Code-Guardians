# Install the jsonlite package (if not already installed)
if (!requireNamespace("jsonlite", quietly = TRUE)) {
  install.packages("jsonlite")
}

# Load the jsonlite library
library(jsonlite)

# Create a list of file paths to JSON files
file_paths <- c(
  "linux-generation-llama.json",
  "linux-knowledge-llama.json",
  "linux-real-llama.json"
)

# function to format and save the counter data as RData
format_and_save_rdata <- function(file_path) {
  # Load JSON data from the file
  data <- fromJSON(file_path, warn = F)
  
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

