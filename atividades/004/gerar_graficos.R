library(ggplot2)
library(readr)

dados <- read_csv("resultados_finais.csv")

grafico_media_tempo <- ggplot(dados[dados$Tipo == "Média" & dados$Metrica == "Tempo", ], 
                              aes(x=reorder(Algoritmo, Valor), y=Valor, fill=Algoritmo)) +
  geom_bar(stat="identity") +
  geom_text(aes(label=sprintf("%.2f ms", Valor)), vjust=-0.5) +
  labs(title="Média de Tempo de Execução por Algoritmo",
       x="Algoritmo",
       y="Tempo (ms)") +
  theme_minimal() +
  theme(legend.position="none")

ggsave("grafico_media_tempo.png", plot=grafico_media_tempo)

grafico_mediana_tempo <- ggplot(dados[dados$Tipo == "Mediana" & dados$Metrica == "Tempo", ], 
                                aes(x=reorder(Algoritmo, Valor), y=Valor, fill=Algoritmo)) +
  geom_bar(stat="identity") +
  geom_text(aes(label=sprintf("%.2f ms", Valor)), vjust=-0.5) +
  labs(title="Mediana de Tempo de Execução por Algoritmo",
       x="Algoritmo",
       y="Tempo (ms)") +
  theme_minimal() +
  theme(legend.position="none")

ggsave("grafico_mediana_tempo.png", plot=grafico_mediana_tempo)

grafico_media_memoria <- ggplot(dados[dados$Tipo == "Média" & dados$Metrica == "Memória", ], 
                                aes(x=reorder(Algoritmo, Valor), y=Valor, fill=Algoritmo)) +
  geom_bar(stat="identity") +
  geom_text(aes(label=sprintf("%.1f KB", Valor)), vjust=-0.5) +
  labs(title="Média de Memória Utilizada por Algoritmo",
       x="Algoritmo",
       y="Memória (KB)") +
  theme_minimal() +
  theme(legend.position="none")

ggsave("grafico_media_memoria.png", plot=grafico_media_memoria)

grafico_mediana_memoria <- ggplot(dados[dados$Tipo == "Mediana" & dados$Metrica == "Memória", ], 
                                  aes(x=reorder(Algoritmo, Valor), y=Valor, fill=Algoritmo)) +
  geom_bar(stat="identity") +
  geom_text(aes(label=sprintf("%.1f KB", Valor)), vjust=-0.5) +
  labs(title="Mediana de Memória Utilizada por Algoritmo",
       x="Algoritmo",
       y="Memória (KB)") +
  theme_minimal() +
  theme(legend.position="none")

ggsave("grafico_mediana_memoria.png", plot=grafico_mediana_memoria)

cat("4 gráficos foram gerados e salvos como ficheiros .png!\n")