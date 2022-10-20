INSERT INTO Correntista(Nome, DataCriacao, SaldoFinanceiro) VALUES
('Sara', '20220824 23:55', 500),
('Junior', '20220829 10:55', 5000),
('Rose', '20220901 10:55', 10000),
('Alice', '20220910 09:00', 0)
SELECT * FROM Correntista

INSERT INTO Movimentacao(TipoMovimentacao, IdCorrentista, Valor, DataDaMovimentacao)
	VALUES
('C', 1, 200, '20221009 00:00'),
('C', 1, 500, '20221009 00:00'),
('D', 4, 900, '20221029 06:00'),
('C', 2, 100, '20221031 09:00'),
('D', 3, 500, '20221009 00:00')
SELECT * FROM Movimentacao
GO

-- 01 Crie uma visão que exiba as movimentações de um correntista, mostrando o
-- tipo da movimentação (quando for D, mostrar a palavra Débito, quando for C, 
-- mostrar a palavra Crédito), o valor da movimentação e a data da movimentação
-- e o nome do correntista.
CREATE VIEW vwQuestao01
AS
SELECT
Correntista.Nome,
Movimentacao.IdCorrentista,
CASE
WHEN Movimentacao.TipoMovimentacao = 'D' THEN 'Débito'
ELSE 'Crédito'
END TipoDeMovimentacao
FROM Correntista INNER JOIN Movimentacao
ON Correntista.IdCorrentista = Movimentacao.IdCorrentista
GO

-- 02 Crie uma visão que mostrar o maior e o menor valor de movimentação de um
-- correntista, exibindo também no nome do correntista.
CREATE VIEW vwQuestao02
AS
SELECT
Correntista.Nome,
MAX (Movimentacao.Valor) AS MaiorValor,
MIN (Movimentacao.Valor) AS MenorValor
FROM Correntista INNER JOIN Movimentacao
ON Correntista.IdCorrentista = Movimentacao.Idcorrentista
GROUP BY Correntista.Nome
GO

-- 03 Crie uma visão que exiba o nome do correntista e o saldo apenas dos
-- correntistas que tem saldo maior do que R$ 5.000,00.
CREATE VIEW vwQuestao03
AS
SELECT * FROM Correntista
WHERE SaldoFinanceiro > 5000
GO

-- 04 Criar um gatilho (trigger) para quando for inserido uma movimentação o 
-- campo SaldoFinanceiro na tabela correntista seja atualizado.
CREATE TRIGGER tiCorrentista ON Correntista
AFTER INSERT
AS
BEGIN
