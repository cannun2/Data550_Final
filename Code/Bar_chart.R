here::i_am("Code/Bar_chart.R")

data <- readRDS(
  file = here::here("Edited_data/Data_clean.rds")
)

library(ggplot2)

data$GENDER <- factor(data$GENDER, levels = c("M", "F"), labels = c("Male", "Female"))


data$SMOKING_char <- factor(data$SMOKING, levels = c(0, 1), labels = c("Non-Smoking", "Smoking"))


data$GENDER_SMOKING <- interaction(data$GENDER, data$SMOKING_char, sep = "_")


barchart <- ggplot(data, aes(x = GENDER_SMOKING, fill = LUNG_CANCER)) +
  geom_bar(position = "stack") +  
  labs(title = "Lung Cancer by Gender and Smoking Status",
       x = "Gender & Smoking Status",
       y = "Count",
       fill = "Lung Cancer") +
  theme_minimal()
# Ensure the folder exists before saving
dir.create(here::here("charts"), showWarnings = FALSE, recursive = TRUE)
ggsave(
  plot = barchart,
  , width = 8, height = 5, dpi = 300,
  device = "png",
  file=here::here("charts/barchart1.png")
)

