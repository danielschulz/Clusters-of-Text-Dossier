
# EDA

qplot(d$clEqually, d$prSum, col=d$clCorrect, size=2, alpha=0.75)


ggplot(data=d, aes(prSparse, prFull)) + geom_point(aes(colour=major, size=3, alpha=5+prSumSu)) + scale_colour_gradient(high = "orange") + geom_vline(xintercept=0, colour="gray") + geom_hline(xintercept=0, colour="gray") + geom_text(size=3, angle=0, alpha=0.65, vjust=1, hjust=1, label=d$X)
# ggplot(data=k, aes(prSparse, prFull)) + geom_point(aes(colour=major, size=3, alpha=5+prSumSu)) + scale_colour_gradient(high = "orange") + geom_vline(xintercept=0, colour="gray") + geom_hline(xintercept=0, colour="gray") + geom_text(size=3, angle=0, alpha=0.65, vjust=1, hjust=1, label=d$X)


ggplot(data=k1, aes(prSparse, prFull)) + geom_point(aes(colour=major, size=3, alpha=5+prSumSu)) + scale_colour_gradient(high = "orange") + geom_vline(xintercept=0, colour="gray") + geom_hline(xintercept=0, colour="gray") + geom_text(size=3, angle=0, alpha=0.65, vjust=1, hjust=1, label=k1$X)
ggplot(data=k2, aes(prSparse, prFull)) + geom_point(aes(colour=major, size=3, alpha=5+prSumSu)) + scale_colour_gradient(high = "orange") + geom_vline(xintercept=0, colour="gray") + geom_hline(xintercept=0, colour="gray") + geom_text(size=3, angle=0, alpha=0.65, vjust=1, hjust=1, label=k2$X)

ggplot(data=k, aes(prSparse, prFull)) + geom_point(aes(colour=cluster, size=3, alpha=5+prSumSu)) + scale_colour_gradient(high = "orange") + geom_vline(xintercept=0, colour="gray") + geom_hline(xintercept=0, colour="gray") + geom_text(size=3, angle=k$random, alpha=0.65, vjust=1, hjust=1, label=k$X)


ggplot(data=k1, aes(prSparse, prFull)) + geom_point(aes(colour=cluster, size=3, alpha=5+prSumSu)) + scale_colour_gradient(high = "orange") + geom_text(size=3, angle=k1$random, alpha=0.65, vjust=1, hjust=1, label=k1$X)
ggplot(data=k2, aes(prSparse, prFull)) + geom_point(aes(colour=cluster, size=3, alpha=5+prSumSu)) + scale_colour_gradient(high = "orange") + geom_vline(xintercept=0, colour="gray") + geom_hline(xintercept=0, colour="gray") + geom_text(size=3, angle=k2$random, alpha=0.65, vjust=1, hjust=1, label=k2$X)