import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

class Node {
    int valor;
    Node proximo;

    public Node(int valor) {
        this.valor = valor;
        this.proximo = null;
    }
}

class LinkedList {
    Node head;
    int tamanho;

    public LinkedList() {
        this.head = null;
        this.tamanho = 0;
    }

    public void adicionarNo(int valor, int posicao) {
        if (posicao > this.tamanho || posicao < 0) {
            return;
        }

        Node novoNo = new Node(valor);
        this.tamanho++;

        if (posicao == 0) {
            novoNo.proximo = this.head;
            this.head = novoNo;
            return;
        }

        Node atual = this.head;
        int contador = 0;
        while (contador < posicao - 1) {
            atual = atual.proximo;
            contador++;
        }
        novoNo.proximo = atual.proximo;
        atual.proximo = novoNo;
    }

    public void removerNoPorValor(int valor) {
        if (this.head == null) {
            return;
        }

        if (this.head.valor == valor) {
            this.head = this.head.proximo;
            this.tamanho--;
            return;
        }

        Node atual = this.head;
        while (atual.proximo != null && atual.proximo.valor != valor) {
            atual = atual.proximo;
        }

        if (atual.proximo != null) {
            atual.proximo = atual.proximo.proximo;
            this.tamanho--;
        }
    }

    public void imprimirLista() {
        if (this.head == null) {
            return;
        }
        
        StringBuilder sb = new StringBuilder();
        Node atual = this.head;
        while (atual != null) {
            sb.append(atual.valor).append(" ");
            atual = atual.proximo;
        }
        System.out.println(sb.toString().trim());
    }
}

public class Main {
    public static void main(String[] args) {
        if (args.length < 1) {
            System.out.println("Erro: O nome do arquivo de entrada nao foi fornecido.");
            System.out.println("Uso: java Main <nome_do_arquivo>");
            return;
        }

        String nomeArquivo = args[0];
        try {
            File arquivo = new File(nomeArquivo);
            Scanner leitor = new Scanner(arquivo);
            
            LinkedList lista = new LinkedList();

            if (leitor.hasNextLine()) {
                String[] numerosIniciais = leitor.nextLine().trim().split(" ");
                for (String numStr : numerosIniciais) {
                    if (!numStr.isEmpty()) {
                        int num = Integer.parseInt(numStr);
                        // Adicionar no final de forma eficiente para a carga inicial
                        if (lista.head == null) {
                            lista.head = new Node(num);
                        } else {
                            Node atual = lista.head;
                            while(atual.proximo != null) {
                                atual = atual.proximo;
                            }
                            atual.proximo = new Node(num);
                        }
                        lista.tamanho++;
                    }
                }
            }

            int qtdAcoesDeclarada = 0;
            if (leitor.hasNextLine()) {
                qtdAcoesDeclarada = Integer.parseInt(leitor.nextLine().trim());
            }

            int contadorAcoesReais = 0;
            while(leitor.hasNextLine()) {
                contadorAcoesReais++;
                String[] partes = leitor.nextLine().trim().split(" ");
                String acao = partes[0];

                switch(acao) {
                    case "A":
                        int valorA = Integer.parseInt(partes[1]);
                        int posicao = Integer.parseInt(partes[2]);
                        lista.adicionarNo(valorA, posicao);
                        break;
                    case "R":
                        int valorR = Integer.parseInt(partes[1]);
                        lista.removerNoPorValor(valorR);
                        break;
                    case "P":
                        lista.imprimirLista();
                        break;
                    default:
                        System.out.println("Aviso: Acao desconhecida '" + acao + "' na linha " + (contadorAcoesReais + 2) + " (aproximadamente). Ignorando.");
                        break;
                }
            }
            leitor.close();

            if (contadorAcoesReais != qtdAcoesDeclarada) {
                System.out.println("\n--------------------------------------------------");
                System.out.println("AVISO DE INCONSISTENCIA NO ARQUIVO:");
                System.out.println("-> Acoes declaradas na linha 2: " + qtdAcoesDeclarada);
                System.out.println("-> Acoes realmente processadas: " + contadorAcoesReais);
                System.out.println("--------------------------------------------------");
            }

        } catch (FileNotFoundException e) {
            System.out.println("Erro: Nao foi possivel abrir o arquivo '" + nomeArquivo + "'");
        }
    }
}