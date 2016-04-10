-- Your sql code in this file
-- NOTE: Please, don't add sentence to create database in this script file.
--       You can create database locally to test it.
--       Consider add ';' at end sentence.

CREATE TABLE employee_department (
		id serial NOT NULL,
	 	name character varying(200) NOT NULL,
		description character varying(200) NOT NULL,
		CONSTRAINT pk_employee_department PRIMARY KEY (id)
);

CREATE TABLE employee (
	id serial NOT NULL,
 	last_name character varying(200),
 	employee_department_id integer,
	first_name character varying(200),
  is_boss boolean NOT NULL DEFAULT false,
  employee_boss_id integer,

	CONSTRAINT pk_employee PRIMARY KEY (id),

  CONSTRAINT fk_boss_r FOREIGN KEY (employee_boss_id)
      REFERENCES employee (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,

	CONSTRAINT fk_department_id FOREIGN KEY (employee_department_id)
      REFERENCES employee_department (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);
-- data
-- departments
INSERT INTO employee_department(
            id, name, description)
    VALUES 
    (1, 'departamento 1', 'descripcion 1'),
    (2, 'departamento 2', 'descripcion 2'),
    (3, 'departamento 3', 'descripcion 3'),
    (4, 'departamento 4', 'descripcion 4'),
    (5, 'departamento 5', 'descripcion 5'),
    (6, 'departamento 6', 'descripcion 6')
;
-- employees
INSERT INTO employee(
            id, last_name, employee_department_id, first_name)
    VALUES
    (1, 'Apellido 1', 1, 'Nombre 1'),
    (2, 'Apellido 2', 1, 'Nombre 2'),
    (3, 'Apellido 3', 2, 'Nombre 3'),
    (4, 'Apellido 4', 3, 'Nombre 4')

    ;
CREATE TABLE employee_hobby (
		id serial NOT NULL,
	 	name character varying(200) NOT NULL,
		description character varying(200) NOT NULL,
		CONSTRAINT pk_employee_hobby PRIMARY KEY (id)
);

CREATE TABLE employee_has_hobby(
	hobby_id integer NOT NULL,
  employee_id integer NOT NULL,
  CONSTRAINT pk_employ_has_hobby PRIMARY KEY (hobby_id, employee_id),
  CONSTRAINT fk_employee_has FOREIGN KEY (employee_id)
      REFERENCES employee (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_hobby_has FOREIGN KEY (hobby_id)
      REFERENCES employee_hobby (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- data hobby
INSERT INTO employee_hobby(
            id, name, description)
    VALUES 
    (1, 'Hobby 1', 'Descripcion 1'),
    (2, 'Hobby 2', 'Descripcion 2'),
    (3, 'Hobby 3', 'Descripcion 3')
;

-- relationship hobbies
INSERT INTO employee_has_hobby(
            hobby_id, employee_id)
VALUES 
(1, 1 ),
(1, 2 ),
(1, 3 ),
(1, 4 ),

(2, 1 ),
(2, 2 ),
(3, 3 ),
(3, 4 )
;

-- bosses
-- the employ 1 is the boss 
UPDATE employee
   SET is_boss=true
 WHERE id = 1;

UPDATE employee
   SET employee_boss_id=1
 WHERE id in(2,3,4);
