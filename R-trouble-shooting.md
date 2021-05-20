If running into problems when installing rstanarm-dependencies the following works for V8 installation errors.

#For Linux: download libv8 during installation

Sys.setenv(DOWNLOAD_STATIC_LIBV8=1)

install.packages("V8")