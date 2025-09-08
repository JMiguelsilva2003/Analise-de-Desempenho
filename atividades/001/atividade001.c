#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <time.h>
#include <errno.h>
#include <string.h>

int main() {
    int n;
    long long int numero_lido;
    char buffer[256]; 

    while (true) {
        printf("Digite um numero inteiro N > 0: ");
        
        if (fgets(buffer, sizeof(buffer), stdin) == NULL) {
            printf("Erro ao ler a entrada. Tente novamente.\n");
            continue;
        }
        
        buffer[strcspn(buffer, "\n")] = 0;

        char *endptr;
        errno = 0;

        numero_lido = strtoll(buffer, &endptr, 10);

        if (endptr == buffer || *endptr != '\0' || errno == ERANGE) {
            printf("Entrada invalida! Por favor, digite apenas um numero inteiro valido.\n");
            continue;
        }
        
        if (numero_lido <= 0) {
            printf("Entrada invalida! O numero deve ser maior que 0.\n");
            continue;
        }

        n = (int)numero_lido;
        if (numero_lido != n) {
            printf("Entrada invalida! O numero e muito grande para este programa.\n");
            continue;
        }
        break;
    }

    clock_t inicio = clock();

    bool* primos = (bool*) malloc((n + 1) * sizeof(bool));
    if (primos == NULL) {
        printf("Erro: Falha ao alocar memoria.\n");
        return 1;
    }

    for (int i = 0; i <= n; i++) {
        primos[i] = true;
    }
    primos[0] = false;
    primos[1] = false;

    for (int p = 2; p * p <= n; p++) {
        if (primos[p] == true) {
            for (int i = p * p; i <= n; i += p) {
                primos[i] = false;
            }
        }
    }

    clock_t fim = clock();
    double tempo_execucao = ((double)(fim - inicio)) / CLOCKS_PER_SEC;

    printf("\n----------------------------------------\n");
    printf("O valor de N e: %d\n", n);
    
    printf("Os numeros primos encontrados sao:\n");
    int contagem_primos = 0;
    for (int p = 2; p <= n; p++) {
        if (primos[p]) {
            printf("%d ", p);
            contagem_primos++;
        }
    }
    
    printf("\n\n"); 
    printf("A quantidade de numeros primos encontrados e: %d\n", contagem_primos);
    printf("Tempo de execucao do calculo: %f segundos\n", tempo_execucao);
    printf("----------------------------------------\n");

    free(primos);

    return 0;
}