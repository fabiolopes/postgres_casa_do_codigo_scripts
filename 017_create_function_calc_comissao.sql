create or replace function calc_comissao(data_ini timestamp, data_fim timestamp)
returns void as
$$
	declare
		--declaração das variáveis que vamos
		--utilizar, Já na declaração elas
		--recebem o valor zero. Pois assim
		--garanto que elas estarão zeradas
		--quando for utilizá-las.
		total_comissao 	real := 0;
		porc_comissao 	real := 0;
		--declarando uma variável para armazenar
		--os registros dos loops.
		reg 			record;
		--cursor para buscar a % de uma comissao do funcionário
		cr_porce CURSOR (func_id int) IS
			select rt_valor_comissao(func_id);
	begin
		--realiza o loop e busca todas as vendas
		--no período informado
		for reg in(
			select vendas.id id,
			funcionario_id,
			venda_total
			from vendas
			where data_criacao >= data_ini
			and data_criacao <= data_fim
			and venda_situacao = 'A')
		loop
            --abertura, utilização e fechamento do cursor
            open cr_porce(reg.funcionario_id);
            fetch cr_porce into porc_comissao;
            close cr_porce;
            
            total_comissao := (reg.venda_total * porc_comissao)/100;
            --insere na tabela comissoes o valor
            --que o funcionario irá receber da
            --comissão daquela venda
            insert into comissoes
                (funcionario_id,
                comissao_valor,
                comissao_situacao,
                data_criacao,
                data_atualizacao)
            values
                (reg.funcionario_id,
                total_comissao,
                'A',
                now(),
                now());
            
            --update na situação da venda
            --para que ela nao seja mais comissionada
            update vendas set venda_situacao = 'C'
            where id = reg.id;
            
            --devemos zerar as variáveis para serem reutilizadas
            total_comissao := 0;
            porc_comissao  := 0;
            
		--termino do loop
		end loop;
	end
$$
language plpgsql;