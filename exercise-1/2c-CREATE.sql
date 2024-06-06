CREATE TABLE medium
(
    medium_id serial NOT NULL,
    name character varying(64) NOT NULL,
    description character varying(256),
    PRIMARY KEY (medium_id)
);

CREATE TABLE gallery
(
    gallery_id serial NOT NULL,
    name character varying(64) NOT NULL,
    description character varying(256),
	address character varying (256),
    PRIMARY KEY (gallery_id)
);

CREATE TABLE artist
(
    artist_id serial NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    middle_name character varying(64),
    date_of_birth date NOT NULL,
    date_of_death date,
    bio_desc character varying(256) NOT NULL,
    PRIMARY KEY (artist_id)
);

CREATE TABLE artwork
(
    work_id serial NOT NULL,
    artist_id integer NOT NULL,
    medium_id integer NOT NULL,
    gallery_id integer NOT NULL,
    year date NOT NULL,
    title character varying(64) NOT NULL,
    width_cm double precision,
    height_cm double precision,
    description character varying(64),
    PRIMARY KEY (work_id),
    CONSTRAINT artist_id FOREIGN KEY (artist_id)
        REFERENCES public.artist (artist_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT medium_id FOREIGN KEY (medium_id)
        REFERENCES public.medium (medium_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT gallery_id FOREIGN KEY (gallery_id)
        REFERENCES public.gallery (gallery_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);