# Setting up the working environment
# In order to download packages from Github you need 
# install.packages("devtools")
# install.packages("here")

library(devtools)
find_rtools() # If FALSE is returned, you will need to install Rtools https://cran.r-project.org/bin/windows/Rtools/

devtools::install_github("towananalytics/tatools")

library(tatools)
tatools::create_proj_dir()

# Confirm root folder
here::here()
