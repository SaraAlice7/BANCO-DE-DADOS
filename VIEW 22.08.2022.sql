INSERT INTO MiniCursos (NomeMiniCurso, CargaHoraria) VALUES
	('POO', 80),
	('HTML5', 120),
	('Produ��o de textos', 40);
GO
SELECT * FROM MiniCursos;
GO

INSERT INTO Alunos (NomeAluno, NotaFinal, CodMiniCurso) VALUES
	('Marcelo', 80, 1),
	('Joao', 90, 1),
	('Maria', 100, 2),
	('Felipe', 100, 3);
GO
SELECT * FROM Alunos;
GO

-- 01 Crie uma View que mostre a quantidade de alunos por curso,
-- exibindo o nome do minicurso e a quantidade de alunos.
CREATE VIEW vwQuestao01
AS
SELECT
	MiniCursos.NomeMiniCurso,
COUNT(Alunos.Matricula) AS QuantidadeAlunos
FROM MiniCursos INNER JOIN Alunos
ON MiniCursos.CodMiniCurso = Alunos.CodMiniCurso
GROUP BY MiniCursos.NomeMiniCurso;
GO

-- 02. Crie uma View que mostre a matricula do aluno, o nome do aluno, o nome do minicurso e a nota final.
-- Mostre tamb�m uma coluna chamada situa��o,sabendo que se o aluno tiver nota final maior ou igual a 60 
-- ele est� APROVADO, caso contr�rio, REPROVADO
CREATE VIEW vwQuestao02
AS
SELECT
	Alunos.Matricula,
	Alunos.NomeAluno,
	MiniCursos.NomeMiniCurso,
	Alunos.NotaFinal,
	CASE
	WHEN Alunos.NotaFinal >= 60 THEN 'Aprovado'
	ELSE 'R�provado' 
	END AS Situacao
FROM Alunos INNER JOIN MiniCursos
ON Alunos.CodMiniCurso = MiniCursos.CodMiniCurso;
GO

-- 03. Crie tamb�m um Trigger que garante que s� pode haver, no m�ximo, 10 alunos por minicurso.

CREATE TRIGGER tiAlunos2 ON Alunos
AFTER INSERT 
AS
BEGIN
SET NOCOUNT ON;
IF EXISTS (SELECT * FROM vwQuestao01 WHERE QuantidadeAlunos > 10)
BEGIN
RAISERROR ('Cada mini-curso deve ter, no m�ximo, 10 alunos.', 16, 1);
ROLLBACK TRANSACTION;
END
END