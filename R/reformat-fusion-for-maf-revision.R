#### Read collapsed Fusion File ####
fus = read.delim(paste0(dataDir,"Driver_Fusions.txt"),
                         sep = "\t", header = T, as.is = T)
names(fus)
###separate fusion gene partners and add variant classification and center
fus$Fusion <- fus$Fused_Genes
fus.sep <- fus %>% separate(Fusion, c("5'-gene", "3'-gene"), sep = "--")
names(fus.sep)

###determine which samples have mult-fused fusions
multi <- fus.sep[,c("Model", "5'-gene", "3'-gene")]
multi$ID <- paste0(multi$Model, ";", multi$`5'-gene`)
reformat.multi <- multi %>% 
  group_by(ID) %>% 
  dplyr::summarise(Model = n()) %>%
  as.data.frame()

reformat.multi$Variant_Classification <- ifelse(reformat.multi$Model == 1, "Fusion", "Multi_Hit_Fusion")
reformat.multi <- reformat.multi %>% separate(ID, c("Tumor_Sample_Barcode", "Hugo_Symbol"), sep = ";")
reformat.multi$Model <- NULL
reformat.multi$Variant_Type <- "OTHER"


#fus.sep$Variant_Classification <- "Fusion"
#fus.sep$Variant_Type <- "OTHER"
#colnames(fus.sep)[colnames(fus.sep)=="Model"] <- "Tumor_Sample_Barcode"
#fus5 <- fus.sep[,c("Tumor_Sample_Barcode",  "5'-gene", "Variant_Classification", "Variant_Type")]
#colnames(fus5)[colnames(fus5) == "5'-gene"] <- "Hugo_Symbol"
#fus3 <- fus.sep[,c("Tumor_Sample_Barcode", "3'-gene", "Variant_Classification", "Variant_Type")]
#colnames(fus3)[colnames(fus3) == "3'-gene"] <- "Hugo_Symbol"
#names(fus5)
#names(fus3)

#fus.expanded <- bind_rows(fus5, fus3) 

  
#unique(fus.expanded$Hugo_Symbol)
#head(fus.expanded)

###merge with MAF
maf.fus <- bind_rows(pptc.merge, reformat.multi)
subset(maf.fus, Hugo_Symbol == "KMT2A" & Tumor_Sample_Barcode == "MLL-86")
