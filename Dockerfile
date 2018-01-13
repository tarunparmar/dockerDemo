FROM rocker/tidyverse

RUN apt-get update && apt-get install -y \
		cron \

# Install packages from CRAN
RUN install2.r --error \
    -r 'http://cran.rstudio.com' \
    googleComputeEngineR \ 
	shinyFiles \
	miniUI \
	cronR \
	
## Start cron
RUN sudo service cron start
