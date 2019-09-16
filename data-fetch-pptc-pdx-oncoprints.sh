#!/bin/bash
# Data files for pptc-pdx-oncoprints
# INPUT files
# Approved hugo symbols file = 2019-02-14-Hugo-Symbols-approved.txt
# clinical file = 2019-02-09-pdx-clinical-final-for-paper.txt
# source scripts = 
# 1. mutation-color-function.R 
# 2. demog-color-function.R 

# MAF file = 2019-02-14-allpdx-clean-maf-240.rda
# Expression matrix = 2019-02-14-PPTC_FPKM_matrix_withModelID-244.RDS
# focal CN matrix = 2019-02-27-short_cn_matrix_fpkm1.txt
# genelists
# classifier scores = classifier_scores_with_clinical_and_alterations.tsv

cd ~
mkdir -p pptc-pdx-oncoprints/data/
chmod 755 pptc-pdx-oncoprints/data/
cd ~/pptc-pdx-oncoprints/data/

# 1. Approved Hugo Symbols file
wget --output-document='2019-02-14-Hugo-Symbols-approved.txt' https://ndownloader.figshare.com/files/14460317

# 2. Clinical file
wget --output-document='pptc-pdx-clinical-web.txt' https://ndownloader.figshare.com/files/16257497

# 3. Download DNA MAF file
wget --output-document='2019-02-14-allpdx-clean-maf-240.rda' https://ndownloader.figshare.com/files/14414198

# 4. Download Expression matrix
wget --output-document='2019-02-14-PPTC_FPKM_matrix_withModelID-244.rda' https://ndownloader.figshare.com/files/14452985

# 4. focal CN matrix
wget --output-document='short_cn_matrix_fpkm1.txt' https://ndownloader.figshare.com/files/16603340

# 5. download gene lists
wget --output-document='leukemia-goi-list.txt' https://ndownloader.figshare.com/files/14541185
wget --output-document='osteosarcoma-goi-list.txt' https://ndownloader.figshare.com/files/14541191
wget --output-document='renal-goi-list.txt' https://ndownloader.figshare.com/files/14541197
wget --output-document='brain-goi-list.txt' https://ndownloader.figshare.com/files/14541182
wget --output-document='neuroblastoma-goi-list.txt' https://ndownloader.figshare.com/files/14541188
wget --output-document='rare-goi-list.txt' https://ndownloader.figshare.com/files/14541194
wget --output-document='sarcoma-goi-list.txt' https://ndownloader.figshare.com/files/14541200

# 6. Classifier scores
wget --output-document="classifier_scores.tsv" https://ndownloader.figshare.com/files/14679884
