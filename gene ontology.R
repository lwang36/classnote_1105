### Gene set enrichment analysis ###

DAVID bioinformatics resources
cytoscape software + cluego plug in: visulize complex network
KEGG online tool/database to classify function..

# Gene ontology database. A set of annotation file describing the entire gene
ontology assembled using data from GO

source("https://bioconductor.org/biocLite.R")
biocLite("GO.db") # annotation file for gene ontology datsbase

biocLite("topGO") # topGO package provides tools for testing GO terms while
accounting for the topology of the GO graph. Different test statistics and
different methods for eliminating local similarities and dependencies between
GO terms can be implemented and applied

biocLite("GOstats") # provide statisitical analysis; A set of tools for
interacting with GO and microarray data. A variety of basic manipulation
tools for graphs, hypothesis testing and other simple calculations.

biocLite("org.Hs.eg.db")# Go maps for humans

library(GO.db)# check if you have the pacakge



# class note 1105, loading the annotation file and gene ontology database file
library(org.Hs.eg.db) 
library(GO.db)

object <- org.Hs.egGO # Go maps for human
genes_to_map <- mappedkeys(object)

# making a list of genes to map

genes_to_map_list <- as.list(object[genes_to_map]) # as.list: create of list of things for your data
library("GOstats")# library to do some statisitcal analysis of gene
# install library("GOstats")
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("GOstats", version = "3.8")

gene_significant <- c(" ", " ", " ", " ")

parameters <- new('GOHyperGParams', geneIds=c("1000","100"),
universeGeneIds=genes_to_map,ontology='BP', pvalueCutoff=0.001,
conditional=F, testDirection='over',
annotation="org.Hs.eg.db")

test_results <- hyperGTest(parameters)
summary(test_results)
results <- summary(test_results)
head(results, 5)

"Enrez Gene IDS" Or "Ensembl gene IDs"

# Download package Biomart for using Ensembl gene IDs
source("http://bioconductor.org/biocLite.R")
biocLite("biomaRt")
library(biomaRt)
