INSERT INTO Medicos(NomeMedico, Email, CRM)
VALUES
('Dr. Mark Sloan', 'sloan@gmail.com', 20191144),
('Dr. Derek Shepherd', 'derek@hotmail.com', 20202255),
('Dr. Jackson Avery', 'avery@gmail.com', 20213366),
('Dr. Alex Karev', 'alex@gmail.com', 20224477)
SELECT * FROM Medicos

INSERT INTO Pacientes(NomePaciente, Email)
VALUES
('Sara', 'sara@gmail.com'),
('Rivaldo', 'junior@gmail.com'),
('Rosineide', 'seixas@gmail.com'),
('Francisco', 'francisco@hotmail.com')
SELECT * FROM Pacientes

INSERT INTO Consultas(CodMedico, CodPaciente, DataConsulta, Observacoes)
VALUES
(1, 1, '20220801 11:20', 'OK'),
(2, 2, '20220711 12:00', 'Problema'),
(3, 3, '20220401 09:40', 'Infectado'),
(4, 4, '20220731 23:20', 'Positivo para covid-19'),
(1, 4, '20220810 10:00', 'Gengiva Inflamada'),
(2, 2, '20220802 00:00', 'OK')
SELECT * FROM Consultas

UPDATE Consultas SET DataConsulta = '20220801 11:20'
WHERE CodConsulta = 14
--MUDAR DADOS INSERIDOS

--2 COMANDO SELECT:

SELECT -- ¹Liste os campos que quer exibir
Consultas.CodConsulta,
Consultas.DataConsulta,
Medicos.CRM,
Medicos.NomeMedico,
Pacientes.NomePaciente
FROM Consultas INNER JOIN Medicos -- ²Se a relação entre as tabelas usa o INNER JOIN
ON Consultas.CodMedico = Medicos.CodMedico
INNER JOIN Pacientes
ON Consultas.CodPaciente = Pacientes.CodPaciente

--3
SELECT
Medicos.NomeMedico,
COUNT(Consultas.CodConsulta) AS QuantidadeConsultasPorMedico
FROM Medicos INNER JOIN Consultas
ON Medicos.CodMedico = Consultas.CodMedico --Chave de ligação
GROUP BY Medicos.NomeMedico

--4
SELECT
Pacientes.NomePaciente,
COUNT(Consultas.CodConsulta) AS QuantidadeConsultasPorPaciente
FROM Pacientes INNER JOIN Consultas
ON Pacientes.CodPaciente = Consultas.CodPaciente
GROUP BY Pacientes.NomePaciente

--5
SELECT
DataConsulta,
COUNT(CodConsulta) AS Quantidade
FROM Consultas
WHERE DataConsulta BETWEEN '20220101 00:00:00' AND '20220801 23:59:00'
GROUP BY DataConsulta

--6
SELECT
Pacientes.NomePaciente,
Consultas.DataConsulta,
Consultas.Observacoes
FROM Pacientes INNER JOIN Consultas
ON Pacientes.CodPaciente = Consultas.CodPaciente
INNER JOIN Medicos
ON Consultas.CodMedico = Medicos.CodMedico
WHERE Consultas.DataConsulta BETWEEN '20220115 00:00:00' AND '20220801 23:59:00'
AND Medicos.NomeMedico LIKE '%Dr. Mark Sloan'
ORDER BY Pacientes.NomePaciente