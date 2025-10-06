-- Inserção de 15 novos Autores
INSERT INTO Autor (ID_Autor, Nome, Data_Nascimento) VALUES
(4, 'Isaac Asimov', '1920-01-02'),
(5, 'Arthur C. Clarke', '1917-12-16'),
(6, 'Stephen King', '1947-09-21'),
(7, 'Agatha Christie', '1890-09-15'),
(8, 'Frank Herbert', '1920-10-08'),
(9, 'Philip K. Dick', '1928-12-16'),
(10, 'Ursula K. Le Guin', '1929-10-21'),
(11, 'Neil Gaiman', '1960-11-10'),
(12, 'Terry Pratchett', '1948-04-28'),
(13, 'Douglas Adams', '1952-03-11'),
(14, 'Jane Austen', '1775-12-16'),
(15, 'Mark Twain', '1835-11-30'),
(16, 'Mary Shelley', '1797-08-30'),
(17, 'Edgar Allan Poe', '1809-01-19'),
(18, 'H.P. Lovecraft', '1890-08-20');

-- Inserção de 15 novas Categorias
INSERT INTO Categoria (ID_Categoria, Nome) VALUES
(4, 'Romance'),
(5, 'Mistério'),
(6, 'Terror'),
(7, 'Humor'),
(8, 'História'),
(9, 'Biografia'),
(10, 'Poesia'),
(11, 'Clássico'),
(12, 'Distopia'),
(13, 'Suspense'),
(14, 'Não-Ficção'),
(15, 'Infantojuvenil'),
(16, 'Drama'),
(17, 'Gótico'),
(18, 'Cosmicismo');

-- Inserção de 15 novos Usuários
INSERT INTO Usuario (ID_Usuario, Nome, Email) VALUES
(4, 'David', 'david@example.com'),
(5, 'Eve', 'eve@example.com'),
(6, 'Frank', 'frank@example.com'),
(7, 'Grace', 'grace@example.com'),
(8, 'Heidi', 'heidi@example.com'),
(9, 'Ivan', 'ivan@example.com'),
(10, 'Judy', 'judy@example.com'),
(11, 'Mallory', 'mallory@example.com'),
(12, 'Niaj', 'niaj@example.com'),
(13, 'Oscar', 'oscar@example.com'),
(14, 'Peggy', 'peggy@example.com'),
(15, 'Rupert', 'rupert@example.com'),
(16, 'Sybil', 'sybil@example.com'),
(17, 'Trent', 'trent@example.com'),
(18, 'Victor', 'victor@example.com');

-- Inserção de 15 novos Livros
INSERT INTO Livro (ID_Livro, Titulo, ID_Autor, Ano_Publicacao) VALUES
(4, 'Eu, Robô', 4, 1950),
(5, '2001: Uma Odisseia no Espaço', 5, 1968),
(6, 'O Iluminado', 6, 1977),
(7, 'Assassinato no Expresso do Oriente', 7, 1934),
(8, 'Duna', 8, 1965),
(9, 'Androides Sonham com Ovelhas Elétricas?', 9, 1968),
(10, 'O Feiticeiro de Terramar', 10, 1968),
(11, 'Deuses Americanos', 11, 2001),
(12, 'Bons Augúrios', 12, 1990),
(13, 'O Guia do Mochileiro das Galáxias', 13, 1979),
(14, 'Orgulho e Preconceito', 14, 1813),
(15, 'As Aventuras de Tom Sawyer', 15, 1876),
(16, 'Frankenstein', 16, 1818),
(17, 'O Corvo', 17, 1845),
(18, 'O Chamado de Cthulhu', 18, 1928);

-- Inserção de 15 novas relações Livro_Categoria
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES
(4, 2), (5, 2), (6, 6), (7, 5), (8, 2), (8, 1),
(9, 2), (9, 12), (10, 1), (11, 1), (11, 12), (12, 1),
(12, 7), (13, 2), (13, 7), (14, 4), (14, 11), (15, 3),
(15, 11), (16, 6), (16, 11), (16, 17), (17, 10), (17, 17),
(18, 6), (18, 18);

-- Inserção de 15 novos Empréstimos
INSERT INTO Emprestimo (ID_Emprestimo, ID_Livro, ID_Usuario, Data_Emprestimo, Data_Devolucao) VALUES
(4, 4, 4, '2024-07-11', '2024-07-20'),
(5, 5, 5, '2024-07-12', NULL),
(6, 6, 6, '2024-07-13', '2024-07-25'),
(7, 7, 7, '2024-07-14', NULL),
(8, 8, 8, '2024-07-15', '2024-08-01'),
(9, 9, 9, '2024-07-16', NULL),
(10, 10, 10, '2024-07-17', '2024-07-30'),
(11, 11, 11, '2024-07-18', NULL),
(12, 12, 12, '2024-07-19', '2024-08-05'),
(13, 13, 13, '2024-07-20', NULL),
(14, 14, 14, '2024-07-21', '2024-08-10'),
(15, 15, 15, '2024-07-22', NULL),
(16, 16, 1, '2024-07-23', '2024-08-15'),
(17, 17, 2, '2024-07-24', NULL),
(18, 18, 3, '2024-07-25', NULL);