--PROBLEMAS COM O FORMATO DA COLUNA MATRICULA, DEVERIA SER BIGINT PARA PERMITIR ASSOCIAÇÃO ENTRE FUNCIONARIO_DADOS_PESSOAIS E FUNCIONARIO_DADOS_EMPRESA.
--CRIAR UMA NOVA TABELA, E IMPORTAR OS DADOS DO FUNCIONARIO, ANTES DE IMPORTAR DADOS_EMPRESA.

CREATE TABLE Funcionario_Dados_Pessoais(
	ID_Funcionario bigint NOT NULL,
	Matricula_Funcionario bigint NOT NULL,
	Nome_Funcionario varchar(50) NOT NULL,
	Sobrenome_Funcionario varchar(50) NOT NULL,
	Sexo_Funcionario char(1) NOT NULL,
	Datanasc_Funcionario datetime NOT NULL,
	Email_Funcionario varchar(MAX) NOT NULL,
	ID_Pais int NOT NULL,
	Situacao bit NULL default 1,
	DataInclusao datetime NULL default getdate(),
	DataAlteracao datetime NULL,
	DataExclusao datetime NULL,
	CONSTRAINT PK_FuncDadosPessoais PRIMARY KEY (ID_Funcionario)
)
GO

--IMPORTANDO DADOS PARA A NOVA TABELA.
--ATENÇÃO A CONVERSÃO DE DADOS REALIZADA PARA MATRICULA.

INSERT INTO Funcionario_Dados_Pessoais(
	ID_Funcionario, 
	Matricula_Funcionario, 
	Nome_Funcionario,
	Sobrenome_Funcionario,
	Sexo_Funcionario,
	Datanasc_Funcionario,
	Email_Funcionario,
	ID_Pais,
	Situacao,
	DataInclusao,
	DataAlteracao,
	DataExclusao)
		SELECT 
			ID_Funcionario, 
			CONVERT(BIGINT, Matricula_Funcionario) AS Matricula_Funcionario, 
			Nome_Funcionario, 
			Sobrenome_Funcionario, 
			Sexo_Funcionario, 
			Datanasc_Funcionario, 
			Email_Funcionario, 
			ID_Pais, 
			Situacao, 
			DataInclusao, 
			DataAlteracao, 
			DataExclusao
		FROM Funcionario

--CRIANDO TABELA FUNCIONARIO_DADOS_EMPRESA
CREATE TABLE Funcionarios_Dados_Empresa(
	ID_FuncDadosEmpresa BIGINT NOT NULL IDENTITY(1,1),
	Matricula_Funcionario bigint NOT NULL,
	Nome_Funcionario varchar(50) NOT NULL,
	Sobrenome_Funcionario varchar(50) NOT NULL,
	Data_Admissao_Funcionario datetime NOT NULL,
	Ctps_Funcionario varchar(50) NOT NULL,
	Ctps_Num_Funcionario bigint NOT NULL,
	Ctps_Serie_Funcionario int NOT NULL,
	Situacao bit NULL default 1,
	DataInclusao datetime NULL default getdate(),
	DataAlteracao datetime NULL,
	DataExclusao datetime NULL,	
	CONSTRAINT PK_FuncDadosEmpresa PRIMARY KEY (ID_FuncDadosEmpresa)
) ON PRIMARY
GO

--IMPORTAR OS DADOS PARA A TABELA FINAL.

INSERT INTO Funcionarios_Dados_Empresa(
	Matricula_Funcionario,
	Nome_Funcionario,
	Sobrenome_Funcionario,
	Data_Admissao_Funcionario,
	Ctps_Funcionario,
	Ctps_Num_Funcionario,
	Ctps_Serie_Funcionario
)
SELECT 
	chave, 
	nome, 
	sobrenome, 
	convert(datetime, dataadmissao) AS dataadmissao, 
	ctps, 
	ctpsnum, 
	ctpsserie
FROM RAW_DATA_Funcionarios_Dados_Empresa



