# Projeto de Base de Dados: Sistema de Biblioteca em SQLite

Este repositório contém um conjunto de scripts SQL para criar, popular e consultar uma base de dados de uma biblioteca simples. O projeto foi desenvolvido como parte da cadeira de Análise de Desempenho.

## Estrutura do Projeto

O projeto é composto pelos seguintes ficheiros SQL:

* `criacao.sql`: Contém os comandos `CREATE TABLE` para gerar a estrutura completa da base de dados, incluindo tabelas para Livros, Autores, Categorias, Usuários e Empréstimos.
* `insercao.sql`: Contém os `INSERT`s iniciais para popular a base de dados com um conjunto de dados base.
* `novas_insercoes.sql`: Script adicional que insere mais 15 registos em cada tabela, aumentando o volume de dados para testes.
* `buscas_melhoradas.sql`: Contém as consultas `SELECT` otimizadas e as novas buscas desenvolvidas para a atividade.

## Melhorias Realizadas nas Consultas

Conforme solicitado na atividade, as consultas de busca originais foram otimizadas. A principal melhoria foi a refatoração de todas as consultas para usar a sintaxe explícita `INNER JOIN ... ON ...` em vez da sintaxe implícita mais antiga.

As vantagens desta abordagem são:

* **Clareza do Código:** A separação entre as condições de junção (`ON`) e as condições de filtro (`WHERE`) torna as consultas mais legíveis e fáceis de manter.
* **Prevenção de Erros:** A sintaxe explícita mitiga o risco de produtos cartesianos acidentais, que podem ocorrer se uma condição de junção for omitida na cláusula `WHERE` da sintaxe antiga.
* **Melhor Otimização:** Fornece uma intenção mais clara ao otimizador de consultas da base de dados, o que pode levar a planos de execução mais eficientes.

## Novas Consultas Adicionadas

Além das melhorias, três novas consultas foram criadas para demonstrar funcionalidades práticas:

1.  **Listar livros atualmente emprestados:** Filtra a tabela `Emprestimo` para encontrar registos onde a `Data_Devolucao` é nula.
2.  **Contar livros por autor:** Utiliza `COUNT` e `GROUP BY` para gerar um relatório sobre a quantidade de obras de cada autor na biblioteca.
3.  **Filtrar livros por categoria:** Demonstra como fazer uma busca específica através de tabelas de relacionamento para encontrar todos os livros de um determinado género.

## Como Executar

Para recriar e testar a base de dados:

1.  Aceda a um ambiente SQLite (como o recomendado [SQLite Online](https://sqliteonline.com/)).
2.  **Passo 1:** Copie e cole o conteúdo do `criacao.sql` e execute para criar as tabelas.
3.  **Passo 2:** Execute o conteúdo do `insercao.sql` para adicionar os dados iniciais.
4.  **Passo 3:** Execute o conteúdo do `novas_insercoes.sql` para adicionar os 15 registos extra a cada tabela.
5.  **Passo 4:** Execute os comandos do ficheiro `buscas_melhoradas.sql` individualmente para testar cada consulta.