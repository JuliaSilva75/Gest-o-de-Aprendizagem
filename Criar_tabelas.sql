-- USE Gestao_aprendizagem;

--  if not exists (criar tabela se não existir)
-- Tabela Endereco 
Create Table if not exists Endereco(
ID_Endereco INT(4) Primary Key auto_increment,
Estado Varchar(2) Not null,
Regiao Varchar(80) Not null,
CEP INT(8) Not null
);

insert INTO gestao_aprendizagem.Endereco (Estado, Regiao, CEP) VALUES ('SP','Zona Leste' ,05780360 );
Insert INTO gestao_aprendizagem.Endereco (Estado, Regiao, CEP) VALUES ('SP', 'Zona Norte', 02010010);
Insert INTO gestao_aprendizagem.Endereco (Estado, Regiao, CEP) VALUES ('SP', 'Zona Sul', 04578020);
Insert INTO gestao_aprendizagem.Endereco (Estado, Regiao, CEP) VALUES ('SP', 'Zona Leste', 03254015);
Insert INTO gestao_aprendizagem.Endereco (Estado, Regiao, CEP) VALUES ('SP', 'Zona Leste', 05530000);
Insert INTO gestao_aprendizagem.Endereco (Estado, Regiao, CEP) VALUES ('SP', 'Centro', 01010020);

-- Tabela Professor 
create table  if not exists Professor (
ID_Professor INT(4) Primary Key auto_increment,
Nome_Prof Varchar(70) not null,
Email_Educador Varchar(70) unique,
Senha varchar(70) not null
);

INSERT INTO gestao_aprendizagem.Professor (Nome_Prof, Email_Educador, Senha) VALUES ('Maria Silva Souza', 'maria.souza@email.com', 'mariasilva123');
INSERT INTO gestao_aprendizagem.Professor (Nome_Prof, Email_Educador, Senha) VALUES ('Pedro Oliveira Lima', 'pedro.lima@email.com', 'pedrolima456');
INSERT INTO gestao_aprendizagem.Professor (Nome_Prof, Email_Educador, Senha) VALUES ('Ana Pereira Santos', 'ana.santos@email.com', 'anasantos789');
INSERT INTO gestao_aprendizagem.Professor (Nome_Prof, Email_Educador, Senha) VALUES ('Carlos Rodrigues Gomes', 'carlos.gomes@email.com', 'carlos1234');
INSERT INTO gestao_aprendizagem.Professor (Nome_Prof, Email_Educador, Senha) VALUES ('Isabela Ferreira Costa', 'isabela.costa@email.com', 'isabela5678');

-- Tabela Inscricao
Create table if not exists Inscricao(
ID_Inscricao INT auto_increment,
Genero Varchar(10) not null,
DDD_Telefone INT not null,
Nome_completo Varchar(70) not null,
Data_nascimento date not null,
Documento_CPF INT not null,
Email Varchar(70) not null,
Senha Varchar(40) not null,
ID_Endereco INT,
PRIMARY KEY (ID_Inscricao),
FOREIGN KEY (ID_Endereco) REFERENCES Endereco(ID_Endereco)
);

-- deletando para adicionar como Varchar
alter table Inscricao
Drop column Documento_CPF;

-- Adicionando coluna na tabela curso 
Alter table Inscricao
ADD column Documento_CPF Varchar(11) not null;

INSERT INTO gestao_aprendizagem.Inscricao (Genero, DDD_Telefone, Nome_Completo, Data_nascimento, Documento_CPF, Email, Senha) VALUES ('Masculino', '11', 'Mariana Oliveira', '1985-07-10', '986543091', 'mariana.oliveira@email.com', 'mariana5678');
INSERT INTO gestao_aprendizagem.Inscricao (Genero, DDD_Telefone, Nome_Completo, Data_nascimento, Documento_CPF, Email, Senha) VALUES ('Feminino', '13', 'Pedro Santos', '1990-04-25', '123478909', 'pedro.santos@email.com', 'pedrosantos123');
INSERT INTO gestao_aprendizagem.Inscricao (Genero, DDD_Telefone, Nome_Completo, Data_nascimento, Documento_CPF, Email, Senha) VALUES ('Masculino', '19', 'Maria Oliveira', '1988-12-15', '987654101', 'maria.oliveira@email.com', 'maria123456');
INSERT INTO gestao_aprendizagem.Inscricao (Genero, DDD_Telefone, Nome_Completo, Data_nascimento, Documento_CPF, Email, Senha) VALUES ('Feminino', '14', 'João Silva', '1995-06-20', '765430987', 'joao.silva@email.com', 'joaosilva5678');
INSERT INTO gestao_aprendizagem.Inscricao (Genero, DDD_Telefone, Nome_Completo, Data_nascimento, Documento_CPF, Email, Senha) VALUES ('Masculino', '16', 'Camila Rodrigues', '1982-11-05', '55555555', 'camila.rodrigues@email.com', 'camila2023');
INSERT INTO gestao_aprendizagem.Inscricao (Genero, DDD_Telefone, Nome_Completo, Data_nascimento, Documento_CPF, Email, Senha) VALUES ('Feminino', '17', 'Rafael Pereira', '1997-08-30', '888888881', 'rafael.pereira@email.com', 'rafael2023');

-- Tabela Aluno
create table if not exists Aluno ( 
ID_Aluno INT Primary key auto_increment,
ID_Inscricao INT,
foreign key (ID_Inscricao) references Inscricao(ID_Inscricao)
);

-- Tabela Login
create table if not exists Login(
ID_login INT Primary Key auto_increment,
ID_Aluno INT,
Foreign key(ID_Aluno) references Aluno(ID_Aluno),
Senha Varchar(70),
ID_Inscricao INT,
foreign Key (ID_inscricao) references  Inscricao(ID_Inscricao)
);

insert INTO gestao_aprendizagem.Login (Senha) values ('1212liud');
INSERT INTO gestao_aprendizagem.Login (Senha) VALUES ('senha123');
INSERT INTO gestao_aprendizagem.Login (Senha) VALUES ('novasenha456');
INSERT INTO gestao_aprendizagem.Login (Senha) VALUES ('senha2023');
INSERT INTO gestao_aprendizagem.Login (Senha) VALUES ('minhasenha567');
INSERT INTO gestao_aprendizagem.Login (Senha) VALUES ('senhadiferente');

-- Tabela Curso
create table if not exists Curso(
ID_Curso INT(4) primary key,
Nome_curso Varchar(30) Unique,
Data_inicio Date not null,
Data_Termino Date not null, 
ID_Professor INT,
foreign key  (ID_Professor) references Professor(ID_Professor)
);

insert Into gestao_aprendizagem.Curso (Nome_curso,Data_inicio,Data_Termino) values ('Inglês','2023-01-21','2025-12-21');
insert Into gestao_aprendizagem.Curso (Nome_curso,Data_inicio,Data_Termino) values ('francês','2022-02-01','2024-12-21');
insert Into gestao_aprendizagem.Curso (Nome_curso,Data_inicio,Data_Termino) values ('Italiano','2023-01-21','2025-12-21');


-- Excluindo coluna ID_Curso
alter table curso
Drop column ID_Curso;

-- Adicionando coluna na tabela curso 
Alter table Curso
ADD column ID_Aluno INT,
ADD foreign key (ID_Aluno) references Aluno(ID_Aluno);

-- Criando uma nova coluna e adicionando auto_increment
alter table Curso
ADD column ID_Novo INT auto_increment,
ADD Primary key (ID_Novo);


-- Renomeando  a coluna 
alter table Curso
change column ID_Novo ID_Curso INT auto_increment;

-- Tabela Aula
create table if not exists Aula(
ID_aula INT primary key auto_increment,
Materia Varchar(70) not null,
ID_Professor INT,
foreign key  (ID_Professor) references Professor(ID_Professor),
ID_Curso INT,
Foreign Key (ID_Curso) references Curso(ID_Curso),
ID_Aluno INT,
foreign key (ID_Aluno) references Aluno(ID_Aluno)

);

insert Into gestao_aprendizagem.Aula (Materia) values ('Francês');
insert Into gestao_aprendizagem.Aula (Materia) values ('Inglês');
insert Into gestao_aprendizagem.Aula (Materia) values ('Italiano');

-- TAbela feedback

 Create table if not exists Feedback (
ID_feedback INT primary key auto_increment,
Nota INT(1),
Comentarios Varchar(1000),
ID_Curso INT,
Foreign Key (ID_Curso) references Curso(ID_Curso),
ID_Aluno INT,
foreign key (ID_Aluno) references Aluno(ID_Aluno)

);

insert into gestao_aprendizagem.Feedback(Nota,Comentarios) values (5 ,'Bom curso');
insert into gestao_aprendizagem.Feedback(Nota,Comentarios) values (4 ,'otimo aprendizado');
insert into gestao_aprendizagem.Feedback(Nota,Comentarios) values (5 ,'boa Metodologia ');
insert into gestao_aprendizagem.Feedback(Nota,Comentarios) values (2 ,' Professores capacitados');

-- Tabela Registro_Ativ

Create table if not exists Registro_Ativ(
ID_Registro_Ativ INT primary key auto_increment,
ID_Curso INT,
Foreign Key (ID_Curso) references Curso(ID_Curso),
ID_Aluno INT,
foreign key (ID_Aluno) references Aluno(ID_Aluno),
ID_Professor INT,
foreign key (ID_Professor) references Professor(ID_Professor),
Nota INT(2)

);


-- Histórico
CREATE TABLE IF NOT Exists Historico(
ID_Curso INT,
Foreign Key (ID_Curso) references Curso(ID_Curso),
ID_Aluno INT,
Foreign Key (ID_Aluno) references Aluno (ID_Aluno),
ID_Aula INT,
Foreign Key (ID_Aula) references AULA(ID_Aula),
ID_Registro_Ativ INT,
Foreign Key(ID_Registro_Ativ) references  Registro_Ativ (ID_Registro_Ativ)
