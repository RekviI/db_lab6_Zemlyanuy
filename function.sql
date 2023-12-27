-- Ми вводимо вікове обмеження на доступ до стрімінгової платформи отже, нам треба 
-- вивести аккаунти які будуть потребувати перегляд модерації, функція виводить нам 
-- таблицю з юзерів які не відповідають обмеженням, але також виводимо тип підпису бо
-- якщо ми видаляємо преміального користувача то це може призвести до втрат компанії

DROP FUNCTION IF EXISTS get_age_permission(integer);  
 
CREATE OR REPLACE FUNCTION get_age_permission(received_age integer)  
    RETURNS TABLE (user_ident varchar(50), subscription_info char(20), user_age integer) 
LANGUAGE plpgsql 
AS $$ 
BEGIN 
    RETURN QUERY
   		SELECT user_id::varchar(50), subscription::char(20), age::integer FROM person  
   		WHERE age <= received_age; 
END; 
$$
