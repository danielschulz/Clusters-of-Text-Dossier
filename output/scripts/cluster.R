
# K-Means Clustering

k = d
k$beau = NULL
k$major = NULL
k$clEqually = NULL
k$clCorrect = NULL
k$random = NULL
k$X = TRUE
(km = kmeans(k, 2))

k$X = paste(d$X, " |")
k$random = d$random
k$cluster = km$cluster

k1 = subset(k, k$cluster == 1)
k2 = subset(k, k$cluster == 2)
