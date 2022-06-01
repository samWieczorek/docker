FROM rocker/r-ver:4.2.0

LABEL maintainer="toto <samuel.wieczorek@cea.fr>"


RUN apt-get update && apt-get install -y  git-core libcurl4-openssl-dev libgit2-dev libicu-dev libssl-dev libxml2-dev make pandoc pandoc-citeproc zlib1g-dev && rm -rf /var/lib/apt/lists/*
RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl', Ncpus = 4)" >> /usr/local/lib/R/etc/Rprofile.site
RUN R -e 'install.packages("remotes")'
RUN R -e 'remotes::install_version("shiny",upgrade="never", version = "1.7.1")'
RUN R -e 'remotes::install_version("config",upgrade="never", version = "0.3.1")'
RUN R -e 'remotes::install_version("golem",upgrade="never", version = "0.3.2")'
RUN R -e 'remotes::install_git("https://github.com/samWieczorek/docker.git",version = "0.9")'



EXPOSE 3838
RUN R -e "options(shiny.port=3838,shiny.host='0.0.0.0');shiny::runApp(system.file('app', package='docker'))"

