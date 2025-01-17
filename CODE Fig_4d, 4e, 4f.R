if (!requireNamespace('BiocManager', quietly = TRUE))
  install.packages('BiocManager')

BiocManager::install('EnhancedVolcano')
library(EnhancedVolcano)
library(EnhancedVolcano)
EnhancedVolcano(deseq_k3,
                lab = rownames(deseq_k3),
                x = 'log2FoldChange',
                y = 'pvalue')
keyvals.colour <- ifelse(
  deseq_k3$log2FoldChange < -2 & deseq_k3$pvalue < 10e-32, 'slateblue',
  ifelse(deseq_k3$log2FoldChange > 2 & deseq_k3$pvalue < 10e-32, 'maroon4',
  ifelse(deseq_k3$pvalue > 10e-32, 'red',
         'black')))
keyvals.colour[is.na(keyvals.colour)] <- 'black'
names(keyvals.colour)[keyvals.colour == 'maroon4'] <- 'overexpression'
names(keyvals.colour)[keyvals.colour == 'black'] <- 'mid'
names(keyvals.colour)[keyvals.colour == 'slateblue'] <- 'underexpression'
names(keyvals.colour)[keyvals.colour == 'red'] <- 'NS'
EnhancedVolcano(deseq_k3,
                lab = deseq_k3$Hugo,
                x = 'log2FoldChange',
                y = 'pvalue',
                xlim = c(-10, 10),
                pCutoff = 10e-32,
                FCcutoff = 2,
                cutoffLineType = 'twodash',
                cutoffLineWidth = 0.8,
                labSize = 0.0,
                pointSize = ifelse(
                  deseq_k3$log2FoldChange < -2 & deseq_k3$pvalue < 10e-32, 2,
                  ifelse(deseq_k3$log2FoldChange > 2 & deseq_k3$pvalue < 10e-32, 2,
                  ifelse(deseq_k3$pvalue < 10e-32, 0.5,
                         0.3))),
                colAlpha = 0.2,
                colCustom = keyvals.colour,
                legendLabels=c('Not sig.','Log (base 2) FC','p-value',
                               'p-value & Log (base 2) FC'),
                legendPosition = 'right',
                legendLabSize = 8,
                legendIconSize = 5.0)
