CREATE VIEW VW_Funcionarios_informacao AS
SELECT
	FDP.ID_Funcionario,
	FDP.Matricula_Funcionario,
	FDP.Nome_Funcionario,
	FDP.Sobrenome_Funcionario,
	FDE.Data_Admissao_Funcionario,
	FDE.Ctps_Funcionario,
	FDP.Sexo_Funcionario,
	FDP.Datanasc_Funcionario,
	FDP.Email_Funcionario,
	FDP.Situacao
FROM Funcionario_Dados_Pessoais AS FDP INNER JOIN
     Funcionarios_Dados_Empresa AS FDE ON FDP.Matricula_Funcionario = FDE.Matricula_Funcionario
WHERE (FDP.Situacao = 1)
