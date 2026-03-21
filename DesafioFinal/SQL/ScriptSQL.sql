create database if not exists velozcar;

use velozcar;

create table if not exists cliente (
	id_cliente int not null auto_increment,
    nome varchar(45) not null,
    cpf char(11) not null unique,
    email varchar(45) not null unique,
    telefone char(13) not null,
    endereco varchar(50) not null,
    data_nascimento date,
    data_cadastro date,
    cnh char(11) unique,
    primary key (id_cliente)
);


create table if not exists funcionario (
    id_funcionario int not null auto_increment,
    nome varchar(45) not null,
    cpf char(11) not null unique,
    email varchar(45) unique,
    telefone char(11) unique,
    cargo varchar(30) not null,
    salario decimal(10,2) not null,
    status enum('ativo', 'inativo'),
    data_admissao date not null,
    primary key (id_funcionario)
);


create table if not exists veiculo (
    id_veiculo int not null auto_increment,
    placa char(7) not null unique,
    marca varchar(15) not null,
    modelo varchar(15) not null,
    ano int not null,
    cor varchar(15) not null,
    valor_diaria decimal(10,2) not null,
    categoria enum('hatch', 'sedan', 'suv', 'pickup', 'minivan'),
    status enum('alugado', 'disponivel', 'manutencao') not null,
    km_atual int,
    primary key (id_veiculo)
);


create table if not exists aluguel (
    id_aluguel int not null auto_increment,
    data_inicio date not null,
    data_fim_prevista date not null,
    data_fim_real date,
    km_inicial int,
    km_final int,
    valor_total decimal(10,2) not null,
    status enum('ativo', 'finalizado', 'atrasado'),
    id_cliente int not null,
    id_veiculo int not null,
    id_funcionario int not null,
    foreign key (id_cliente) references cliente(id_cliente),
    foreign key (id_veiculo) references veiculo(id_veiculo),
    foreign key (id_funcionario) references funcionario(id_funcionario),
    primary key (id_aluguel)
);


create table if not exists pagamento (
    id_pagamento int not null auto_increment,
    status enum('pendente', 'concluido', 'cancelado') not null,
    metodo enum('cartao', 'pix', 'boleto'),
    valor decimal(10,2) not null,
    data_vencimento date not null,
    data_pagamento date,
    comprovante varchar(45),
    observacao varchar(200),
    id_aluguel int not null unique,
    foreign key (id_aluguel) references aluguel(id_aluguel),
    primary key (id_pagamento)
);


create table if not exists manutencao (
    id_manutencao int not null auto_increment,
    descricao varchar(200) not null,
    tipo enum('preventiva', 'corretiva', 'revisao', 'estetica') not null,
    custo decimal(10,2),
    data_inicio date not null,
    data_fim date,
    status enum('em_andamento', 'concluida', 'cancelada'),
    pecas_utilizadas varchar(300),
    id_veiculo int not null,
    id_funcionario int not null,
    foreign key (id_veiculo) references veiculo(id_veiculo),
    foreign key (id_funcionario) references funcionario(id_funcionario),
    primary key (id_manutencao)
);


insert into 
cliente (nome, cpf, email, telefone, endereco, data_nascimento, data_cadastro, cnh)
values
    ('Ana Lima', '11122233344', 'ana@gmail.com', '8199991111', 'Rua das Flores, 10', '1990-03-15', '2023-01-10', '11122233300'),
    ('Bruno Souza', '22233344455', 'bruno@gmail.com', '8199992222', 'Av. Central, 45', '1985-07-22', '2023-02-14', '22233344400'),
    ('Carla Mendes', '33344455566', 'carla@gmail.com', '8199993333', 'Rua do Sol, 88', '1992-11-30', '2023-03-05', '33344455500'),
    ('Diego Alves', '44455566677', 'diego@gmail.com', '8199994444', 'Rua Nova, 200', '1988-01-18', '2023-04-20', '44455566600'),
    ('Elisa Rocha', '55566677788', 'elisa@gmail.com', '8199995555', 'Av. Brasil, 312', '1995-05-09', '2023-05-11', '55566677700'),
    ('Felipe Costa', '66677788899', 'felipe@gmail.com', '8199996666', 'Rua das Palmeiras, 5', '1980-09-25', '2023-06-01', '66677788800'),
    ('Gabriela Nunes', '77788899900', 'gabi@gmail.com', '8199997777', 'Rua Ipê, 77', '1998-12-03', '2023-07-15', '77788899900'),
    ('Henrique Dias', '88899900011', 'henrique@gmail.com', '8199998888', 'Av. Norte, 99', '1983-04-17', '2023-08-22', '88899900011'),
    ('Isabela Ferreira', '99900011122', 'isabela@gmail.com', '8199999999', 'Rua Azul, 33', '1997-08-28', '2023-09-10', '99900011100'),
    ('João Martins', '10011122233', 'joao@gmail.com', '8100001111', 'Rua Verde, 14', '1975-02-14', '2023-10-05', '10011122200');


insert into
funcionario (nome, cpf, email, telefone, cargo, salario, status, data_admissao)
values
    ('Marcos Oliveira', '12312312300', 'marcos@velozcar.com', '8100010001', 'gerente', 5500.00, 'ativo', '2020-01-05'),
    ('Paula Santos', '23423423400', 'paula@velozcar.com', '8100020002', 'atendente', 2800.00, 'ativo', '2020-03-10'),
    ('Ricardo Lima', '34534534500', 'ricardo@velozcar.com', '8100030003', 'atendente', 2800.00, 'ativo', '2021-06-15'),
    ('Sonia Braga', '45645645600', 'sonia@velozcar.com', '8100040004', 'administrativo', 3200.00, 'ativo', '2021-08-20'),
    ('Tiago Ramos', '56756756700', 'tiago@velozcar.com', '8100050005', 'mecanico', 3500.00, 'ativo', '2019-11-01'),
    ('Ursula Melo', '67867867800', 'ursula@velozcar.com', '8100060006', 'mecanico', 3500.00, 'ativo', '2020-05-18'),
    ('Vinicius Cruz', '78978978900', 'vinicius@velozcar.com', '8100070007', 'atendente', 2800.00, 'ativo', '2022-02-28'),
    ('Wanderley Faria', '89089089000', 'wanderley@velozcar.com', '8100080008', 'mecanico', 3500.00, 'inativo', '2018-07-10'),
    ('Xuxa Pinto', '90190190100', 'xuxa@velozcar.com', '8100090009', 'administrativo', 3200.00, 'ativo', '2022-09-05'),
    ('Yara Lopes', '01201201200', 'yara@velozcar.com', '8100100010', 'atendente', 2800.00, 'ativo', '2023-01-16');


insert into
veiculo (placa, marca, modelo, ano, cor, valor_diaria, categoria, status, km_atual)
values
    ('ABC1234', 'Fiat', 'Palio', 2019, 'Branco', 120.00, 'hatch', 'disponivel', 45000),
    ('DEF5678', 'Volkswagen', 'Gol', 2020, 'Prata', 130.00, 'hatch', 'disponivel', 32000),
    ('GHI9012', 'Toyota', 'Corolla', 2021, 'Preto', 250.00, 'sedan', 'alugado', 18000),
    ('JKL3456', 'Jeep', 'Compass', 2022, 'Cinza', 380.00, 'suv', 'alugado', 12000),
    ('MNO7890', 'Ford', 'Ranger', 2020, 'Branco', 420.00, 'pickup', 'disponivel', 55000),
    ('PQR1234', 'Honda', 'Civic', 2021, 'Azul', 270.00, 'sedan', 'disponivel', 27000),
    ('STU5678', 'Chevrolet', 'Onix', 2022, 'Vermelho', 140.00, 'hatch', 'manutencao', 15000),
    ('VWX9012', 'Toyota', 'Hilux', 2021, 'Preto', 450.00, 'pickup', 'disponivel', 38000),
    ('YZA3456', 'Volkswagen', 'T-Cross', 2023, 'Branco', 350.00, 'suv', 'alugado', 5000),
    ('BCD7890', 'Fiat', 'Toro', 2020, 'Prata', 390.00, 'pickup', 'disponivel', 61000),
    ('EFG1234', 'Hyundai', 'HB20', 2022, 'Amarelo', 135.00, 'hatch', 'disponivel', 9000),
    ('HIJ5678', 'Honda', 'HR-V', 2021, 'Cinza', 320.00, 'suv', 'manutencao', 42000);


insert into
aluguel (data_inicio, data_fim_prevista, data_fim_real, km_inicial, km_final, valor_total, status, id_cliente, id_veiculo, id_funcionario)
values
    ('2024-01-10', '2024-01-15', '2024-01-15', 45000, 45620, 600.00, 'finalizado', 1, 1, 2),
    ('2024-02-01', '2024-02-05', '2024-02-05', 32000, 32780, 520.00, 'finalizado', 2, 2, 3),
    ('2024-03-10', '2024-03-15', null, 18000, null, 1250.00, 'ativo', 3, 3, 2),
    ('2024-03-20', '2024-03-25', null, 12000, null, 1900.00, 'ativo', 4, 4, 7),
    ('2024-04-01', '2024-04-03', '2024-04-04', 55000, 55430, 1260.00, 'atrasado', 5, 5, 3),
    ('2024-04-10', '2024-04-14', '2024-04-14', 27000, 27850, 1080.00, 'finalizado', 6, 6, 2),
    ('2024-05-05', '2024-05-10', null, 5000, null, 1750.00, 'ativo', 7, 9, 7),
    ('2024-05-12', '2024-05-15', '2024-05-15', 38000, 38600, 1350.00, 'finalizado', 8, 8, 3),
    ('2024-06-01', '2024-06-03', '2024-06-05', 61000, 61390, 1170.00, 'atrasado', 9, 10, 2),
    ('2024-06-10', '2024-06-13', '2024-06-13', 9000, 9410, 405.00, 'finalizado', 10, 11, 7);


insert into 
pagamento (status, metodo, valor, data_vencimento, data_pagamento, comprovante, observacao, id_aluguel) 
values
    ('concluido', 'pix', 600.00, '2024-01-10', '2024-01-10', 'COMP001', null, 1),
    ('concluido', 'cartao', 520.00, '2024-02-01', '2024-02-01', 'COMP002', 'Pago em 2x', 2),
    ('pendente', 'boleto', 1250.00, '2024-03-10', null, null, null, 3),
    ('pendente', 'pix', 1900.00, '2024-03-20', null, null, null, 4),
    ('concluido', 'cartao', 1260.00, '2024-04-01', '2024-04-04', 'COMP005', 'Pago com atraso', 5),
    ('concluido', 'pix', 1080.00, '2024-04-10', '2024-04-10', 'COMP006', null, 6),
    ('pendente', 'boleto', 1750.00, '2024-05-05', null, null, null, 7),
    ('concluido', 'cartao', 1350.00, '2024-05-12', '2024-05-12', 'COMP008', null, 8),
    ('concluido', 'pix', 1170.00, '2024-06-01', '2024-06-06', 'COMP009', 'Pago com atraso', 9),
    ('concluido', 'pix', 405.00, '2024-06-10', '2024-06-10', 'COMP010', null, 10);


insert into
manutencao (descricao, tipo, custo, data_inicio, data_fim, status, pecas_utilizadas, id_veiculo, id_funcionario)
values
    ('Troca de oleo e filtro', 'preventiva', 350.00, '2024-01-05', '2024-01-05', 'concluida', 'Filtro de oleo, oleo 5W30', 7, 5),
    ('Revisao dos freios', 'corretiva', 800.00, '2024-01-20', '2024-01-22', 'concluida', 'Pastilha de freio, disco', 12, 6),
    ('Revisao geral 20.000 km', 'revisao', 1200.00, '2024-02-10', '2024-02-12', 'concluida', 'Filtro de ar, velas, correia', 1, 5),
    ('Troca de pneus', 'corretiva', 1600.00, '2024-02-20', '2024-02-20', 'concluida', '4 pneus aro 15', 2, 6),
    ('Polimento e higienizacao', 'estetica', 400.00, '2024-03-01', '2024-03-01', 'concluida', null, 5, 5),
    ('Reparo no ar-condicionado', 'corretiva', 950.00, '2024-03-15', '2024-03-18', 'concluida', 'Gas R134a, valvula', 6, 6),
    ('Troca de oleo', 'preventiva', 300.00, '2024-04-05', '2024-04-05', 'concluida', 'Oleo 5W30, filtro', 8, 5),
    ('Revisao suspensao', 'corretiva', 1800.00, '2024-05-01', '2024-05-03', 'concluida', 'Amortecedor, mola', 10, 6),
    ('Troca de bateria', 'corretiva', 550.00, '2024-06-15', null, 'em_andamento', 'Bateria 60Ah', 7, 5),
    ('Revisao geral', 'revisao', 1100.00, '2024-06-20', null, 'em_andamento', 'Filtros, velas, correia', 12, 6); 
    
    
select * from aluguel;
select * from cliente;
select * from funcionario;
select * from manutencao;
select * from pagamento;
select * from veiculo;

/* a cliente mudou o número de telefone, e para contato será necessário atualizá-lo no banco */ 
update cliente
set telefone = '9935393271'
where id_cliente = 7;


/* a funcionária que antes era atendente foi promovida para virar gerente */
update funcionario
set cargo = 'gerente'
where id_funcionario = 2;


/* -- Tabela de aluguel -- */
/* média de valor total */
select avg(valor_total) as media_valor_total
from aluguel;

/* contando quantos aluguéis estão já finalizados */
select count(*) as finalizados
from aluguel
where status = 'finalizado';


/* -- Tabela de clientes -- */
/* contando quantos clientes foram cadastrados na tabela 'cliente' */
select count(*) 
from cliente;

/* pegando o primeiro cliente a ser cadastrado */
select *
from cliente
order by data_cadastro asc
limit 1;


/* -- Tabela de funcionários -- */
/* maior salário cadastrado */
select max(salario) as maior_salario
from funcionario;

/* calculando a média do salário de um atendente */
select avg(salario) as media_salario_atendente
from funcionario
where cargo = 'atendente';


/* -- Tabela de manutenções */
/* pegando a manutenção mais custosa cadastrada na tabela 'manutencao' */
select max(custo) as maior_custo
from manutencao;

/* procurando quais os veículos que estão precisando de mais de uma manutenção */
select id_veiculo, count(*) 
from manutencao
group by id_veiculo
having count(*) > 1;


/* -- Tabela de pagamento -- */
/* soma dos valores totais de pagamento */
select sum(valor) as total_recebido
from pagamento
where status = 'concluido';

/* contando quantos pagamentos foram feitos em cada método */
select metodo, count(*) 
from pagamento
group by metodo;


/* -- Tabela de veículos -- */
/* pegando o carro mais econômico cadastrado na tabela 'veiculo' */
select min(valor_diaria) as menor_diaria
from veiculo;

/* contando a frequência das marcas na tabela 'veiculo' */
select marca, count(*) 
from veiculo
group by marca;

/* -- JOIN -- */
/* listando os alugueis com o nome do cliente e o modelo do veiculo */
select 
    a.id_aluguel,
    c.nome as cliente,
    v.modelo as veiculo,
    a.data_inicio,
    a.data_fim_prevista,
    a.status
from aluguel a
inner join cliente c on a.id_cliente = c.id_cliente
inner join veiculo v on a.id_veiculo = v.id_veiculo;

/* listando os pagamentos com os dados do aluguel correspondente */
select
    p.id_pagamento,
    p.valor,
    p.metodo,
    p.status as status_pagamento,
    a.data_inicio,
    a.valor_total
from pagamento p
inner join aluguel a on p.id_aluguel = a.id_aluguel;


/* listando todos os veículos e suas manutenções, incluindo os que nunca foram para manutencao */
select
    v.placa,
    v.modelo,
    m.tipo,
    m.descricao,
    m.status as status_manutencao
from veiculo v
left join manutencao m on v.id_veiculo = m.id_veiculo;