#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Node {
    int valor;
    struct Node* proximo;
} Node;

typedef struct LinkedList {
    Node* head;
} LinkedList;

Node* criar_no(int valor);
LinkedList* criar_lista();
void adicionar_no(LinkedList* lista, int valor, int posicao);
void remover_no_por_valor(LinkedList* lista, int valor);
void imprimir_lista(LinkedList* lista);
void libertar_lista(LinkedList* lista);

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Erro: O nome do arquivo de entrada nao foi fornecido.\n");
        printf("Uso: %s <nome_do_arquivo>\n", argv[0]);
        return 1;
    }

    FILE* arquivo = fopen(argv[1], "r");
    if (arquivo == NULL) {
        printf("Erro: Nao foi possivel abrir o arquivo '%s'\n", argv[1]);
        return 1;
    }

    LinkedList* lista = criar_lista();
    int numero_inicial;
    char buffer[4096];

    while (fgets(buffer, sizeof(buffer), arquivo)) {
        int linha_terminou = (strchr(buffer, '\n') != NULL);
        
        char* token = strtok(buffer, " \n\r");
        while (token != NULL) {
            if (atoi(token) != 0 || strcmp(token, "0") == 0) {
                numero_inicial = atoi(token);
                adicionar_no(lista, numero_inicial, -1);
            }
            token = strtok(NULL, " \n\r");
        }

        if (linha_terminou) {
            break;
        }
    }

    int qtd_acoes_declarada = 0;
    fscanf(arquivo, "%d", &qtd_acoes_declarada);

    int contador_acoes_reais = 0;
    char acao;
    int valor, posicao;
    int c;

    while ((c = fgetc(arquivo)) != '\n' && c != EOF);

    while (fscanf(arquivo, " %c", &acao) == 1) {
        contador_acoes_reais++;

        if (acao == 'A') {
            fscanf(arquivo, "%d %d", &valor, &posicao);
            adicionar_no(lista, valor, posicao);
        } else if (acao == 'R') {
            fscanf(arquivo, "%d", &valor);
            remover_no_por_valor(lista, valor);
        } else if (acao == 'P') {
            imprimir_lista(lista);
        } else {
            printf("Aviso: Acao desconhecida '%c' na linha %d (aproximadamente). Ignorando.\n", acao, contador_acoes_reais + 2);
        }

        while ((c = fgetc(arquivo)) != '\n' && c != EOF);
    }

    if (contador_acoes_reais != qtd_acoes_declarada) {
        printf("\n--------------------------------------------------\n");
        printf("AVISO DE INCONSISTENCIA NO ARQUIVO:\n");
        printf("-> Acoes declaradas na linha 2: %d\n", qtd_acoes_declarada);
        printf("-> Acoes realmente processadas: %d\n", contador_acoes_reais);
        printf("--------------------------------------------------\n");
    }

    fclose(arquivo);
    libertar_lista(lista);

    return 0;
}

Node* criar_no(int valor) {
    Node* novo_no = (Node*)malloc(sizeof(Node));
    if (novo_no == NULL) {
        printf("Erro fatal: Falha na alocacao de memoria para um novo no.\n");
        exit(1);
    }
    novo_no->valor = valor;
    novo_no->proximo = NULL;
    return novo_no;
}

LinkedList* criar_lista() {
    LinkedList* nova_lista = (LinkedList*)malloc(sizeof(LinkedList));
    if (nova_lista == NULL) {
        printf("Erro fatal: Falha na alocacao de memoria para a lista.\n");
        exit(1);
    }
    nova_lista->head = NULL;
    return nova_lista;
}

void adicionar_no(LinkedList* lista, int valor, int posicao) {
    Node* novo_no = criar_no(valor);
    if (posicao == 0 || lista->head == NULL) {
        novo_no->proximo = lista->head;
        lista->head = novo_no;
        return;
    }
    Node* atual = lista->head;
    if (posicao == -1) {
        while (atual->proximo != NULL) {
            atual = atual->proximo;
        }
        atual->proximo = novo_no;
        return;
    }
    int contador = 0;
    while (contador < posicao - 1 && atual->proximo != NULL) {
        atual = atual->proximo;
        contador++;
    }
    novo_no->proximo = atual->proximo;
    atual->proximo = novo_no;
}

void remover_no_por_valor(LinkedList* lista, int valor) {
    if (lista->head == NULL) return;
    Node* atual = lista->head;
    Node* anterior = NULL;
    if (atual != NULL && atual->valor == valor) {
        lista->head = atual->proximo;
        free(atual);
        return;
    }
    while (atual != NULL && atual->valor != valor) {
        anterior = atual;
        atual = atual->proximo;
    }
    if (atual == NULL) return;
    anterior->proximo = atual->proximo;
    free(atual);
}

void imprimir_lista(LinkedList* lista) {
    Node* atual = lista->head;
    if (atual == NULL) {
        return;
    }
    while (atual != NULL) {
        printf("%d ", atual->valor);
        atual = atual->proximo;
    }
    printf("\n");
}

void libertar_lista(LinkedList* lista) {
    Node* atual = lista->head;
    Node* proximo_no;
    while (atual != NULL) {
        proximo_no = atual->proximo;
        free(atual);
        atual = proximo_no;
    }
    free(lista);
}