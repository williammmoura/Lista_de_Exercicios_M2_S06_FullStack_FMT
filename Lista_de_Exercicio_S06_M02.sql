--Criar tabela Projetos
create table Projetos(
	id int primary key,
	nome varchar(100),
	descricao text,
	data_inicio date,
	data_prazo date
);