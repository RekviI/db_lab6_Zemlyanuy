-- Тригер відслідковує модифікації таблиці person (INSERT, UPDATE чи DELETE),
-- яким користувачем, та час коли відбулася дана операція

DROP TABLE IF EXISTS person_audit;
CREATE TABLE person_audit(
	id SERIAL PRIMARY KEY,
	change_date TIMESTAMP NOT NULL,
	change_type char(10)NOT NULL,
	user_name varchar(50) NOT NULL
);

CREATE OR REPLACE FUNCTION update_person_audit() RETURNS trigger 
LANGUAGE 'plpgsql'
AS $$
BEGIN
	INSERT INTO person_audit(change_date, change_type, user_name)
	VALUES(NOW(), 'UPDATE', USER);
	RETURN NULL;
END;
$$;

CREATE OR REPLACE TRIGGER person_update 
AFTER UPDATE ON person
FOR EACH ROW EXECUTE FUNCTION update_person_audit();


CREATE OR REPLACE FUNCTION insert_person_audit() RETURNS trigger 
LANGUAGE 'plpgsql'
AS $$
BEGIN
	INSERT INTO person_audit(change_date, change_type, user_name)
	VALUES(NOW(), 'INSERT', USER);
	RETURN NULL;
END;
$$;

CREATE OR REPLACE TRIGGER person_insert 
AFTER INSERT ON person
FOR EACH ROW EXECUTE FUNCTION insert_person_audit();


CREATE OR REPLACE FUNCTION delete_person_audit() RETURNS trigger 
LANGUAGE 'plpgsql'
AS $$
BEGIN
	INSERT INTO person_audit(change_date, change_type, user_name)
	VALUES(NOW(), 'DELETE', USER);
	RETURN NULL;
END;
$$;

CREATE OR REPLACE TRIGGER person_delete 
AFTER DELETE ON person
FOR EACH ROW EXECUTE FUNCTION delete_person_audit();