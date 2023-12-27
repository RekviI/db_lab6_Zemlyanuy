-- Процедура видаляє всіх користувачів тестового періоду

DROP PROCEDURE IF EXISTS delete_test_users(); 
 
CREATE OR REPLACE PROCEDURE delete_test_users()
LANGUAGE plpgsql 
AS $$ 
BEGIN  
    DELETE FROM person WHERE subscription IN
		(SELECT subscription
		 FROM person WHERE subscription='Tester');  
END; 
$$; 
