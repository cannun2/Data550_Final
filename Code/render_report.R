here::i_am(
  "Code/render_report.R"
)
# Ensure the folder exists before saving
dir.create(here::here("report"), showWarnings = FALSE, recursive = TRUE)
rmarkdown::render(
  here::here("Lung_cancer_report.Rmd")
)
