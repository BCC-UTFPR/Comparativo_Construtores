# [PD36O] Paradigmas da Computação Paralela e Distribuida
# Aluno: Luiz Felipe Fronchetti Dias

# Leitura do arquivo com os dados
dados <- read.csv(file="/home/fronchetti/Documentos/ComputacaoParalela/resultados.csv", header=TRUE, sep=",")

# Quantidade de threads usadas
duas_threads <- subset(dados, num_threads == 2)
quatro_threads <- subset(dados, num_threads == 4)
oito_threads <- subset(dados, num_threads == 8)
dezesseis_threads <- subset(dados, num_threads == 16)

# Whiskey para desvio padrão
error.bar <- function(x, y, upper, lower=upper, length=0.1,...){
  if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
    stop("Vetores tem que ter o mesmo comprimento!")
  arrows(x,y+upper, x, y-lower, angle=90, code=3, length=length, ...)
}

# Define os rótulos do eixo x
tipos_de_dados <- c('Sequencial', 'For', 'Taskloop', 'Sequencial + Simd', 'For + Simd', 'Taskloop + Simd')

# Seleciona apenas as colunas de tentativas (para calcular desvio padrão)
duas_threads_tentativas <- duas_threads[ , grepl("tentativa_",names(duas_threads))]
quatro_threads_tentativas <- quatro_threads[ , grepl("tentativa_",names(quatro_threads))]
oito_threads_tentativas <- oito_threads[ , grepl("tentativa_",names(oito_threads))]
dezesseis_threads_tentativas <- dezesseis_threads[ , grepl("tentativa_",names(dezesseis_threads))]

# Declara as médias e calculamos os desvios
media_duas_threads <- duas_threads$media
desvio_duas_threads <- c(sd(duas_threads_tentativas[1,]), sd(duas_threads_tentativas[2,]), sd(duas_threads_tentativas[3,]), sd(duas_threads_tentativas[4,]), sd(duas_threads_tentativas[5,]), sd(duas_threads_tentativas[6,]))
media_quatro_threads <- quatro_threads$media
desvio_quatro_threads <- c(sd(quatro_threads_tentativas[1,]), sd(quatro_threads_tentativas[2,]), sd(quatro_threads_tentativas[3,]), sd(quatro_threads_tentativas[4,]), sd(quatro_threads_tentativas[5,]), sd(quatro_threads_tentativas[6,]))
media_oito_threads <- oito_threads$media
desvio_oito_threads <- c(sd(oito_threads_tentativas[1,]), sd(oito_threads_tentativas[2,]), sd(oito_threads_tentativas[3,]), sd(oito_threads_tentativas[4,]), sd(oito_threads_tentativas[5,]), sd(oito_threads_tentativas[6,]))
media_dezesseis_threads <- dezesseis_threads$media
desvio_dezesseis_threads <- c(sd(dezesseis_threads_tentativas[1,]), sd(dezesseis_threads_tentativas[2,]), sd(dezesseis_threads_tentativas[3,]), sd(dezesseis_threads_tentativas[4,]), sd(dezesseis_threads_tentativas[5,]), sd(dezesseis_threads_tentativas[6,]))
