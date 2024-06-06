CREATE TABLE author
(
    author_id serial NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    PRIMARY KEY (author_id)
);

CREATE TABLE genre
(
    genre_id serial NOT NULL,
    name character varying(64) NOT NULL,
    PRIMARY KEY (genre_id)
);

CREATE TABLE "user"
(
    user_id serial NOT NULL,
    username character varying(64) NOT NULL,
    home_email character varying(128),
    work_email character varying(128),
    school_email character varying(128),
    PRIMARY KEY (user_id)
);

CREATE TABLE xref_user_author
(
    xref_user_author_id serial NOT NULL,
    author_id integer NOT NULL,
    user_id integer NOT NULL,
    PRIMARY KEY (xref_user_author_id),
    CONSTRAINT author_id FOREIGN KEY (author_id)
        REFERENCES public.author (author_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES public."user" (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE xref_user_genre
(
    xref_user_author_id serial NOT NULL,
    genre_id integer NOT NULL,
    user_id integer NOT NULL,
    PRIMARY KEY (xref_user_author_id),
    CONSTRAINT genre_id FOREIGN KEY (genre_id)
        REFERENCES public.genre (genre_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES public."user" (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);
