# [PD36O] Paradigmas da Computação Paralela e Distribuida
# Aluno: Luiz Felipe Fronchetti Dias
library(ggplot2)
# -fdump-tree-ompexp-graph
# xdot, dot -tpdf

# Leitura do arquivo com os dados
setwd("/home/fronchetti/Documentos/OMP-Constructors")
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

library(reshape2)
dados_formatados <- melt(dezesseis_threads, id.vars = "tipo", measure.vars=c("tentativa_0", "tentativa_1", "tentativa_2", "tentativa_3", "tentativa_4", "tentativa_5", "tentativa_6", "tentativa_7", "tentativa_8", "tentativa_9"))
ggplot(dados_formatados, aes(x = variable, y = value, fill = tipo), outlines = FALSE) +
  geom_boxplot()

# Seleciona colunas de tentativas
duas_threads_tentativas <- duas_threads[ , grepl("tentativa_",names(duas_threads))]
duas_threads_tentativas_final <- stack(as.data.frame(t(duas_threads_tentativas)))
quatro_threads_tentativas <- quatro_threads[ , grepl("tentativa_",names(quatro_threads))]
quatro_threads_tentativas_final <- stack(as.data.frame(t(quatro_threads_tentativas)))
oito_threads_tentativas <- oito_threads[ , grepl("tentativa_",names(oito_threads))]
oito_threads_tentativas_final <- stack(as.data.frame(t(oito_threads_tentativas)))
dezesseis_threads_tentativas <- dezesseis_threads[ , grepl("tentativa_",names(dezesseis_threads))]
dezesseis_threads_tentativas_final <- stack(as.data.frame(t(dezesseis_threads_tentativas)))

ggplot(duas_threads_tentativas_final) +
  geom_boxplot(aes(x = ind, y = values)) + scale_x_discrete(name = "Construtores", labels = c("Sequencial", "For", "Taskloop", "Sequencial (SIMD)", "For (SIMD)", "Taskloop (SIMD)")) +
  scale_y_continuous(name = "Tempo de execução (ms)") + ggtitle("Número de threads: 2")  + theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"), text = element_text(size=16, color = "black"))

ggplot(quatro_threads_tentativas_final) +
  geom_boxplot(aes(x = ind, y = values)) + scale_x_discrete(name = "Construtores", labels = c("Sequencial", "For", "Taskloop", "Sequencial (SIMD)", "For (SIMD)", "Taskloop (SIMD)")) +
  scale_y_continuous(name = "Tempo de execução (ms)") + ggtitle("Número de threads: 4")  + theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"), text = element_text(size=16, color = "black"))

ggplot(oito_threads_tentativas_final) +
  geom_boxplot(aes(x = ind, y = values)) + scale_x_discrete(name = "Construtores", labels = c("Sequencial", "For", "Taskloop", "Sequencial (SIMD)", "For (SIMD)", "Taskloop (SIMD)")) +
  scale_y_continuous(name = "Tempo de execução (ms)") + ggtitle("Número de threads: 8")  + theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"), text = element_text(size=16, color = "black"))

ggplot(dezesseis_threads_tentativas_final) +
  geom_boxplot(aes(x = ind, y = values)) + scale_x_discrete(name = "Construtores", labels = c("Sequencial", "For", "Taskloop", "Sequencial (SIMD)", "For (SIMD)", "Taskloop (SIMD)")) +
  scale_y_continuous(name = "Tempo de execução (ms)") + ggtitle("Número de threads: 16")  + theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"), text = element_text(size=16, color = "black"))


