alter table log_produtos 
rename column produt_situacao_new
to produto_situacao_new;

alter table log_produtos 
rename column produt_situacao_old
to produto_situacao_old;