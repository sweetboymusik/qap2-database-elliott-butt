CREATE TABLE type
(
    type_id serial NOT NULL,
    name character varying(64) NOT NULL,
    description character varying(256),
    PRIMARY KEY (type_id)
);

CREATE TABLE author
(
    author_id serial NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    PRIMARY KEY (author_id)
);

CREATE TABLE publication
(
    publication_id serial NOT NULL,
    type_id integer NOT NULL,
    author_id integer NOT NULL,
    title character varying(256) NOT NULL,
    publication_date date NOT NULL,
    PRIMARY KEY (publication_od),
    CONSTRAINT type_id FOREIGN KEY (type_id)
        REFERENCES public.type (type_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT author_id FOREIGN KEY (author_id)
        REFERENCES public.author (author_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE usage
(
    usage_id serial NOT NULL,
    publication_id integer NOT NULL,
    month date NOT NULL,
    downloads integer NOT NULL,
    PRIMARY KEY (usage_id),
    CONSTRAINT publication_id FOREIGN KEY (publication_id)
        REFERENCES public.publication (publication_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);