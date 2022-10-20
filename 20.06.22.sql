INSERT INTO Produtos(Nome, Preco, Quantidade)
VALUES
       ('Monitor', 1500, 20),
       ('Impressora', 500, 50),
       ('Mouse', 50, 200),
       ('Pen-drive', 70, 100),
       ('Celular', 2500, 10),
       ('Teclado', 150, 80)

SELECT * FROM Produtos

SELECT Codigo, Nome, Preco, Quantidade
FROM Produtos
ORDER BY Preco DESC
SELECT Codigo, Nome, Preco, Quantidade
From Produtos
ORDER BY Preco DESC

SELECT COUNT (*) AS QuantidadeRegistros
From Produtos
Where Preco > 1000

DELETE FROM Produtos WHERE Codigo > 6

SELECT AVG(Preco) AS QuantidadeRegistros
FROM Produtos

SELECT 
    MAX(Preco) AS MaisCaro,
	MIN(Preco) AS MaisBarato
FROM Produtos

SELECT SUM(Preco) AS QuantidadeRegistros
FROM Produtos

SELECT * FROM Produtos
WHERE Nome LIKE 'M%'
   OR Nome LIKE 'T%'

SELECT * FROM Produtos
WHERE Preco >= 1000
  AND Preco <= 3000

SELECT * FROM Produtos
WHERE Codigo IN (1, 3, 5)