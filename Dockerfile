FROM rocker/tidyverse:4.5.1 as base

RUN mkdir /home/rstudio/project
WORKDIR /home/rstudio/project

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN apt-get update && apt-get install -y nodejs

RUN Rscript -e "renv::restore(prompt = FALSE)"

###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ######

FROM rocker/tidyverse:4.5.1
RUN mkdir /home/rstudio/project
WORKDIR /home/rstudio/project
COPY --from=base /home/rstudio/project .

COPY Makefile Makefile
COPY Lung_cancer_report.Rmd Lung_cancer_report.Rmd

RUN mkdir -p Code
RUN mkdir -p charts
RUN mkdir -p Edited_data
RUN mkdir -p models
RUN mkdir -p Raw_data
RUN mkdir -p tables
RUN mkdir -p report

COPY Raw_data/survey_lung_cancer.csv Raw_data/survey_lung_cancer.csv
COPY Code/Bar_chart.R Code/Bar_chart.R
COPY Code/Model1.R Code/Model1.R
Copy Code/Prepare_data.R Code/Prepare_data.R
Copy Code/render_report.R Code/render_report.R
Copy Code/Table1.R Code/Table1.R

ENTRYPOINT ["sh", "-c", "\
Rscript Code/Prepare_data.R && \
Rscript Code/Table1.R && \
Rscript Code/Model1.R && \
Rscript Code/Bar_chart.R && \
Rscript Code/render_report.R && \
mkdir -p report && cp Lung_cancer_report.html report/ \
"]