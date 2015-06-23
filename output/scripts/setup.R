
# SETUP WORKSPACE

# install.packages("e1071")
# install.packages("randomForest")
# install.packages("kernlab")
# install.packages("aov", "anova", "manova")
# install.packages("HSAUR")
# install.packages("fpc")
# install.packages("xlsx")
# install.packages("rJava")
# install.packages("ggplot2")


library(e1071)
library(randomForest)
library(kernlab)
library(cluster)
library(HSAUR)
library(cluster)
library(fpc)
# library(xlsx)
# library(rJava)
library(ggplot2)


set.seed(4711)

# clean
rm(list = ls()[!(ls() %in% PERSISTENT_CONSTANTS)])


# constants
PERSISTENT_CONSTANTS = c("PERSISTENT_CONSTANTS", "ALPHA_MAJOR_OPACITY")
ALPHA_MAJOR_OPACITY = c(I(0.75), I(1))
