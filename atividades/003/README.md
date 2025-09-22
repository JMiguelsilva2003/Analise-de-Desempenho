# Análise de Desempenho: Lista Encadeada em C, Java e Python

Este repositório contém o código desenvolvido para a cadeira de Análise de Desempenho. O objetivo foi implementar a mesma estrutura de dados (uma lista encadeada) em três linguagens diferentes para comparar a sua performance ao processar um grande volume de operações.

## O Desafio

A tarefa consistia em criar uma lista encadeada do zero, capaz de ler uma série de operações (Adicionar, Remover, Imprimir) a partir de um ficheiro de texto fornecido como argumento na linha de comando.

O programa foi desenvolvido para ser robusto e lidar com ficheiros de entrada com formatação imperfeita (como linhas mais longas que o buffer, contagem de ações incorreta, etc.). Além disso, segue as seguintes regras de negócio:

* Ao tentar adicionar um elemento numa posição que não existe, a operação é ignorada.
* Ao tentar remover um elemento que não existe na lista, a operação é ignorada.

## Linguagens Utilizadas

* **C** (Compilador GCC 6.3.0)
* **Java** (JDK 22.0.1)
* **Python** (Versão 3.12.10)

## Como Compilar e Executar

Para testar os programas, certifique-se de que está no diretório correto e que o ficheiro de entrada existe.

### C (Compilador GCC)

1.  **Compilar:**
    ```sh
    gcc linked_list.c -o programa_c
    ```
2.  **Executar:**
    ```sh
    time ./programa_c <nome_do_arquivo.txt>
    ```

### Java (JDK)

1.  **Compilar:**
    ```sh
    javac Main.java
    ```
2.  **Executar:**
    ```sh
    time java Main <nome_do_arquivo.txt>
    ```

### Python

1.  **Executar (não necessita de compilação):**
    ```sh
    time python3 linked_list.py <nome_do_arquivo.txt>
    ```

## Análise de Performance

Os testes de performance foram realizados executando cada implementação 10 vezes com um ficheiro de entrada de grande volume. Os resultados, incluindo os tempos `real`, `user` e `sys`, juntamente com os cálculos de média e mediana, foram compilados numa planilha online.

**[>> Aqui à Planilha com os Resultados <<](https://docs.google.com/spreadsheets/d/1NmDqzr3dyMHJy-JOClGYhDYix-_XD11dJstNo-HyMjc/edit?usp=sharing)**
