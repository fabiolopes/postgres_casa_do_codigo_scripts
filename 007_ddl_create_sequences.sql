create sequence mesa_id_seq;
create sequence mesa_id_seq
create sequence vendas_id_seq
create sequence itens_venda_id_eq;
create sequence produtos_id_seq
create sequence funcionario_idseq;
create sequence comissoes_id_se

--Associação das sequences aos ids de cada tabela
alter table mesas alter column id set default nextval('mesa_id_seq');
alter table vendas alter column id set default nextval('vendas_id_seq');
alter table itens_vendas alter column id set default nextval('itens_vendas_id_seq');
alter table itens_vendas alter column id set default nextval('itens_venda_id_seq');
alter table produtos alter column id set default nextval('produtos_id_seq');
alter table funcionarios alter column id set default nextval('funcionario_id_seq');
alter table comissoes alter column id set default nextval('comissoes_id_seq'