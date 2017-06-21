# RegExp
Rain.Wei  
2017/6/18  




```r
# We can use regexpr() to get the number of times that a searched pattern is found in a character  vector. When there is no match, we get a value -1. 

data("USArrests")

head(USArrests) 
```

```
##            Murder Assault UrbanPop Rape
## Alabama      13.2     236       58 21.2
## Alaska       10.0     263       48 44.5
## Arizona       8.1     294       80 31.0
## Arkansas      8.8     190       50 19.5
## California    9.0     276       91 40.6
## Colorado      7.9     204       78 38.7
```


```r
states = rownames(USArrests) 
positions_a = gregexpr(pattern = "a", text = states, ignore.case = TRUE)
# how many a's?
num_a = sapply(positions_a, function(x) ifelse(x[1] > 0, length(x), 0))
num_a
```

```
##  [1] 4 3 2 3 2 1 0 2 1 1 2 1 0 2 1 2 0 2 1 2 2 1 1 0 0 2 2 2 1 0 0 0 2 2 0
## [36] 2 0 2 1 2 2 0 1 1 0 1 1 1 0 0
```


```r
# load stringr (remember to install it first)
library(stringr)
# total number of a's
str_count(states, "a")
```

```
##  [1] 3 2 1 2 2 1 0 2 1 1 2 1 0 2 1 2 0 2 1 2 2 1 1 0 0 2 2 2 1 0 0 0 2 2 0
## [36] 2 0 2 1 2 2 0 1 1 0 1 1 1 0 0
```


```r
# vector of vowels
vowels = c("a", "e", "i", "o", "u")
# vector for storing results
num_vowels = vector(mode = "integer", length = 5)
# calculate number of vowels in each name
for (j in seq_along(vowels)) {
    num_aux = str_count(tolower(states), vowels[j])
num_vowels[j] = sum(num_aux)
}
# add vowel names
names(num_vowels) = vowels
# total number of vowels
num_vowels
```

```
##  a  e  i  o  u 
## 61 28 44 36  8
```

```r
## a e i o u
## 61 28 44 36 8
# sort them in decreasing order
#sort(num_vowels, decreasing = TRUE)
## a i o e u
## 61 44 36 28 8
#And finally, we can visualize the distribution with a barplot:
# barplot
barplot(num_vowels, main = "Number of vowels in USA States names",
border = NA, ylim = c(0, 80))
```

![](RegExp_files/figure-html/unnamed-chunk-4-1.png)<!-- -->


```r
df2 = data.frame(numbers = 1:5, letters = letters[1:5],
                 stringsAsFactors = FALSE)  
# character would be convert to factor default. 
df2
```

```
##   numbers letters
## 1       1       a
## 2       2       b
## 3       3       c
## 4       4       d
## 5       5       e
```

```r
str(df2)
```

```
## 'data.frame':	5 obs. of  2 variables:
##  $ numbers: int  1 2 3 4 5
##  $ letters: chr  "a" "b" "c" "d" ...
```

```r
# read 'ktop100.txt' file
top105 = readLines("http://www.textfiles.com/music/ktop100.txt") 
head(top105) 
```

```
## [1] "From: ed@wente.llnl.gov (Ed Suranyi)"
## [2] "Date: 12 Jan 92 21:23:55 GMT"        
## [3] "Newsgroups: rec.music.misc"          
## [4] "Subject: KITS' year end countdown"   
## [5] ""                                    
## [6] ""
```

```r
length(top105)
```

```
## [1] 123
```


```r
top105[11:15]
```

```
## [1] "1. NIRVANA                      SMELLS LIKE TEEN SPIRIT"
## [2] "2. EMF                          UNBELIEVABLE"           
## [3] "3. R.E.M.                       LOSING MY RELIGION"     
## [4] "4. SIOUXSIE & THE BANSHEES      KISS THEM FOR ME"       
## [5] "5. B.A.D. II                    RUSH"
```


```r
# One of the potential problems with paste() is that it coerces missing values NA into the
# character "NA":
evalue = paste("the value of 'e' is", exp(1), NA)
evalue
```

```
## [1] "the value of 'e' is 2.71828182845905 NA"
```


```r
no_quotes = noquote(c("some", "quoted", "text", "!%^(&="))
# display
no_quotes
```

```
## [1] some   quoted text   !%^(&=
```

```r
## [1] some quoted text !%^(&=
# check class
class(no_quotes)
```

```
## [1] "noquote"
```

```r
## [1] "noquote"
# test character
is.character(no_quotes)
```

```
## [1] TRUE
```

```r
## [1] TRUE
# no quotes even when subscripting
no_quotes[2:3]
```

```
## [1] quoted text
```

```r
## [1] quoted text
```


```r
my_string = 'programming with data is fun'
cat(my_string, "with R\n", sep = " =) ")
```

```
## programming with data is fun =) with R
```

```r
## programming with data is fun =) with R 
cat(1:10, sep = "-")
```

```
## 1-2-3-4-5-6-7-8-9-10
```

```r
## 1-2-3-4-5-6-7-8-9-10
```


```r
# The argument fill allows us to break long strings; this is achieved when we specify the
# string width with an integer number:
 # fill = 30
cat("Loooooooooong strings", "can be displayed", "in a nice format",
"by using the 'fill' argument", fill = 30)
```

```
## Loooooooooong strings 
## can be displayed 
## in a nice format 
## by using the 'fill' argument
```


```r
# cat with output in a given file
cat(my_string, "with R", file = "output.txt") 
```



```r
# format makes numbers the samle length. 
format(c(6, 13.1), digits = 2, nsmall = 1) 
```

```
## [1] " 6.0" "13.1"
```

```r
format(c(6, 123.12), digits = 2, nsmall = 2, justify = 'none') 
```

```
## [1] "  6.00" "123.12"
```

```r
format(123456789, big.mark = ",")
```

```
## [1] "123,456,789"
```


```r
# '%f' indicates 'fixed point' decimal notation
sprintf("%f", pi)
```

```
## [1] "3.141593"
```

```r
## [1] "3.141593"
# decimal notation with 3 decimal digits
sprintf("%.3f", pi)
```

```
## [1] "3.142"
```

```r
## [1] "3.142"
# 1 integer and 0 decimal digits
sprintf("%1.0f", pi)
```

```
## [1] "3"
```

```r
## [1] "3"
# decimal notation with 3 decimal digits
sprintf("%5.1f", pi)
```

```
## [1] "  3.1"
```

```r
## [1] " 3.1"
sprintf("%05.1f", pi)
```

```
## [1] "003.1"
```

```r
## [1] "003.1"
# print with sign (positive)
sprintf("%+f", pi)
```

```
## [1] "+3.141593"
```

```r
## [1] "+3.141593"
# prefix a space
sprintf("% f", pi)
```

```
## [1] " 3.141593"
```

```r
## [1] " 3.141593" 
sprintf("%   f", pi) # any longer space the same output 
```

```
## [1] " 3.141593"
```

```r
# left adjustment
sprintf("%-10f", pi) # left justified
```

```
## [1] "3.141593  "
```

```r
## [1] "3.141593 "
# exponential decimal notation 'e'
sprintf("%e", pi)
```

```
## [1] "3.141593e+00"
```

```r
## [1] "3.141593e+00"
# exponential decimal notation 'E'
sprintf("%E", pi)
```

```
## [1] "3.141593E+00"
```

```r
## [1] "3.141593E+00"
# number of significant digits (6 by default)
sprintf("%g", pi)
```

```
## [1] "3.14159"
```

```r
## [1] "3.14159" 

sprintf("%1.0f", pi*10)
```

```
## [1] "31"
```


```r
# The function toString() allows us to convert an R object to a character string. This function
# can be used as a helper for format() to produce a single character string from several obejcts
# inside a vector. The result will be a character vector of length 1 with elements separated by
# commas:
# default usage
toString(17.04)
```

```
## [1] "17.04"
```

```r
## [1] "17.04"
# combining two objects
toString(c(17.04, 1978))
```

```
## [1] "17.04, 1978"
```

```r
## [1] "17.04, 1978"
# combining several objects
toString(c("Bonjour", 123, TRUE, NA, log(exp(1))))
```

```
## [1] "Bonjour, 123, TRUE, NA, 1"
```

```r
## [1] "Bonjour, 123, TRUE, NA, 1"
# use of 'width'
toString(c("one", "two", "3333333333"), width = 8)
```

```
## [1] "one,...."
```

```r
## [1] "one,...."
```


```r
# Comparing printing methods 
# printing method
print(1:5)
```

```
## [1] 1 2 3 4 5
```

```r
## [1] 1 2 3 4 5
# convert to character
as.character(1:5)
```

```
## [1] "1" "2" "3" "4" "5"
```

```r
## [1] "1" "2" "3" "4" "5"
# concatenation
cat(1:5, sep = "-")
```

```
## 1-2-3-4-5
```

```r
## 1-2-3-4-5
# default pasting
paste(1:5)
```

```
## [1] "1" "2" "3" "4" "5"
```

```r
## [1] "1" "2" "3" "4" "5"
# paste with collapsing
paste(1:5, collapse = "")
```

```
## [1] "12345"
```

```r
## [1] "12345"
# convert to a single string
toString(1:5)
```

```
## [1] "1, 2, 3, 4, 5"
```

```r
## [1] "1, 2, 3, 4, 5"
# unquoted output
noquote(as.character(1:5)) 
```

```
## [1] 1 2 3 4 5
```

```r
## [1] 1 2 3 4 5
```


```r
# There’s also the function chartr() which stands for character translation. chartr() takes
# three arguments: an old string, a new string, and a character vector x:
# chartr(old, new, x) 
# replace 'a' by 'A'
chartr("a", "A", "This is a boring string")
```

```
## [1] "This is A boring string"
```

```r
## [1] "This is A boring string" 


# It is important to note that old and new must have the same number of characters, otherwise
# you will get a nasty error message like this one:
# incorrect use
# chartr("ai", "X", "This is a bad example")
## Error: ’old’ is longer than ’new’

# multiple replacements
crazy = c("Here's to the crazy ones", "The misfits", "The rebels")
chartr("aei", "#!?", crazy)
```

```
## [1] "H!r!'s to th! cr#zy on!s" "Th! m?sf?ts"             
## [3] "Th! r!b!ls"
```

```r
## [1] "H!r!'s to th! cr#zy on!s" "Th! m?sf?ts"
## [3] "Th! r!b!ls"
```


```r
# Abbreviate strings with abbreviate()
# Another useful function for basic manipulation of character strings is abbreviate(). Its
# usage has the following structure:
# abbreviate(names.org, minlength = 4, dot = FALSE, strict = FALSE,
# method = c("left.keep", "both.sides"))
# Although there are several arguments, the main parameter is the character vector (names.org)
# which will contain the names that we want to abbreviate: 

# some color names
some_colors = colors()[1:4]
some_colors
```

```
## [1] "white"         "aliceblue"     "antiquewhite"  "antiquewhite1"
```

```r
## [1] "white" "aliceblue" "antiquewhite" "antiquewhite1"
# abbreviate (default usage)
colors1 = abbreviate(some_colors)
colors1
```

```
##         white     aliceblue  antiquewhite antiquewhite1 
##        "whit"        "alcb"        "antq"        "ant1"
```

```r
## white aliceblue antiquewhite antiquewhite1
## "whit" "alcb" "antq" "ant1"
# abbreviate with 'minlength'
colors2 = abbreviate(some_colors, minlength = 5)
colors2
```

```
##         white     aliceblue  antiquewhite antiquewhite1 
##       "white"       "alcbl"       "antqw"       "antq1"
```

```r
## white aliceblue antiquewhite antiquewhite1
## "white" "alcbl" "antqw" "antq1"
# abbreviate
colors3 = abbreviate(some_colors, minlength = 3, method = "both.sides")
colors3
```

```
##         white     aliceblue  antiquewhite antiquewhite1 
##         "wht"         "alc"         "ant"         "an1"
```

```r
## white aliceblue antiquewhite antiquewhite1
## "wht" "alc" "ant" "an1"
```


```r
# substr(x, start, stop)
# x is a character vector, start indicates the first element to be replaced, and stop indicates
# the last element to be replaced:
# extract 'bcd'
substr("abcdef", 2, 4)
```

```
## [1] "bcd"
```

```r
## [1] "bcd"
# replace 2nd letter with hash symbol
x = c("may", "the", "force", "be", "with", "you")
substr(x, 2, 2) <- "#"
x
```

```
## [1] "m#y"   "t#e"   "f#rce" "b#"    "w#th"  "y#u"
```

```r
## [1] "m#y" "t#e" "f#rce" "b#" "w#th" "y#u"
# replace 2nd and 3rd letters with happy face
y = c("may", "the", "force", "be", "with", "you")
substr(y, 2, 3) <- ":)"
y
```

```
## [1] "m:)"   "t:)"   "f:)ce" "b:"    "w:)h"  "y:)"
```

```r
## [1] "m:)" "t:)" "f:)ce" "b:" "w:)h" "y:)"
# replacement with recycling
z = c("may", "the", "force", "be", "with", "you")
substr(z, 2, 3) <- c("#", "@")
z
```

```
## [1] "m#y"   "t@e"   "f#rce" "b@"    "w#th"  "y@u"
```

```r
## [1] "m#y" "t@e" "f#rce" "b@" "w#th" "y@u"
```


```r
# same as 'substr'
substring("ABCDEF", 2, 4)
```

```
## [1] "BCD"
```

```r
## [1] "BCD"
substr("ABCDEF", 2, 4)
```

```
## [1] "BCD"
```

```r
## [1] "BCD"
# extract each letter
substring("ABCDEF", 1:6, 1:6)
```

```
## [1] "A" "B" "C" "D" "E" "F"
```

```r
## [1] "A" "B" "C" "D" "E" "F"  
substring("ABCDEF", 1:6, 1:6) ## ?
```

```
## [1] "A" "B" "C" "D" "E" "F"
```

```r
# multiple replacement with recycling
text = c("more", "emotions", "are", "better", "than", "less") 
substring(text, 1:3)
```

```
## [1] "more"    "motions" "e"       "better"  "han"     "ss"
```

```r
substring(text, 1:3) <- c(" ", "zzz")
text
```

```
## [1] " ore"     "ezzzions" "ar "      "zzzter"   "t an"     "lezz"
```

```r
## [1] " ore" "ezzzions" "ar " "zzzter" "t an" "lezz"  
text1 = c("more", "emotions", "are", "better", "than", "less") 
substring(text1, 1:3) <- c(" ", 'zzz', 'aa') 
## 能替换掉多少个换多少个  
text1
```

```
## [1] " ore"     "ezzzions" "ara"      " etter"   "tzzz"     "leaa"
```

## Set Calculation  


```r
sort(c(3,1,1,4)) 
```

```
## [1] 1 1 3 4
```

```r
# two character vectors
set1 = c("some", "random", "words", "some")
set2 = c("some", "many", "none", "few")
# union of set1 and set2
union(set1, set2)
```

```
## [1] "some"   "random" "words"  "many"   "none"   "few"
```

```r
## [1] "some" "random" "words" "many" "none" "few"
```


```r
# two character vectors
set3 = c("some", "random", "few", "words")
set4 = c("some", "many", "none", "few")
# intersect of set3 and set4
intersect(set3, set4)
```

```
## [1] "some" "few"
```

```r
## [1] "some" "few" 

# two character vectors
set5 = c("some", "random", "few", "words")
set6 = c("some", "many", "none", "few")
# difference between set5 and set6 
setdiff(set5, set6)
```

```
## [1] "random" "words"
```

```r
## [1] "random" "words" 


# three character vectors
set7 = c("some", "random", "strings")
set8 = c("some", "many", "none", "few")
set9 = c("strings", "random", "some")
# set7 == set8?
setequal(set7, set8)
```

```
## [1] FALSE
```

```r
## [1] FALSE
# set7 == set9?
setequal(set7, set9)
```

```
## [1] TRUE
```

```r
## [1] TRUE

# to test whether two vectors are exactly equal (element by element!!!).
# set7 identical to set7?
identical(set7, set7)
```

```
## [1] TRUE
```

```r
## [1] TRUE
# set7 identical to set9?
identical(set7, set9)
```

```
## [1] FALSE
```

```r
## [1] FALSE
```




