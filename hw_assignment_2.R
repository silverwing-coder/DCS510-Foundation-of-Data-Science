### Error corrected in line 33
### There was a typo in line 32


### H.W. Assignment #1

## Prob-1

# Create a vector with elements of 1 to 24
vector_data <- c(1:25)
vector_data
sum_elements_of <- function(x, y, vector){
  sum = 0
  for (i in 1:length(vector)){ # loop starts from the start index
    if(i >= x & i <= y){       # adds elements values having index between x, y
      sum = sum + i
    }
  }
  return(sum)
}

sum <- sum_elements_of(11, 17, vector_data)
print(sum)


## Prob-2

col_names <- c("col_1", "col_2", "col_3", "col_4", "col_5")
row_names <- c("row_1", "row_2", "row_3", "row_4", "row_5")

# Create 5 by 5 matrix with elements of 1 to 25
# matrix_ <- matrix(1:25, ncol = 5, byrow = TRUE, dimnames_list(row_names, col_names))
matrix_data <- matrix(1:25, ncol = 5, byrow = TRUE, dimnames = list(row_names, col_names))

sum_row_column_of <- function(row_col_no, matrix_data){

  row_or_col <- substr(row_col_no, 1, 3) # check if row or column
  
  if(row_or_col == "col"){
    vec_data <- matrix_data[, row_col_no] # take i-th column
  }else if(row_or_col == "row"){
      vec_data <- matrix_data[row_col_no, ] # take i-th row
  }
  return(sum(vec_data))                   # return sum of elements in i-th row/column
}

sum <- sum_row_column_of("row_4", matrix_data)
print(sum)
sum <- sum_row_column_of("col_1", matrix_data)
print(sum)
