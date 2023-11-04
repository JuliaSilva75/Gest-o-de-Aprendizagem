subconsultas:

-- 1. Acessando todos os dados da tabela Professor
SELECT * from Professor 

-- 2. Consultado a tabela e Inscricao junto com a Endereco
SELECT e.ID_Endereco, e.Regiao, i.Nome_completo
FROM endereco e
LEFT JOIN inscricao i ON e.ID_Endereco = i.Nome_completo;

-- 2. Consultado apenas curso que a data de termino seja em 2023 ou a partir desse ano
select Nome_curso, Data_Termino from curso where Data_Termino >= 2023

-- 3. Apresentando dados de duas tabelas
SELECT A.Materia, P.Nome_Prof, P. ID_Professor
FROM aula A
JOIN professor P ON P.ID_professor = P.ID_Professor;

--4. Professoras com o nome Maria
SELECT ID_Professor, Nome_Prof from Professor where Nome_Prof like "%Maria%";

--5 Colocando em ordem 
SELECT Nome_completo,Data_nascimento from inscricao where Data_nascimento >= 1985 order by Data_nascimento ASC;