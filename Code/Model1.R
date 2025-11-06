here::i_am("Code/Model1.R")
library(knitr)
library(labelled)
library(gtsummary)
data <- readRDS(
  file = here::here("Edited_data/Data_clean.rds")
)

data$SMOKING <- factor(data$SMOKING, levels = c(0,1), labels = c("No", "Yes"))
data$COUGHING <- factor(data$COUGHING, levels = c(0,1), labels = c("No", "Yes"))
data$LUNG_CANCER <- factor(data$LUNG_CANCER, levels = c("NO", "YES"))

model <- glm(LUNG_CANCER ~ GENDER + AGE + SMOKING + COUGHING, 
             data = data, 
             family = binomial)

regression_table <- tbl_regression(model)|>add_global_p()
# Ensure the folder exists before saving
dir.create(here::here("models"), showWarnings = FALSE, recursive = TRUE)
saveRDS(
  regression_table,
  file = here::here("models/Model_one.rds")
)

