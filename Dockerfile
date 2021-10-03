FROM trestletech/plumber

# Install R packages
RUN R -e "install.packages('jsonlite')"
RUN R -e "install.packages('ddsPLS', repos='http://cran.rstudio.com/')"

# Set working directory
WORKDIR /usr/local/lib/R/site-library/plumber/examples/04-mean-sum/

# Add the script to the directory
ADD helloWorld.R ./
ADD aws_test.Rdata

# Run R file
CMD ["./helloWorld.R"]
