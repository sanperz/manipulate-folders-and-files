install.packages("readxl", dependencies = TRUE)
library(readxl)

# DEFINE PATHS #################################################################
# Change this to the path with list of files to remove #
excel_file <- "C:/Users/ *ADD PATH TO XLSX FILE THAT CONTAINS LIST OF FILES TO REMOVE* "

# Change this to the folder path that will be cleaned #
folder_path <- "C:/Users/ *ADD PATH TO FOLDER THAT CONTAINS FILES TO BE REMOVED* "

# READ EXCEL FILE ##############################################################
unwanted_files <- read_excel(excel_file, col_names = TRUE)

# Assuming the filenames are in the first column #
file_names <- unwanted_files[[1]]

# LOOP THROUGH EACH FILE AND DELETE UNWANTED ONES ##############################
for (file_name in file_names) {
  file_path <- file.path(folder_path, file_name)
  
  # CHECK IF FILE EXISTS BEFORE ATTEMPTING TO DELETE #
  if (file.exists(file_path)) {
    file.remove(file_path)
    message(paste("Deleted:", file_path))
  } else {
    message(paste("File not found:", file_path))
  }
}


message("File cleanup completed.")
