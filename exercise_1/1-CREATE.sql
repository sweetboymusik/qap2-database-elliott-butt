CREATE TABLE region
(
    region_id serial NOT NULL,
    name character varying(64) NOT NULL,
    PRIMARY KEY (region_id)
);

CREATE TABLE province
(
    province_id serial NOT NULL,
    region_id integer NOT NULL,
    capitol_id integer NOT NULL,
    province_code character varying(2) NOT NULL,
    name character varying(32) NOT NULL,
    prov_flower character varying(64),
    prov_tree character varying(64),
    prov_bird character varying(64),
    confed_date date,
	CONSTRAINT province_pkey PRIMARY KEY (province_id),
    CONSTRAINT capitol_id FOREIGN KEY (capitol_id)
        REFERENCES public.city (city_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT region_id FOREIGN KEY (region_id)
        REFERENCES public.region (region_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE public.city
(
    city_id serial NOT NULL,
    province_id integer NOT NULL,
    name character varying(64) NOT NULL,
    timezone character varying(64),
    population integer,
    founding_date date,
    geo_area double precision,
    PRIMARY KEY (city_id),
    CONSTRAINT province_id FOREIGN KEY (province_id)
        REFERENCES public.province (province_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);