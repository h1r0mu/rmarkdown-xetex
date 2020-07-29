FROM debian:latest
COPY requirements.R /src/requirements.R
WORKDIR /src
RUN apt update \
  && apt install -y lsb-release gnupg gnupg1 gnupg2 \
  && echo "deb https://cran.rstudio.com/bin/linux/debian $(lsb_release -cs)-cran35/" | tee -a /etc/apt/sources.list \
  && echo "deb http://deb.debian.org/debian buster main contrib non-free" | tee -a /etc/apt/sources.list \ 
  && echo "deb-src http://deb.debian.org/debian buster main contrib non-free" | tee -a /etc/apt/sources.list \ 
  && apt-key adv --keyserver keys.gnupg.net --recv-key 'E19F5F87128899B192B1A2C2AD5F960A256A04AF' \
  && apt update \
  && apt install -y r-base pandoc pandoc-citeproc texlive-xetex fonts-liberation ttf-mscorefonts-installer\
  && Rscript requirements.R
