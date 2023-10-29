# Green-Code-Guardians

This repository is for the code portion of Green Lab course from VU Amsterdam. The code portion R scripts for data analysis.


### Normality testing
To check normality of our data you can run Normality.R script in the root directory. It will generate histograms, qq-plots and timeline distribution of value per Machine-Task-LLM. Moreover it will generate this visualisations for both cpu and power usage. 

### Hypothesis testing
The First Research Question Hypothesis is tested inside of Power-Kruskal-Wallis-test.R script in the root directory. When you run this script it will print the values for all the tests and their corresponding p-value. 

### Power consumption in Watts
If you want to check the power consumption of the experiment per machine per llm per task, you can run Power-usage-Watts.R script in the root directory.

### Data Visualization
To recreate the data visualizations go to ./data/dataVisualization.R. All the generated visuals are placed in ./data/visualization.

### Interaction [Depreciated]
Interaction script with Selenium and RunnerConfig file for experiment-runner.
