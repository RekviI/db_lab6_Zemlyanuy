-- Лабораторна робота №6

-- Функції
SELECT * FROM person;
SELECT * FROM get_age_permission(35);

-- Процедури
SELECT * FROM person;
CALL delete_test_users();
DELETE FROM person WHERE user_id='ayb3201';

INSERT INTO
    person (user_id, age, gender, subscription)
VALUES
	('atb201','31','Female','Tester'),
	('ayb3201','23','Male','Free'),
	('ab12h01','26','Female','Tester'),
	('nub6093','17','Male','Tester');

-- Тригери
UPDATE person SET subscription='Premium' WHERE user_id='ayb3201';
SELECT * FROM person_audit;
TRUNCATE person_audit;
