
# spill to disk
dataLocation = "output\\data\\AggregatedFeatures.RData"
save(data, file=dataLocation)

dataLocation = "output\\data\\Clusters.RData"
save(k, file=dataLocation)
