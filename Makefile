.PHONY: clean install docker report-docker

report-docker:
	mkdir -p Edited_data charts tables models report
	docker run --rm \
	  -v "$(PWD)/Code:/home/rstudio/project/Code" \
	  -v "$(PWD)/Edited_data:/home/rstudio/project/Edited_data" \
	  -v "$(PWD)/Raw_data:/home/rstudio/project/Raw_data" \
	  -v "$(PWD)/charts:/home/rstudio/project/charts" \
	  -v "$(PWD)/tables:/home/rstudio/project/tables" \
	  -v "$(PWD)/models:/home/rstudio/project/models" \
	  -v "$(PWD)/report:/home/rstudio/project/report" \
	  cannun2/final:v3
	  
Lung_cancer_report.html: tables/Table_one.rds models/Model_one.rds charts/barchart1.png Lung_cancer_report.Rmd
	Rscript Code/render_report.R

docker:
	docker build -t cannun2/final .

tables/Table_one.rds: Edited_data/Data_clean.rds Code/Table1.R
	Rscript Code/Table1.R

Edited_data/Data_clean.rds: Raw_data/survey_lung_cancer.csv
	Rscript Code/Prepare_data.R
	
models/Model_one.rds:Edited_data/Data_clean.rds Code/Model1.R
	Rscript Code/Model1.R
	
charts/barchart1.png:Edited_data/Data_clean.rds Code/Bar_chart.R
	Rscript Code/Bar_chart.R
	
install:
	Rscript -e "options(renv.consent = TRUE); renv::restore(prompt = FALSE)"

clean:
	rm -f tables/*.rds	&& rm -f Lung_cancer_report.html && rm -f models/* && rm -f charts/* && rm -f report/*