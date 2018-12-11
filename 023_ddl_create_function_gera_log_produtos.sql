create or replace function gera_log_produtos()
returns trigger as
$$
begin
	if TG_OP = 'INSERT' then
		insert into log_produtos(
			alteracao
			,data_alteracao
			,id_new
			,produto_codigo_new
			,produto_nome_new
			,produto_valor_new
			,produto_situacao_new
			,data_criacao_new
			,data_atualizacao_new
		)
values (
			TG_OP
			,now()
			,new.id
			,new.produto_codigo
			,new.produto_nome
			,new.produto_valor
			,new.produto_situacao
			,new.data_criacao
			,new.data_atualizacao
		);
		return new;
	elsif TG_OP = ' UPDATE' then
		insert into logs_produtos (
		alteracao
		,data_alteracao
		,id_old
		,produto_codigo_old
		,produto_nome_old
		,produto_valor_old
		,produto_situacao_old
		,data_criacao_old
		,data_atualizacao_old
		,id_new
		,produto_codigo_new
		,produto_nome_new
		,produto_valor_new
		,produto_situacao_new
		,data_criacao_new
		,data_atualizacao_new
		)
	values (
		TG_OP
		,now()
		,old.id
		,old.produto_codigo
		,old.produto_nome
		,old.produto_valor
		,old.produto_situacao
		,old.data_criacao
		,old.data_atualizacao
		,new.id
		,new.produto_codigo
		,new.produto_nome
		,new.produto_valor
		,new.produto_situacao
		,new.data_criacao
		,new.data_atualizacao
		);
	return new;
	elsif TG_OP = ' DELETE' then
		insert into logs_produtos (
		alteracao
		,data_alteracao
		,id_old
		,produto_codigo_old
		,produto_nome_old
		,produto_valor_old
		,produto_situacao_old
		,data_criacao_old
		,data_atualizacao_old
		)
	values (
		TG_OP
		,now()
		,old.id
		,old.produto_codigo
		,old.produto_nome
		,old.produto_valor
		,old.produto_situacao
		,old.data_criacao
		,old.data_atualizacao
		);
	return new;
	end if;
end;
$$ language plpgsql;