SELECT
    A.Nome,
    L.Titulo
FROM Livro AS L
INNER JOIN Autor AS A ON L.ID_Autor = A.ID_Autor;

SELECT
    E.ID_Emprestimo,
    U.Nome
FROM Emprestimo AS E
INNER JOIN Usuario AS U ON E.ID_Usuario = U.ID_Usuario;

SELECT
    L.Titulo,
    C.Nome AS Categoria
FROM Livro AS L
INNER JOIN Livro_Categoria AS LC ON L.ID_Livro = LC.ID_Livro
INNER JOIN Categoria AS C ON LC.ID_Categoria = C.ID_Categoria;

SELECT
    L.Titulo,
    U.Nome AS Nome_Usuario
FROM Emprestimo AS E
INNER JOIN Livro AS L ON E.ID_Livro = L.ID_Livro
INNER JOIN Usuario AS U ON E.ID_Usuario = U.ID_Usuario;

SELECT
    L.Titulo,
    U.Nome AS Emprestado_Para,
    E.Data_Emprestimo
FROM Emprestimo AS E
INNER JOIN Livro AS L ON E.ID_Livro = L.ID_Livro
INNER JOIN Usuario AS U ON E.ID_Usuario = U.ID_Usuario
WHERE E.Data_Devolucao IS NULL;

SELECT
    A.Nome,
    COUNT(L.ID_Livro) AS Quantidade_De_Livros
FROM Autor AS A
LEFT JOIN Livro AS L ON A.ID_Autor = L.ID_Autor
GROUP BY A.Nome
ORDER BY Quantidade_De_Livros DESC;

SELECT
    L.Titulo,
    A.Nome AS Autor
FROM Livro AS L
INNER JOIN Autor AS A ON L.ID_Autor = A.ID_Autor
INNER JOIN Livro_Categoria AS LC ON L.ID_Livro = LC.ID_Livro
INNER JOIN Categoria AS C ON LC.ID_Categoria = C.ID_Categoria
WHERE C.Nome = 'Ficção Científica';