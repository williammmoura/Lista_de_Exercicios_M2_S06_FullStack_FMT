--Criar tabela Projetos
create table Projetos(
	projetos_id int primary key,
	nome varchar(100),
	descricao text,
	data_inicio date,
	data_prazo date
);

select * from Projetos

-- Criar tabela Tarefas
create table Tarefas(
	tarefas_id int primary key,
	nome varchar(100),
	descricao text,
	data_inicio date,
	data_prazo date
);

select * from Tarefas

-- Criar tabela Categorias
create table Categorias(
	categorias_id int primary key,
	nome varchar(100),
	descricao text
);

select * from Categorias

--Modificando a tabela "Tarefas"
alter table Tarefas
--Adicionando uma nova coluna
add column categoria_id,
--Definindo uma restrição de chave estrangeira
add constraint fk-categoria
foreign key (categoria_id)
references categorias (id);