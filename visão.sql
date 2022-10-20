CREATE VIEW vwListarConsultas
AS
SELECT
Consultas.CodConsulta,
Consultas.DataConsulta,
Medicos.CRM,
Medicos.NomeMedico,
Pacientes.Nome
FROM Consultas INNER JOIN Medicos
ON Consultas.CodMedico = Medicos.CodMedico
INNER JOIN Pacientes
ON Consultas.CodPaciente = Pacientes.CodPaciente

GO

CREATE VIEW vwQuantidadeConsultasPorMedico
AS
SELECT
Medicos.NomeMedico,
COUNT(Consultas.CodConsulta) AS Quantidade
FROM Medicos INNER JOIN Consultas
ON Medicos.CodMedico = Consultas.CodMedico
GROUP BY Medicos.NomeMedico