import sys

class Node:
    def __init__(self, valor):
        self.valor = valor
        self.proximo = None

class LinkedList:
    def __init__(self):
        self.head = None
        self.tamanho = 0

    def adicionar_no(self, valor, posicao):
        if posicao > self.tamanho or posicao < 0:
            return

        novo_no = Node(valor)
        self.tamanho += 1

        if posicao == 0:
            novo_no.proximo = self.head
            self.head = novo_no
            return

        atual = self.head
        contador = 0
        while contador < posicao - 1:
            atual = atual.proximo
            contador += 1
        
        novo_no.proximo = atual.proximo
        atual.proximo = novo_no

    def remover_no_por_valor(self, valor):
        if self.head is None:
            return

        if self.head.valor == valor:
            self.head = self.head.proximo
            self.tamanho -= 1
            return

        atual = self.head
        while atual.proximo is not None and atual.proximo.valor != valor:
            atual = atual.proximo

        if atual.proximo is not None:
            atual.proximo = atual.proximo.proximo
            self.tamanho -= 1

    def imprimir_lista(self):
        if self.head is None:
            return
        
        elementos = []
        atual = self.head
        while atual is not None:
            elementos.append(str(atual.valor))
            atual = atual.proximo
        print(" ".join(elementos))

def main():
    if len(sys.argv) < 2:
        print("Erro: O nome do arquivo de entrada nao foi fornecido.")
        print(f"Uso: python3 {sys.argv[0]} <nome_do_arquivo>")
        return

    nome_arquivo = sys.argv[1]
    
    try:
        with open(nome_arquivo, 'r') as arquivo:
            lista = LinkedList()

            primeira_linha = arquivo.readline()
            numeros_iniciais = map(int, primeira_linha.strip().split())
            
            no_final = None
            for num in numeros_iniciais:
                novo = Node(num)
                if lista.head is None:
                    lista.head = novo
                    no_final = novo
                else:
                    no_final.proximo = novo
                    no_final = novo
                lista.tamanho += 1

            linha_qtd_acoes = arquivo.readline()
            qtd_acoes_declarada = int(linha_qtd_acoes.strip())
            
            contador_acoes_reais = 0
            for linha in arquivo:
                contador_acoes_reais += 1
                partes = linha.strip().split()
                acao = partes[0]

                if acao == 'A':
                    valor = int(partes[1])
                    posicao = int(partes[2])
                    lista.adicionar_no(valor, posicao)
                elif acao == 'R':
                    valor = int(partes[1])
                    lista.remover_no_por_valor(valor)
                elif acao == 'P':
                    lista.imprimir_lista()
                else:
                    print(f"Aviso: Acao desconhecida '{acao}' na linha {contador_acoes_reais + 2} (aproximadamente). Ignorando.")

            if contador_acoes_reais != qtd_acoes_declarada:
                print("\n--------------------------------------------------")
                print("AVISO DE INCONSISTENCIA NO ARQUIVO:")
                print(f"-> Acoes declaradas na linha 2: {qtd_acoes_declarada}")
                print(f"-> Acoes realmente processadas: {contador_acoes_reais}")
                print("--------------------------------------------------")

    except FileNotFoundError:
        print(f"Erro: Nao foi possivel abrir o arquivo '{nome_arquivo}'")

if __name__ == "__main__":
    main()