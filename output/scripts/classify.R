
# SETUP WORKSPACE

library(e1071)
library(randomForest)
library(kernlab)

set.seed(4711)

# clean
rm(list = ls()[!(ls() %in% PERSISTENT_CONSTANTS)])


# constants
PERSISTENT_CONSTANTS = c("PERSISTENT_CONSTANTS")



# INIT DATA

# load trainings data: data
dataLocation = "output\\data\\train.RData"
a = load(dataLocation)


# load test data: test
dataLocation = "output\\data\\test.RData"
b = load(dataLocation)


names = names(test)
test$survived = "0"
test = test[c("survived", names)]

rm(list=c("a", "b", "dataLocation", "names"))

# x = lapply(data$survived, FUN= function (x) {return (x == "1")})
# data$survived = FALSE
# data$survived = as.factor(data$survived)
# data$survived = c(x)

testDataIndex = c(rep(FALSE, nrow(data)), rep(TRUE, nrow(test)))
d = rbind(data, test)

# d[c(TRUE, TRUE, rep(FALSE, 1307)),]$pclass = 5


# svm classification
formula = survived ~ .
d$name = as.factor(d$name)
d$survived = as.factor(d$survived)
d = na.roughfix(d)

# svm = ksvm(formula, data = data.frame(data), kernel="rbfdot", kpar=list(sigma=0.015), C=70, cross=4, prob.model=TRUE)

svm = ksvm(formula, data = d[!testDataIndex,], kernel="rbfdot", kpar=list(sigma=0.015), C=70, cross=4, prob.model=TRUE, na.action=na.roughfix)
pr = predict(svm, newdata = d[testDataIndex,])

# 
dataLocation = "input\\data\\test.csv"
rawData = read.csv2(dataLocation, header=TRUE, encoding="ANSI", sep=",", strip.white=TRUE, na.strings=c(""))

names = names(rawData)
rawData$survived = "0"
rawData = rawData[c("survived", names)]
rawData$survived = pr

save(rawData, file="output\\data\\result.RData")
write.table(rawData, file="output\\data\\result.csv", sep=",", row.names = FALSE)