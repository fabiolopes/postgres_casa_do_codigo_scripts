CREATE TABLE mesas
(
    id integer NOT NULL,
    mesa_codigo character varying(20) COLLATE pg_catalog."default",
    mesa_situacao character varying(1) COLLATE pg_catalog."default" DEFAULT 'A'::character varying,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    CONSTRAINT mesas_pkey PRIMARY KEY (id)
);

CREATE TABLE funcionarios
(
    id integer NOT NULL,
    funcionario_codigo character varying(20) COLLATE pg_catalog."default",
    funcionario_nome character varying(100) COLLATE pg_catalog."default",
    funcionario_situacao character varying(1) COLLATE pg_catalog."default" DEFAULT 'A'::character varying,
    funcionario_comissao real,
    funcionario_cargo character varying(30) COLLATE pg_catalog."default",
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    CONSTRAINT funcionarios_pkey PRIMARY KEY (id)
);

CREATE TABLE produtos
(
    id integer NOT NULL,
    produto_codigo character varying(20) COLLATE pg_catalog."default",
    produto_nome character varying(60) COLLATE pg_catalog."default",
    produto_valor real,
    produto_situacao character varying(1) COLLATE pg_catalog."default" DEFAULT 'A'::character varying,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    CONSTRAINT produtos_pkey PRIMARY KEY (id)
);

CREATE TABLE comissoes
(
    id integer NOT NULL,
    funcionario_id integer,
    comissao_valor real,
    comissao_situacao character varying(1) COLLATE pg_catalog."default" DEFAULT 'A'::character varying,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    CONSTRAINT comissoes_pkey PRIMARY KEY (id),
    CONSTRAINT comissoes_funcionario_id_fkey FOREIGN KEY (funcionario_id)
        REFERENCES funcionarios (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE vendas
(
    id integer NOT NULL,
    funcionario_id integer,
    mesa_id integer,
    venda_codigo character varying(20) COLLATE pg_catalog."default",
    venda_valor real,
    venda_total real,
    venda_desconto real,
    venda_situacao character varying(1) COLLATE pg_catalog."default" DEFAULT 'A'::character varying,
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    CONSTRAINT vendas_pkey PRIMARY KEY (id),
    CONSTRAINT vendas_funcionario_id_fkey FOREIGN KEY (funcionario_id)
        REFERENCES funcionarios (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT vendas_mesa_id_fkey FOREIGN KEY (mesa_id)
        REFERENCES mesas (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE itens_vendas
(
    id integer NOT NULL,
    produto_id integer NOT NULL,
    vendas_id integer NOT NULL,
    item_valor real,
    item_quantidade integer,
    item_total real,
    data_criacao timestamp without time zone,
    data_atuaizacao timestamp without time zone,
    CONSTRAINT itens_vendas_pkey PRIMARY KEY (id),
    CONSTRAINT itens_vendas_produto_id_fkey FOREIGN KEY (produto_id)
        REFERENCES produtos (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT itens_vendas_vendas_id_fkey FOREIGN KEY (vendas_id)
        REFERENCES vendas (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);