alter table vendas add check (venda_total > 0);
alter table funcionarios add check(funcionario_nome <> null);