here::i_am("Code/Table1.R")

data <- readRDS(
  file = here::here("Edited_data/Data_clean.rds")
)

library(gtsummary)

Table_one <- data |>
  select("GENDER", "SMOKING", "AGE", "LUNG_CANCER") |>
  tbl_summary(by = LUNG_CANCER) |>
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Lung Cancer**") |>
  add_overall()

# Ensure the folder exists before saving
dir.create(here::here("tables"), showWarnings = FALSE, recursive = TRUE)
saveRDS(
  Table_one,
  file = here::here("tables/Table_one.rds")
)
