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
add constraint fk_ategoria
foreign key (categoria_id)
references categorias (id);

-- Inserindo dados na tabela
INSERT INTO Projetos (id, nome, descricao, data_inicio, data_fim)
VALUES
(1, 'Projeto A', 'Descrição do Projeto A', '2023-01-01', '2023-02-28'),
(2, 'Projeto B', 'Descrição do Projeto B', '2023-03-01', '2023-04-30'),
(3, 'Projeto C', 'Descrição do Projeto C', '2023-05-01', '2023-06-30');

INSERT INTO Categorias (id, nome, descricao)
VALUES
(1, 'Tarefa pessoal', 'Tarefas relacionadas a assuntos pessoais'),
(2, 'Tarefa profissional', 'Tarefas relacionadas ao trabalho'),
(3, 'Tarefa acadêmica', 'Tarefas relacionadas a estudos');

INSERT INTO Tarefas (id, nome, descricao, projeto_id, categoria_id, data_inicio, data_prazo, concluida)
VALUES
(1, 'Tarefa 1', 'Descrição da Tarefa 1', 1, 1, '2023-01-05', '2023-01-15', true),
(2, 'Tarefa 2', 'Descrição da Tarefa 2', 1, 2, '2023-01-10', '2023-01-20', false),
(3, 'Tarefa 3', 'Descrição da Tarefa 3', 2, 3, '2023-03-05', '2023-03-15', false),
(4, 'Tarefa 4', 'Descrição da Tarefa 4', 2, 1, '2023-03-10', '2023-03-20', false),
(5, 'Tarefa 5', 'Descrição da Tarefa 5', 3, 2, '2023-05-05', '2023-05-15', false);

-- Quais tarefas já foram concluídas:
SELECT nome
FROM Tarefas
WHERE concluida = true;

-- Quais tarefas estão atrasadas:
SELECT nome
FROM Tarefas
WHERE data_prazo < CURDATE() AND concluida = false;

-- A contagem de tarefas por projeto:
SELECT p.nome AS nome_projeto, COUNT(t.id) AS total_tarefas
FROM Projetos p
LEFT JOIN Tarefas t ON p.id = t.projeto_id
GROUP BY p.nome;
