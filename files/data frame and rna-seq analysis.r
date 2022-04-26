download.file(url="https://raw.githubusercontent.com/quinlan-lab/sllobs-biostats/master/data/lecture-03/airway_scaledcounts.subset.euro.fixed.tsv",
              destfile="genecounts.fixed.tsv")
# downloaded genecounts.fixed.tsv from url

gene_counts <- read.table("genecounts.fixed.tsv", header = TRUE, dec = ",")

dim(gene_counts)


plot(x= gene_counts$control_1, y= gene_counts$control_2, asp=1, xlim=c(0,2500), ylim = c(0,2500))
abline(0,1,col="orange")


gene_counts$control_mean <- (gene_counts$control_1 + gene_counts$control_2) / 2 
gene_counts$treated_mean <- (gene_counts$treated_1 + gene_counts$treated_2) / 2 

plot(gene_counts$control_mean, gene_counts$treated_mean, xlim=c(0,2500), ylim=c(0,2500))
abline(0,1, col="orange")


gene_counts$logexpr = log2(gene_counts$treated_mean / gene_counts$control_mean)
gene_counts$color[gene_counts$logexpr >=3 | gene_counts$logexpr <=-3]="darkblue"
gene_counts$color[gene_counts$logexpr <3  & gene_counts$logexpr >-3]="darkgray"  
plot(gene_counts$logexpr, col=gene_counts$color, xlab="gene index", ylab="log2(treated / control)")
