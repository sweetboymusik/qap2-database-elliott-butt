CREATE TABLE pizza
(
    pizza_id serial NOT NULL,
    name character varying(64) NOT NULL,
    description character varying(128),
    price double precision NOT NULL,
    size integer NOT NULL,
    PRIMARY KEY (pizza_id)
);

CREATE TABLE ingredient
(
    ingredient_id serial NOT NULL,
    type character varying(16) NOT NULL,
    name character varying(64) NOT NULL,
    PRIMARY KEY (ingredient_id)
);

CREATE TABLE xref_pizza_ingredient
(
    xref_pizza_ingredient_id serial NOT NULL,
    pizza_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    PRIMARY KEY (xref_pizza_ingredient_id),
    CONSTRAINT pizza_id FOREIGN KEY (pizza_id)
        REFERENCES public.pizza (pizza_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT ingredient_id FOREIGN KEY (ingredient_id)
        REFERENCES public.ingredient (ingredient_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);