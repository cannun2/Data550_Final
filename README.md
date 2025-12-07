# Data 550 Final Project
To generate final report type make in the terminal after ensuring your working directory is the Data550_Final folder.
This will use docker to create the report stored in the report folder.
To make the report without using docker run make Lung_cancer_report.html instead. This report will not be in the report folder, but in the Data550_Final folder.

## Create Docker Image
To create the docker image type make docker in the terminal. Current image used: https://hub.docker.com/repository/docker/cannun2/final/tags/v3/sha256-af16c9e80a5a71519ed9c70b89c4a02bda031b585b5d6d6aaa8b6679b8e75ee5

## Synchronize packages
To synchronize packages make sure you are in the Data550_Final folder and type make install.

## Output
The report called Lung_cancer_report is an HTML file which analysis lung cancer data from kaggle. 
It contains a table one, bar chart of smoking status by gender, and logistic regression model predicting lung cancer.

## Table one
The Table one is created using code/Table1.R and is output in tables/Table_one.rds.

## Bar chart
The Bar chart is created using code/Bar_chart.R and is output in charts/barchart1.png.

## Regression model
The regression model is created usig Model1.R and is output in models/Model_one.rds.

## Data preperation
The data is prepared in the code/Prepare_Data.R file and is stored in Edited_data/Data_clean.rds