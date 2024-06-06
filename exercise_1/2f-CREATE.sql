CREATE TABLE type
(
    type_id serial NOT NULL,
    name character varying(64) NOT NULL,
    description character varying(256),
    PRIMARY KEY (type_id)
);

CREATE TABLE manufacturer
(
    manufacturer_id serial NOT NULL,
    name character varying(64) NOT NULL,
    address character varying(128),
    phone_number character varying(16),
    PRIMARY KEY (manufacturer_id)
);

CREATE TABLE room
(
    room_id serial NOT NULL,
    name character varying(64) NOT NULL,
    dimensions character varying(64),
    PRIMARY KEY (room_id)
);

CREATE TABLE furniture
(
    furniture_id serial NOT NULL,
    type_id integer NOT NULL,
    manufacturer_id integer NOT NULL,
    room_id integer NOT NULL,
    name character varying(64) NOT NULL,
    price double precision,
    color character varying(32) NOT NULL,
    dimensions character varying(64),
    weight double precision,
    PRIMARY KEY (furniture_id),
    CONSTRAINT type_id FOREIGN KEY (type_id)
        REFERENCES public.type (type_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT manufacturer_id FOREIGN KEY (manufacturer_id)
        REFERENCES public.manufacturer (manufacturer_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT room_id FOREIGN KEY (room_id)
        REFERENCES public.room (room_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);
