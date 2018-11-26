CREATE TABLE comissoes
(
    id integer NOT NULL,
    funcionario_id int,
    comissao_valor real,
    comissao_situacao character varchar(1) DEFAULT 'A',
    data_criacao timestamp,
    data_atualizacao timestamp
);