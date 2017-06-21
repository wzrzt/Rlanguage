# R language regular expression practice 

# reference http://gastonsanchez.com/Handling_and_Processing_Strings_in_R.pdf 

# We can use regexpr() to get the number of times that a searched pattern is found in a character  vector. When there is no match, we get a value -1. 

data("USArrests")

head(USArrests) 
