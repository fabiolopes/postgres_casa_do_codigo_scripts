create or replace function retorna_nome_produto(prod_id int)
returns text as
$$
	declare
	nome text;
	begin
		select 	produto_nome
		into	nome
		from 	produtos
		where	id = prod_id;
		return nome;
	end
$$
language plpgsql;