# Dockerfile for package buliding and running this package
FROM rocker/r-ver:4.0.2

RUN apt-get update && apt-get -y install \
  texlive-latex-base \
  texlive-fonts-extra \
  texinfo \
  libxml2-dev

RUN R -e "install.packages('remotes')"

COPY DESCRIPTION /DESCRIPTION

RUN R -e "library('remotes'); install_deps('/DESCRIPTION', dependencies = TRUE)"
