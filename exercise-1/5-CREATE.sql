CREATE TABLE student
(
    student_id serial NOT NULL,
    address character varying(128) NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    middle_name character varying(64),
    date_of_birth date NOT NULL,
    gender character varying(16),
    phone_number character varying(32) NOT NULL,
    email character varying(128) NOT NULL,
    field_of_study character varying(32) NOT NULL,
    enrolment_date date NOT NULL,
    PRIMARY KEY (student_id)
);

CREATE TABLE enrolment
(
   	enrolment_id serial NOT NULL,
    course_id integer NOT NULL,
    student_id integer NOT NULL,
    grade integer NOT NULL,
    date date NOT NULL,
	PRIMARY KEY (enrolment_id),
	CONSTRAINT student_id FOREIGN KEY (student_id)
        REFERENCES public.student (student_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
	CONSTRAINT course_id FOREIGN KEY (course_id)
        REFERENCES public.course (course_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE course
(
   	course_id serial NOT NULL,
    instructor character varying (128) NOT NULL,
    name character varying (64) NOT NULL,
    description character varying (128) NOT NULL,
    department character varying (64) NOT NULL,
	PRIMARY KEY (course_id)
);