# Projeto Lista Encadeada em C

## Descrição

Este projeto é uma implementação de uma **Lista Encadeada** (Linked List) na linguagem C.

O programa lê suas instruções a partir de um arquivo de texto chamado `arq.txt`, que define o estado inicial da lista e uma sequência de operações a serem executadas.

As operações suportadas são:
* **Adicionar (`A`)**: Insere um novo número numa posição específica.
* **Remover (`R`)**: Remove a primeira ocorrência de um número na lista.
* **Imprimir (`P`)**: Mostra o estado atual da lista no ecrã.

## Tratamento de Erros

Esta versão do programa foi projetada para lidar com arquivos de entrada mal formatados. As principais características de robustez são:

1.  **Tolerância a Dados Extras**: O leitor do arquivo é capaz de ignorar caracteres ou números extras no final de uma linha de ação (por exemplo, uma linha como `R 87 2` será lida corretamente como `R 87`).
2.  **Compatibilidade**: A leitura de linhas foi melhorada para ser compatível com arquivos de texto criados tanto em Windows (`\r\n`) quanto em Linux/macOS (`\n`).

## Explicação do Código

funções de manipulação e a função `main`.

* **Estruturas (`Node`, `LinkedList`)**: Definem a base da lista encadeada, onde cada `Node` contém um valor e um ponteiro para o `proximo`.
* **Funções de Manipulação**:
    * `adicionar_no`: Insere um elemento na lista.
    * `remover_no_por_valor`: Remove um elemento pelo seu valor.
    * `imprimir_lista`: Exibe a lista.
    * `libertar_lista`: Libera toda a memória alocada para evitar *memory leaks*.
* **Função `main` (Lógica Principal)**:
    1.  Abre `arq.txt`.
    2.  Lê a primeira linha para popular a lista inicial.
    3.  Entra em um loop `while` que lê o arquivo ação por ação **até o final do arquivo (EOF)**.
    4.  Após cada ação, **limpa o restante da linha**, garantindo que a próxima leitura não seja afetada por dados extras.
    5.  Fecha o arquivo e libera a memória.

## Como Usar (Tutorial)

Siga estes passos para compilar e executar o projeto.

### Pré-requisitos
* Um compilador de C instalado (como o **GCC**).

### Passo 1: Salvar o Código
* Salve o código C fornecido acima em um ficheiro chamado `main.c`.

### Passo 2: Compilar o Código
* Abra um terminal e navegue até a pasta onde salvou o `main.c`.
* Execute o comando abaixo para criar uma pasta `output` com o programa executável dentro dela.

    ```sh
    # Cria a pasta de saída
    mkdir -p output

    # Compila o código e coloca o executável na pasta 'output'
    gcc main.c -o ./output/programa
    ```

### Passo 3: Criar o Ficheiro de Entrada (`arq.txt`)
* **Importante**: Crie o arquivo `arq.txt` **dentro da pasta `output`**, ao lado do executável `programa`.

### Passo 4: Executar o Programa
* No terminal, navegue para dentro da pasta `output`:
    ```sh
    cd output
    ```
* Execute o programa:
    ```sh
    ./programa
    ```
    (No Windows, o comando pode ser `programa.exe`)

### Passo 5: Analisar a Saída
* O programa irá executar todas as ações do `arq.txt`, imprimindo a lista no terminal sempre que encontrar o comando `P`.