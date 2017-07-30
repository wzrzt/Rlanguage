# R_class
Rain.Wei  
2017/7/30  



### 7.3.2 定义类并创建对象   

S3中可以通过设置类属性将任意对象转变成另一个特定类的对象。S4更严格，必须使用setClass()来定义一个类的表示，使用new()来创建一个新对象。


```r
setClass("Person", 
         slots = list(name = "character", age = "numeric")) 
setClass("Employee", 
         slots = list(boss = "Person"), 
         contains = "Person")  
alice <- new("Person", name = "Alice", age = 40) 
john <- new("Employee", name = "John", age = 20, boss = alice) 
bob <- new("Employee", name = "Bob", age = NaN, boss = alice)  # NA doesn't work, NaN works, but differs from neglet this slot.  
```

S4类对象字段可以用@或者slot()来获取  


```r
alice@name 
```

```
## [1] "Alice"
```

```r
slot(john, "boss")
```

```
## An object of class "Person"
## Slot "name":
## [1] "Alice"
## 
## Slot "age":
## [1] 40
```

如果一个S4对象继承自一个S3类或者一个基础类型，它就包含一个特殊的.Data字段，这个字段包含底层基础类型或者S3对象。  


```r
setClass("RangedNumeric", 
         contains = "numeric", 
         slots = list(min = "numeric", max = "numeric")) 

rn <- new("RangedNumeric", 1:10, min = 1, max = 10) 
rn@min 
```

```
## [1] 1
```

```r
rn@.Data  
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```

## 7.4 RC类   

参考类(RC)是R中最新的OO系统，与S3,S4有本质不同:  
- RC方法属于对象而不是函数。  
- RC对象是可变的，不适用于通常R的复制后修改(copy-on-modify)语义。  
这些性质使RC对象与其他编程语言（例如，Python、Java）的对象更加类似。  
参考类是使用R代码实现的：它们是包含环境的一个特殊的S4类。  

### 7.4.1 定义类和创建对象   


```r
Account <- setRefClass("Account")
Account$new() 
```

```
## Reference class object of class "Account"
```



```r
Account <- setRefClass("Account", 
                       fields = list(balance = "numeric")) 

a <- Account$new(balance = 100) 
a$balance 
```

```
## [1] 100
```

```r
a$balance <- 200 
a$balance
```

```
## [1] 200
```

注意RC对象是可变的，即它们具有引用语义，不是复制后修改：  


```r
b <- a 
b$balance <- 0 
a$balance
```

```
## [1] 0
```

所以RC对象有一个copy()方法，它允许复制对象：  


```r
c <- a$copy() 
c$balance 
```

```
## [1] 0
```

```r
a$balance <- 100 
c$balance 
```

```
## [1] 0
```


```r
Account <- setRefClass("Account", 
    fields = list(balance = "numeric"), 
    methods = list(
        withdraw = function(x) {
            balance <<- balance - x 
        }, 
        deposit = function(x) {
            balance <<- balance + x 
        }
    )
)
```


```r
a <- Account$new(balance = 100) 
a$deposit(100) 
a$balance 
```

```
## [1] 200
```

```r
a$withdraw(50) 
a$balance
```

```
## [1] 150
```




```r
NoOverDraft <- setRefClass("NoOverDraft", 
    contains = "Account", 
    methods = list(
        withdraw = function(x) {
            if (balance < x) stop("Not Enough Money!")  
            balance <<- balance - x 
        }
    )) 

accountJohn <- NoOverDraft$new(balance = 100) 
accountJohn$deposit(50) 
accountJohn$balance 
```

```
## [1] 150
```

```r
try1 <- try(accountJohn$withdraw(280) )
try1
```

```
## [1] "Error in accountJohn$withdraw(280) : Not Enough Money!\n"
## attr(,"class")
## [1] "try-error"
## attr(,"condition")
## <simpleError in accountJohn$withdraw(280): Not Enough Money!>
```


```r
Account <- setRefClass("Account", 
                       fields = list(.balance = "numeric")) 

a <- Account$new(.balance = 100) 
```


```r
a$.balance 
```

```
## [1] 100
```

```r
a$.balance <- 50 
a$.balance
```

```
## [1] 50
```




