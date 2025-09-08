# Analisador de Números Primos em C

Este projeto desenvolvido em C, que tem como objetivo principal calcular e listar todos os números primos existentes até um determinado número inteiro `N`.

O foco do desenvolvimento foi em criar uma solução que não só fosse correta, mas também **eficiente** em termos de tempo de execução e **robusta** no tratamento de entradas inválidas.

## Funcionalidades

* **Entrada de Utilizador**: O programa solicita ao utilizador que insira um número inteiro positivo `N`.
* **Validação Robusta de Entrada**: O código foi construído para lidar com casos de erro, rejeitando entradas como:
    * Texto ou caracteres não numéricos.
    * Números negativos e o zero.
    * Números excessivamente grandes que excedam a capacidade do tipo de dado.
* **Cálculo Eficiente**: Utiliza o algoritmo **Crivo de Eratóstenes** para encontrar os números primos, garantindo um excelente desempenho mesmo para valores grandes de `N`.
* **Medição de Desempenho**: O tempo exato que o algoritmo leva para realizar o cálculo é medido e exibido no final, permitindo uma análise clara da sua eficiência.
* **Saída Completa**: O programa exibe três informações principais:
    1.  O valor de `N` utilizado.
    2.  A lista completa de todos os números primos encontrados no intervalo `[1, N]`.
    3.  A contagem total de números primos.

## Algoritmo Utilizado: O Crivo de Eratóstenes

Para garantir a rapidez do cálculo, implementei o **Crivo de Eratóstenes**. Este método é muito mais eficiente do que a abordagem de força bruta (testar a divisibilidade de cada número), especialmente para números grandes.

A lógica do algoritmo funciona da seguinte forma:

1.  Cria-se uma lista booleana (verdadeiro/falso) de todos os números de 2 até `N`, marcando todos inicialmente como "primos em potencial" (verdadeiro).
2.  Começando pelo primeiro primo (2), percorremos a lista e marcamos todos os seus múltiplos (4, 6, 8, ...) como "não primos" (falso).
3.  Passamos para o próximo número que não foi marcado (o 3) e repetimos o processo, marcando 6, 9, 12, etc., como "não primos".
4.  Este processo é repetido para os números seguintes, com uma otimização crucial: só precisamos de ir até à raiz quadrada de `N`.
5.  Ao final, os números que permaneceram marcados como "verdadeiro" na lista são os números primos.

## Como Compilar e Executar

### Pré-requisitos

Para compilar e executar este projeto, você precisa de um compilador C. O **GCC** (disponível no Linux ou através do MinGW no Windows) é recomendado.

### Passos

1.  **Salvar o Código:**
    Salve o código-fonte num ficheiro chamado `analisador_primos.c`.

2.  **Abrir um Terminal:**
    Navegue através do terminal (ou prompt de comando) até à pasta onde salvou o ficheiro.

3.  **Compilar o Programa:**
    Execute o seguinte comando para compilar o código. O comando cria um ficheiro executável chamado `analisador_primos`.
    ```bash
    gcc analisador_primos.c -o analisador_primos -lm
    ```
    * `gcc`: O compilador.
    * `-o analisador_primos`: Define o nome do ficheiro de saída (o executável).
    * `-lm`: Vincula a biblioteca matemática, necessária para a função `sqrt()` usada no algoritmo.

4.  **Executar:**
    Após a compilação bem-sucedida, execute o programa com o comando:

    * No Windows:
        ```bash
        .\analisador_primos.exe
        ```
    * No Linux ou macOS:
        ```bash
        ./analisador_primos
        ```