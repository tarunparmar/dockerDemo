FROM rocker/tidyverse

RUN apt-get -qqy update && apt-get install -y \
        libxml2-dev \
		cron \
		openssh-client \
		
		## clean up
		&& apt-get clean \ 
		&& rm -rf /var/lib/apt/lists/ \ 
		&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# Install packages from CRAN
RUN install2.r --error \
    -r 'http://cran.rstudio.com' \
    googleAuthR \ 
    googleComputeEngineR \ 
    googleAnalyticsR \ 
    searchConsoleR \ 
    googleCloudStorageR \
    bigQueryR \ 
    zip \
	shinyFiles \
	miniUI \
	cronR \
	sparklyr \
	
## Start cron
RUN sudo service cron start

## install Github packages
    && installGithub.r MarkEdmondson1234/youtubeAnalyticsR \
                       MarkEdmondson1234/googleID \
                       cloudyr/googleCloudStorageR \
                       cloudyr/googleComputeEngineR \
## clean up
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

COPY Rprofile.site /usr/local/lib/R/etc/Rprofile.site