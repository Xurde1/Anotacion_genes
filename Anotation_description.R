  library(dplyr)
  library(annotables)
  library(readxl)
  library(WriteXLS)
  
datos<-"deseq2_counts_yes 110320.xls"
deseq2<-read_excel(datos, sheet ="deseq2_counts_yes por pacientes"  ,col_names = TRUE)
todos_los_genes<-read_excel(datos, sheet ="Todos los genes" ,col_names = TRUE )
solo_significativos<-read_excel(datos, sheet ="Solo significativos1" ,col_names = TRUE)

      
data_gene <- grch38[grch38[, "biotype"]=="protein_coding", ]

  
tabla_pacientes <- as.data.frame(merge(deseq2, grch38, by.x = "...1", by.y = "ensgene"))
 #write.csv(tabla_pacientes, file= "~/Desktop/Tabla_All_PC")
      
tabla_todos_los_genes <- as.data.frame(merge(todos_los_genes, grch38, by.x = "ID", by.y = "ensgene"))
#write.csv(tabla_todos_los_genes , file= "~/Desktop/Tabla_All")
      
tabla_solo_significativos <- as.data.frame(merge(solo_significativos, grch38, by.x = "ID", by.y = "ensgene"))
#write.csv(tabla_Sig_PC, file= "~/Desktop/Tabla_Sig_PC")
files<-c("tabla_pacientes", "tabla_todos_los_genes", "tabla_solo_significativos")
datasheets<-c("deseq2_counts_yes por paciente", "Todos los genes", "Solo significativos1")

WriteXLS(files, SheetNames =datasheets, ExcelFileName = "deseq2_anotado.xls",col.names = TRUE)

 