insert into vendas 
	(id,
	funcionario_id,
	mesa_id,
	venda_codigo,
	venda_valor,
	venda_total,
	venda_desconto,
	venda_situacao,
	data_criacao,
	data_atualizacao)
values 
	(10000,
	1,
	1,
	'10201',
	'51',
	'51',
	'0',
	'A',
	'01/01/2016',
	'01/01/2016');
					
insert into itens_vendas 
	(produto_id,
	vendas_id,
	item_valor,
	item_quantidade,
	item_total,
	data_criacao,
	data_atualizacao)
values 
	(4,
	10000,
	15,
	2,
	30,
	'01/01/2016',
	'01/01/2016');
						
insert into itens_vendas 
	(produto_id,
	vendas_id,
	item_valor,
	item_quantidade,
	item_total,
	data_criacao,
	data_atualizacao)
values 
	(3,
	10000,
	7,
	3,
	21,
	'01/01/2016',
	'01/01/2016');
						
insert into vendas 
	(funcionario_id,
	mesa_id,
	venda_codigo,
	venda_valor,
	venda_total,
	venda_desconto,
	venda_situacao,
	data_criacao,
	data_atualizacao)
values 
	(1,
	1,
	'11,0201',
	'20',
	'20',
	'0',
	'A',
	'01/01/2016',
	'01/01/2016');
					
insert into itens_vendas 
	(produto_id,
	vendas_id,
	item_valor,
	item_quantidade,
	item_total,
	data_criacao,
	data_atualizacao)
values 
	(1,
	1,
	10,
	2,
	20,
	'01/01/2016',
	'01/01/2016');
						
insert into vendas 
	(id,
	funcionario_id,
	mesa_id,
	venda_codigo,
	venda_valor,
	venda_total,
	venda_desconto,
	venda_situacao,
	data_criacao,
	data_atualizacao)
values 
	(2,
	1,
	1,
	'10002',
	'45',
	'45',
	'0',
	'A',
	'01/01/2016',
	'01/01/2016');
					
insert into itens_vendas 
	(produto_id,
	vendas_id,
	item_valor,
	item_quantidade,
	item_total,
	data_criacao,
	data_atualizacao)
values 
	(4,
	2,
	15,
	3,
	45,
	'01/01/2016',
	'01/01/2016');