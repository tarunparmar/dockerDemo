FROM rocker/tidyverse

RUN apt-get update && apt-get install -y \
	cron \
    ## clean up
    && apt-get clean \ 
    && rm -rf /var/lib/apt/lists/ \ 
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
	
# Install packages from CRAN
RUN install2.r --error \
    -r 'https://cran.rstudio.com' \
    shinyFiles miniUI cronR \
	
## Start cron
RUN sudo service cron start
