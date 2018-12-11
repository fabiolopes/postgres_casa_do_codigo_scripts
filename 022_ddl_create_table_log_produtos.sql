create table log_produtos(
	id int not null primary key,
	data_alteracao timestamp,
	alteracao varchar(10),
	
	id_old int,
	produto_codigo_old varchar(20),
	produto_nome_old varchar(60),
	produto_valor_old real,
	produt_situacao_old varchar(1) default 'A',
	data_criacao_old timestamp,
	data_atualizacao_old timestamp,
	
	id_new int,
	produto_codigo_new varchar(20),
	produto_nome_new varchar(60),
	produto_valor_new real,
	produt_situacao_new varchar(1) default 'A',
	data_criacao_new timestamp,
	data_atualizacao_new timestamp
);

create sequence logs_produto_id_seq;

alter table log_produtos alter column id set default nextval('logs_produto_id_seq');