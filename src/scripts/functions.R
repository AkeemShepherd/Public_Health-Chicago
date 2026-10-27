
likert_index <- function(data) {
  
  likert_labels <- c(
    "Strongly disagree",
    "Disagree",
    "Neither agree nor disagree",
    "Agree",
    "Strongly agree"
  )
  
  data[] <- lapply(data, function(x) {
    
    # Recode only character columns containing Likert labels
    if (is.character(x) &&
        any(x %in% likert_labels, na.rm = TRUE)) {
      
      dplyr::case_when(
        x == "Strongly disagree" ~ 1,
        x == "Disagree" ~ 2,
        x == "Neither agree nor disagree" ~ 3,
        x == "Agree" ~ 4,
        x == "Strongly agree" ~ 5,
        TRUE ~ NA_real_
      )
      
    } else {
      # Preserve respondent IDs and all other 
      # columns whose values are not categorical
      x
    }
  })
  
  return(data)
}

# index the dataset
pop_toy_indexed <- likert_index(pop_toy)

# consider using mutate with across to go across different columns instead
# of lapply 
# Other - check one note for this. 