## This is a script that determine what we eat for lunch. 
## And the most important thing is mail by R language and without wrong code. 

dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
library(mailR)

meallist = c('兰州拉面','时间小馆','南城香','羊杂汤','99豆腐','必胜客','重庆饭馆')

samplePool <- rep(NA, 10)
for( i in 1:10){
    samplePool[[i]] <- sample(meallist, 1)
}

result <- which.max(table(samplePool))
mail.text <- paste(names(result), 'ranks the 1st with', result, 'votes')


sender <- "***@163.com"  # Replace with a valid address, only one!
recipients <- c("***@163.com")  # Replace with one or more valid addresses
email <- send.mail(from = sender,
                   to = recipients,
                   cc = recipients, # 抄送人
                   subject="今日午饭",
                   body = mail.text,
                   smtp = list(host.name = "smtp.163.com",
                               port = 465, user.name='***@163.com',
                               passwd='***', ssl=T),
                   authenticate = T,
                   encoding = 'utf-8', 
                   #    attach.files = "Tmp.R",
                   send = FALSE)
email$send() # execute to send email 
