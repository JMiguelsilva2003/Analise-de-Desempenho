if (!require("optparse")) install.packages("optparse")
library(optparse)

bubble_sort <- function(numeros) {
  n <- length(numeros)
  if (n <= 1) {
    return(numeros)
  }
  for (i in 1:(n - 1)) {
    for (j in 1:(n - i)) {
      if (numeros[j] > numeros[j + 1]) {
        temp <- numeros[j]
        numeros[j] <- numeros[j + 1]
        numeros[j + 1] <- temp
      }
    }
  }
  return(numeros)
}

option_list <- list(
  make_option(c("-a", "--algoritmo"), type="character", default="rapido",
              help="Algoritmo a ser usado: 'bubble' ou 'rapido' [default %default]", metavar="character"),
  make_option(c("-i", "--input"), type="character", default="arq.txt",
              help="Nome do arquivo de entrada [default %default]", metavar="character"),
  make_option(c("-o", "--output"), type="character", default="arq-saida.txt",
              help="Nome do arquivo de saída [default %default]", metavar="character")
)
opt_parser <- OptionParser(option_list=option_list)
opt <- parse_args(opt_parser)

cat("--- Informações do Ambiente ---\n")
cat("Linguagem: R\n")
cat(paste("Versão:", R.version.string, "\n"))
cat(paste("Sistema Operacional:", sessionInfo()$running, "\n"))
cat("-------------------------------\n\n")

tryCatch({
  linhas <- readLines(opt$input)
  linhas <- linhas[linhas != ""]
  numeros <- as.numeric(linhas)
  numeros <- na.omit(numeros) 

  gc(reset=TRUE)
  
  inicio_tempo <- Sys.time()
  
  if (opt$algoritmo == "bubble") {
    numeros_ordenados <- bubble_sort(numeros)
  } else {
    numeros_ordenados <- sort(numeros)
  }

  fim_tempo <- Sys.time()
  duracao <- fim_tempo - inicio_tempo
  tempo_ms <- as.numeric(duracao) * 1000
  
  info_memoria <- gc()
  memoria_kb <- info_memoria[2, 2] * 1024

  writeLines(as.character(numeros_ordenados), opt$output)

  cat("--- Resultados da Execução ---\n")
  cat(paste("Algoritmo Utilizado:", opt$algoritmo, "\n"))
  cat(paste("Tempo de Execução:", round(tempo_ms, 2), "ms\n"))
  cat(paste("Memória RAM Utilizada:", round(memoria_kb, 2), "KB\n"))
  cat("-------------------------------\n")

}, error = function(e) {
  cat(paste("Ocorreu um erro:", e$message, "\n"))
})