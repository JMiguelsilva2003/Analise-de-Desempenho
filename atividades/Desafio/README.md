# Análise de Desempenho: Bubble Sort em C e R em Múltiplos Ambientes

Este repositório contém o código desenvolvido para a cadeira de Análise de Desempenho, focando na comparação de performance do algoritmo Bubble Sort implementado em C e R. O projeto expandiu a análise inicial (Atividade 3) ao executar os mesmos programas em diferentes ambientes de computação em nuvem.

## O Desafio

A tarefa consistiu em:

1.  Desenvolver programas em **C** e **R** que implementam o algoritmo **Bubble Sort**. 
2.  Os programas devem ler uma lista de números inteiros de um ficheiro de texto (`arq.txt`, um número por linha).
3.  Medir o **tempo de execução** (ms) e o **consumo de memória RAM** (KB) utilizando recursos internos de cada linguagem. 
4.  Gerar um ficheiro de saída (`arq-saida.txt`) com os números ordenados.
5.  Executar estes programas em **três ambientes de nuvem distintos** (Replit, GitHub Codespaces, Google Colab) além da máquina local.
6.  Compilar os resultados numa planilha comparativa e analisar as diferenças de desempenho.

## Linguagens e Ambientes Testados

* **Linguagens:**
    * **C** (Compilador GCC, versões variadas dependendo do ambiente)
    * **R** (Versões 4.3.3 e 4.5.1 dependendo do ambiente)
* **Ambientes:**
    * Máquina Local (Windows 11)
    * Replit (Ambiente Linux online)
    * GitHub Codespaces (Ambiente Linux online)
    * Google Colab (Ambiente Linux online)

## Como Compilar e Executar

Certifique-se de que está no diretório correto e que o ficheiro de entrada (`arq.txt`) existe.

### C

1.  **Compilar:**
    ```sh
    gcc nome_do_seu_arquivo.c -o sorter_c
    ```
2.  **Executar:** (O código em C foi ajustado para medir tempo/memória internamente)
    ```sh
    ./sorter_c <arquivo_de_entrada.txt>
    ```

### R

1.  **Preparar o Ambiente (pode ser necessário na primeira vez em cada máquina):**
    Abra a consola do R e instale o pacote `optparse`:
    ```r
    install.packages("optparse")
    ```
2.  **Executar (via Terminal/Shell):**
    Use o comando `Rscript`. O ficheiro `arq.txt` é usado por defeito se `--input` não for especificado.
    ```sh
    Rscript ordenacao.R --algoritmo=bubble 
    # Para o algoritmo rápido (se aplicável):
    # Rscript ordenacao.R --algoritmo=rapido 
    ```

## Análise Comparativa de Performance

Os testes de performance foram realizados executando cada implementação 10 vezes em cada um dos quatro ambientes (local + 3 nuvens) com um ficheiro de entrada de 25 números. Os resultados detalhados, incluindo dados brutos, médias, medianas e informações dos ambientes, foram compilados numa planilha Google.

**[>> Aceda aqui à Planilha Completa com os Resultados <<](https://docs.google.com/spreadsheets/d/18VWPbhprBUpJwlYyTk21HtMffQHvz5nUOWn0qSVMEHI/edit?usp=sharing)**