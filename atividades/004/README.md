# Análise de Desempenho: Bubble Sort em R e C

Este repositório contém o código desenvolvido para a cadeira de Análise de Desempenho. O objetivo foi implementar o algoritmo Bubble Sort em duas linguagens diferentes (R e C) para comparar a sua performance ao processar, ordenar e gravar um grande volume de dados.

## O Desafio

A tarefa consistia em desenvolver um programa de ordenação que seguisse os seguintes requisitos:

* [cite_start]Implementar o algoritmo **Bubble Sort**. [cite: 3]
* [cite_start]Ler uma lista de números a partir de um ficheiro de texto de entrada (`arq.txt`), com cada número numa linha separada. [cite: 8, 10]
* [cite_start]Medir o **tempo de execução** e o **consumo de memória RAM** utilizando recursos da própria linguagem de programação. [cite: 5, 6]
* [cite_start]Gerar um ficheiro de saída (`arq-saida.txt`) com os números devidamente ordenados. [cite: 12]

## Linguagens Utilizadas

* **C** (Compilador GCC 6.3.0)
* **R** (Versão 4.5.1)

## Como Compilar e Executar

Para testar os programas, certifique-se de que está no diretório correto e que o ficheiro de entrada existe.

### C

1.  **Compilar:**
    ```sh
    gcc nome_do_seu_arquivo.c -o sorter_c
    ```
2.  **Executar:**
    ```sh
    ./sorter_c <arquivo_de_entrada.txt>
    ```

### R

1.  **Preparar o Ambiente (só na primeira vez):**
    Abra a consola do R e instale os pacotes necessários:
    ```r
    install.packages("profmem")
    install.packages("optparse")
    ```
2.  **Executar:**
    Use o comando `Rscript` no terminal. O script foi feito para usar o Bubble Sort por defeito se o algoritmo não for especificado.
    ```sh
    Rscript ordenacao.R --input <arquivo_de_entrada.txt> --algoritmo=bubble
    ```

## Análise de Performance

Os testes de performance foram realizados executando cada implementação 10 vezes com um ficheiro de entrada de grande volume. [cite_start]Os resultados, incluindo os tempos de execução (ms) e o uso de memória (KB), juntamente com os cálculos de média e mediana, foram compilados numa planilha. [cite: 16]

**[>> Aceda aqui à Planilha com os Resultados <<](http://)**