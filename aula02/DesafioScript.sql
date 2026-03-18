/* criando o database do desafio */
create database if not exists desafio;

/* indicando que o database a ser utilizado é o 'desafio' */
use desafio;

/* criando a primeira tabela chamada 'tutor'*/
create table if not exists tutor (
   id int not null auto_increment, /* coluna do id sendo do tipo 'int', não podendo ser nulo e com auto incrementação */
   nome varchar(45) not null, /* coluna de nomes do tipo 'varchar', não podendo ser nulo ao preencher */
   telefone char(11) not null, /* coluna para o número de telefone dos tutores sendo do tipo 'char' por ter sempre uma quantidade fixa de caracteres */
   email varchar(30) null, /* coluna de email dos tutores para contato sendo do tipo 'varchar' e podendo ser nulo */
   primary key (id) /* indicando que a chave primária é a coluna do ID */
);

/* criando a segunda tabela chamada 'animais' */
create table if not exists animais (
    id int not null auto_increment, /* coluna do ID sendo do tipo 'int', não podendo ser nulo e com auto incrementação */
    nome varchar(15) not null, /* coluna de nomes sendo do tipo 'varchar' e não podendo ser nulo */
    espécie varchar(20) not null, /* coluna de espécie dos animais cadastrados, sendo do tipo 'varchar' e não podendo ser nulo */
    idade int null, /* coluna das idades dos animais sendo do tipo 'int' e podendo ser nulo */
    id_tutor int not null, /* coluna do ID do tutor que está responsável por aquele animal, sendo do tipo 'int' e não podendo ser nulo */
    primary key (id), /* indicando que a chave primária será a coluna do ID */ 
    foreign key (id_tutor) references tutor(id) /* indicando que a coluna 'id_tutor' será uma chave estrangeira que irá referenciar a coluna do ID da tabela 'tutor' */
);

/* visualizando as tabelas após a criação delas */
select * from tutor;
select * from animais;

/* inserindo valores na tabela dos tutores nas colunas: 'nome', 'telefone' e 'email'. A coluna 'id' não precisa ser preenchida manualmente, visto que possui auto incrementação */
insert into
tutor (nome, telefone, email)
values
    ('Bruna Soares', '11987654321', 'bruna@gmail.com'),
    ('Daniel Duarte', '83347581285', 'daniel@gmail.com'),
    ('Pobrerilo da Silva', '83928352935', 'pobrerilo@gmail.com'),
    ('Ricksson Medeiros', '8191234678', 'ricksson@gmail.com'),
    ('Fernanda Lima', '21934567890', 'fernanda@gmail.com'),
    ('Roberto ALves', '31945678901', 'roberto@gmail.com'),
    ('Juliana Costa', '71956789012', 'juliana@gmail.com'),
    ('Marcos Pereira', '85967890123', 'marcos@gmail.com'),
    ('Patrícia Rocha', '51978901234', 'patricia@gmail.com'),
    ('Diego Ferreira', '62989012345', 'diego@gmail.com');
    
/* inserindo valores na tabela de animais nas colunas: 'nome', 'espécie', 'idade' e 'id_tutor'. A coluna 'id' não precisa ser preenchida manualmente, visto que possui auto incrementação */
insert into 
animais (nome, espécie, idade, id_tutor) 
values
    ('Thor', 'Cachorro', 3, 1),
    ('Mimi', 'Gato', 5, 2),
    ('Bolinha', 'Coelho', 2, 3),
    ('Pérola', 'Cachorro', 7, 4),
    ('Simba', 'Gato', 1, 5),
    ('Pipoca', 'Hamster', 1, 6),
    ('Rex', 'Cachorro', 4, 7),
    ('Mel', 'Papagaio', 6, 8),
    ('Nemo', 'Peixe', 2, 9),
    ('Luna', 'Gato', 3, 10);
    
/* visualizando as tabelas após a inserção de valores nelas */ 
select * from tutor;
select * from animais;

/* ------ DML ------ */
/* atualizando a idade de Thor que fez aniversário hoje :) */
update animais
set idade = 4
where id = 1;

/* ------ DQL ------ */
/* visualizando as linhas da tabela 'animais' que possuem como espécie cachorro */
select * from animais
where espécie = 'Cachorro';

/* ------ Funções Agregadas ------ */	
/* pegando a média de idades cadastradas na tabela 'animais' */
select avg(idade) 
FROM animais;

/* pegando a maior idade cadastrada na tabela 'animais' */
select max(idade) 
FROM animais;

/* contando quantos tutores foram cadastrados na tabela 'tutor' */
select count(*) 
FROM tutor;

/* ------ Funções de Agrupamento ------ */	
/* contando quantas vezes os valores existentes na coluna 'espécie' aparecem na tabela 'animais' */
select espécie, count(*) 
from animais
group by espécie;

/* visualizando apenas os valores que aparecem mais de uma vez na coluna 'espécie' da tabela 'animais' */
select espécie, count(*) 
from animais
group by espécie
having count(*) > 1;

/* contando quantos animais tem cada idade existente na tabela 'animais' */
select idade, count(*) as total_animais
from animais
group by idade;

/* ------ JOIN ------ */
/* mostrando os animais juntamente com o nome de seus tutores, ao invés do ID */
select animais.nome, espécie, tutor.nome, telefone
from animais
inner join tutor on id_tutor = tutor.id;


select * from desafio.animais