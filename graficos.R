# [PD36O] Paradigmas da Computação Paralela e Distribuida
# Aluno: Luiz Felipe Fronchetti Dias
library(ggplot2)
# -fdump-tree-ompexp-graph
# xdot, dot -tpdf

# Leitura do arquivo com os dados
setwd("/home/todos/alunos/cm/a1552309/Documentos/OMP-Constructors")
dados <- read.csv(file="resultados.csv", header=TRUE, sep=",")

# Quantidade de threads usadas
duas_threads <- subset(dados, num_threads == 2)
quatro_threads <- subset(dados, num_threads == 4)
oito_threads <- subset(dados, num_threads == 8)
dezesseis_threads <- subset(dados, num_threads == 16)

# Define rótulos das execuções utilizadas
tipos_de_dados <- c('Sequencial', 'For', 'Taskloop', 'Sequencial + Simd', 'For + Simd', 'Taskloop + Simd')

ggplot(dados, aes(fill=tipo, y=media, x=factor(num_threads))) + 
  geom_bar(position="dodge", stat="identity") +
  theme(text = element_text(size=20), axis.text=element_text(colour="black"))  +
  labs(title = "", x = "Número de threads", y = "Média do tempo de execução (ms)", color = "Tipo:\n") + 
  scale_fill_discrete(breaks=c("sequencial","sequencial_simd","for","for_simd","taskloop","taskloop_simd"),
                      labels=c("Sequencial", "Sequencial (SIMD)", "For", "For (SIMD)", "Taskloop", "Taskloop (SIMD)"),
                      name="") + theme(legend.position="top")

# Seleciona colunas de tentativas
duas_threads_tentativas <- duas_threads[ , grepl("tentativa_",names(duas_threads))]
quatro_threads_tentativas <- quatro_threads[ , grepl("tentativa_",names(quatro_threads))]
oito_threads_tentativas <- oito_threads[ , grepl("tentativa_",names(oito_threads))]
dezesseis_threads_tentativas <- dezesseis_threads[ , grepl("tentativa_",names(dezesseis_threads))]
