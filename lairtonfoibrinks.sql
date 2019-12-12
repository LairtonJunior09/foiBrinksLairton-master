use lairtonfoibrinks;
create table clientes(
	id_cliente smallint auto_increment,
	nome_completo varchar(246),
	estadoCivil varchar(246),
	gênero varchar(246),
	rua varchar(246),
	bairro varchar(246),
	cep varchar(246),
	estado varchar(246),
	cidade varchar(246),
	cpf varchar(11),
	dataNascimento date,
	dataCadastro date,
	primary key (id_cliente)
);
create table produtos (
	
	id_produto smallint auto_increment,
	nomeProduto varchar(246),
	marca varchar(246),
	faixaEtaria varchar(246),
	altura real,
	largura real,
	profundidade real,
	peso real,
	preco real,
	dataCadastro date;
primary key (id_produto)

);
