# DEFINE MAIN FOLDER CONTAINING FILES ##########################################
main_folder <- "C:/Users/ *ADD PATH TO FOLDER CONTATINING FILES* "  # Change this to your actual path
batch_size <- 10000  # Number of files desired per batch
output_folder_prefix <- "CE_Batch_"  # Prefix for batch folders

# GET LIST OF ALL FILES IN MAIN FOLDER #########################################
all_files <- list.files(main_folder, full.names = TRUE)

# CALCULATE THE NUMBER OF BATCHES NEEDED #######################################
num_batches <- ceiling(length(all_files) / batch_size)

# CREATE SUBFOLDERS AND DISTRIBUTE FILES #######################################
for (i in 1:num_batches) {
  # DEFINE THE BATCH FOLDER NAME ###############################################
  batch_folder <- file.path(main_folder, paste0(output_folder_prefix, i))
  
  # CREATE THE BATCH FOLDER ####################################################
  if (!dir.exists(batch_folder)) {
    dir.create(batch_folder)
  }
  
  # DETERMINE THE FILES FOR THIS BATCH #########################################
  start_idx <- ((i - 1) * batch_size) + 1
  end_idx <- min(i * batch_size, length(all_files))
  batch_files <- all_files[start_idx:end_idx]
  
  # MOVE FILES TO BATCH FOLDER #################################################
  file.rename(batch_files, file.path(batch_folder, basename(batch_files)))
  
  message(paste("Moved", length(batch_files), "files to", batch_folder))
}

message("Folder splitting completed.")
