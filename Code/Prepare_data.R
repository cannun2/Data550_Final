here::i_am("Code/Prepare_data.R")
absolute_path_to_data <- here::here("Raw_data", "survey_lung_cancer.csv")
data <- read.csv(absolute_path_to_data, header = TRUE)

library(labelled)
library(gtsummary)

var_label(data) <- list(
  GENDER = "Gender",
  AGE = "Age",
  SMOKING= "Smoking status",
  YELLOW_FINGERS = "Yellow Fingers",
  ANXIETY = "Anxiety",
  PEER_PRESSURE = "Peer Pressure",
  CHRONIC.DISEASE="Chronic Diease", 
  FATIGUE = "Fatigue",
  ALLERGY="Allergy",
  WHEEZING="Wheezing",
  ALCOHOL.CONSUMING="Consumes Alcohol",
  COUGHING="Coughing",
  SHORTNESS.OF.BREATH="Shortness of Breast",
  SWALLOWING.DIFFICULTY="Difficulty Swallowing",
  CHEST.PAIN="Chest Pain",
  LUNG_CANCER="Lung Cancer"
)

cols <- c("SMOKING", "YELLOW_FINGERS", "ANXIETY", "PEER_PRESSURE",
          "CHRONIC.DISEASE", "FATIGUE", "ALLERGY", "WHEEZING",
          "ALCOHOL.CONSUMING", "COUGHING", "SHORTNESS.OF.BREATH",
          "SWALLOWING.DIFFICULTY", "CHEST.PAIN")
# Subtract 1 from each of the columns
data[cols] <- lapply(data[cols], function(x) x - 1)
# Ensure the folder exists before saving
dir.create(here::here("Edited_data"), showWarnings = FALSE, recursive = TRUE)
saveRDS(
  data, 
  file = here::here("Edited_data/Data_clean.rds")
)

