
# ==================================================
# Examination Result Analytics
# Code 1: Data Loading and Preparation
# ==================================================

# Step 1: Load the CSV dataset
data <- read.csv(file.choose())

# Step 2: Display dataset dimensions
cat("DATASET DIMENSIONS\n")
print(dim(data))

# Step 3: Display column names
cat("\nCOLUMN NAMES\n")
print(names(data))

# Step 4: Display first six records
cat("\nFIRST SIX RECORDS\n")
print(head(data))

# Step 5: Display dataset structure
cat("\nDATA STRUCTURE\n")
str(data)

# Step 6: Define subject columns
subjects <- c("Maths", "Physics", "Programming", "English")

# Step 7: Standardize section names
data$Section <- toupper(trimws(data$Section))

# Step 8: Calculate total marks
data$Total <- rowSums(data[, subjects], na.rm = FALSE)

# Step 9: Calculate percentage
data$Percentage <- data$Total / length(subjects)

# Step 10: Assign grades
data$Grade <- cut(
  data$Percentage,
  breaks = c(-Inf, 50, 60, 75, Inf),
  labels = c("Pass", "Second", "First", "Distinction"),
  right = FALSE
)

# Step 11: Display prepared dataset
cat("\nPREPARED DATA - FIRST SIX RECORDS\n")
print(head(data))

# Step 12: Display summary statistics
cat("\nPREPARED DATA SUMMARY\n")
print(summary(data))

# Step 13: Save prepared dataset
write.csv(
  data,
  "prepared_examination_results.csv",
  row.names = FALSE
)

# Step 14: Completion message
cat("\nDATA PREPARATION COMPLETED SUCCESSFULLY\n")
cat("Prepared dataset saved as prepared_examination_results.csv\n")
