CREATE TABLE owner
(
    owner_id serial NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    address character varying(256) NOT NULL,
    date_of_birth date NOT NULL,
    phone_number character varying(32),
    email character varying(128),
    PRIMARY KEY (owner_id)
);

CREATE TABLE automobile
(
    auto_id serial NOT NULL,
    owner_id integer NOT NULL,
    "VIN" character varying(32) NOT NULL,
    make character varying(64) NOT NULL,
    model character varying(64) NOT NULL,
    year character varying(4) NOT NULL,
    color character varying(32) NOT NULL,
    PRIMARY KEY (auto_id),
    CONSTRAINT owner_id FOREIGN KEY (owner_id)
        REFERENCES public.owner (owner_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE public.registration
(
    registration_id serial NOT NULL,
    auto_id integer NOT NULL,
    reg_date date NOT NULL,
    exp_date date NOT NULL,
    PRIMARY KEY (registration_id),
	CONSTRAINT auto_id FOREIGN KEY (auto_id)
        REFERENCES public.automobile (auto_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);