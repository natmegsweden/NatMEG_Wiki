If running into dependency troubles trying to install rstanarm-package

This works if V8 fails to install.
# For Linux: download libv8 during installation
Sys.setenv(DOWNLOAD_STATIC_LIBV8=1)
install.packages("V8")