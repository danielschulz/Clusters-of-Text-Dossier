
# INIT DATA

# load aggregated text data
dataLocation = "input\\data\\AggregatedFeatures.csv"
data = read.csv2(dataLocation, header=TRUE, encoding="ANSI", sep=";", strip.white=TRUE, na.strings=c(""))

data$beautiful = as.character(data$beautiful)
data$beau = as.logical.factor(c(1:length(data$beautiful)))

data$beau[is.na(data$beautiful)] = NA 
data$beau["N" == data$beautiful] = FALSE 
data$beau["Y" == data$beautiful] = TRUE


data$classified = as.character(data$classified)
data$isclassified = as.logical.factor(c(1:length(data$classified)))

data$isclassified[is.na(data$classified)] = FALSE 
data$isclassified["N" == data$classified] = FALSE 
data$isclassified["Y" == data$classified] = TRUE


data$beautiful = NULL
data$classified = NULL


rm(list=c("dataLocation"))



data$original_filesize = as.numeric(data$original_filesize)
data$normalized_filesize = as.numeric(data$normalized_filesize)

data$media = as.factor(data$media)
data$domain = as.factor(data$domain)
data$media = as.factor(data$media)

data$frac_original_normalized = as.numeric(data$frac_original_normalized)
data$ARI = as.numeric(data$ARI)
data$FRE = as.numeric(data$FRE)
data$FKGL = as.numeric(data$FKGL)
data$FOG = as.numeric(data$FOG)
data$SMOG = as.numeric(data$SMOG)
data$CLI = as.numeric(data$CLI)
data$LIX = as.numeric(data$LIX)
data$RIX = as.numeric(data$RIX)

data$frac_original_normalized = data$normalized_filesize / data$original_filesize



# svm classification
formulaFull = beau ~ media + domain + frac_original_normalized + ARI + FRE + FKGL + FOG + SMOG + CLI + LIX + RIX
formulaSparse = beau ~ ARI + FRE + FKGL + FOG + SMOG + CLI + LIX + RIX

aov(formulaFull, data)
aov(formulaSparse, data)


svmFull = ksvm(formulaFull, data = data, kernel = "rbfdot", kpar=list(sigma = 0.015), C = 70, cross = 4, prob.model = TRUE)
svmSparse = ksvm(formulaSparse, data = data, kernel = "rbfdot", kpar=list(sigma = 0.015), C = 70, cross = 4, prob.model = TRUE)


data$prFull = predict(svmFull, newdata = data)
data$prSparse = predict(svmSparse, newdata = data)



data$clFullBeauty[0 >= data$prFull] = FALSE
data$clFullBeauty[0 < data$prFull] = TRUE

data$clSparseBeauty[0 >= data$prSparse] = FALSE
data$clSparseBeauty[0 < data$prSparse] = TRUE

data$clEqually = data$clFullBeauty == data$clSparseBeauty


data$prSum = data$prFull + data$prSparse

data$clSum[0 >= data$prSum] = FALSE
data$clSum[0 < data$prSum] = TRUE

data$clCorrect = NA

for (i in c(1:length(data$beau))) {
  data[i,]$clCorrect = is.na(data[i,]$beau) || data[i,]$beau == data[i,]$clSum
}

data$prSumSu = scale(data$prSum)



data$major = ALPHA_MAJOR_OPACITY[1]
data[data$X == "Shakespeare",]$major = ALPHA_MAJOR_OPACITY[2]
data[data$X == "Willcox",]$major = ALPHA_MAJOR_OPACITY[2]
data$random = 330 + sample(seq(0,60, by=1), length(data$X), replace=TRUE)


d = data[,c(1,15,17,18,19,20,21,22,23,24,25,26,27)]
