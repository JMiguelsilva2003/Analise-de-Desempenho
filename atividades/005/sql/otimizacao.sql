-- Cria um índice na coluna ID_Autor da tabela Livro
CREATE INDEX idx_livro_id_autor ON Livro(ID_Autor);

-- Cria um índice na coluna ID_Livro da tabela Emprestimo
CREATE INDEX idx_emprestimo_id_livro ON Emprestimo(ID_Livro);

-- Cria um índice na coluna ID_Usuario da tabela Emprestimo
CREATE INDEX idx_emprestimo_id_usuario ON Emprestimo(ID_Usuario);

-- Cria um índice na coluna ID_Categoria da tabela de ligação Livro_Categoria
CREATE INDEX idx_livro_categoria_id_categoria ON Livro_Categoria(ID_Categoria);

-- Cria um índice na coluna Nome da tabela Categoria
CREATE INDEX idx_categoria_nome ON Categoria(Nome);

-- Cria um índice nos títulos dos livros
CREATE INDEX idx_livro_titulo ON Livro(Titulo);