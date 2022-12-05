/*
������� ����������� ������ � �������
 */
SELECT movies.name  as '�������� ������', geners.name as '�������� �����'
	FROM movies JOIN movies_geners
	ON movies.id = movies_geners.movie_id
	JOIN geners 
	ON movies_geners.genere_id = geners.id
	-- WHERE movies.id = 3  -- ���� ����� ����� �� ������������ �����
	ORDER BY movies.id 
	;
	


/*
������� ����� ������� ��������� ������� ������������
*/
SELECT users.first_name, movies.name, ratings.rating 
	from users JOIN ratings
	ON ratings.user_id = users.id
	JOIN movies
	ON movies.id = ratings.movie_id
	-- WHERE movies.id = 3 -- ���� ����� ����� �� ������������ �����
	-- WHERE users.id = 1 -- ���� ����� ����� �� ������������ ������������ 
	;


/*
 ������������� �� ����� �������(������� 2021 ����)
 */
DROP VIEW IF EXISTS new_movies_v;
CREATE VIEW new_movies_v (name, duration) 
AS SELECT name , duration from movies where created_at = 2021;
SELECT * FROM new_movies_v;	



/*
 ������������� �� ����� �������� ��� ������� 
 */
DROP VIEW IF EXISTS ratings_v;
CREATE VIEW ratings_v (name, rating) 
AS SELECT m.name , (sum(r.rating) / count(r.rating))
from ratings r join movies m 
on m.id = r.movie_id 
GROUP BY m.name;
SELECT * FROM ratings_v;	
 


/*
 �������, ������� ������� � ����� ����� � �������
 */
SELECT 
(SELECT name from movies WHERE id = (SELECT DISTINCT serial_id from serials_series WHERE serial_id = ss.serial_id)) as '�������� �������',
(SELECT count(num_season) from serials_seasons where serial_id =ss.serial_id) as '����������� �������',
(SELECT count(num_series) from serials_series WHERE serial_id = ss.serial_id) as '����������� �����'
from serials_series ss WHERE serial_id = 2
LIMIT 1;





DROP PROCEDURE IF EXISTS sp_profile_recommendations;

DELIMITER //

CREATE PROCEDURE sp_profile_recommendations(IN for_user_id BIGINT UNSIGNED)
BEGIN 
	-- �������� ������������� ������� ������������ �� �� ������ ��� � ������ ������������
	SELECT pf2.user_id 
	FROM profiles_favorites pf1
	JOIN profiles_favorites pf2
	ON pf1.movie_id = pf2.movie_id 
	WHERE pf1.user_id = for_user_id AND pf2.user_id !=for_user_id
	ORDER BY RAND()
	LIMIT 5;-- ������� ������ 5 ������� �� ������������	
	
END//

DELIMITER ;

CALL sp_profile_recommendations(3);





-- ������� ��� ���������� ���� �������� � ��������� �������

DROP TRIGGER IF EXISTS check_birthday_before_insert;
DELIMITER //
CREATE TRIGGER check_birthday_before_insert BEFORE INSERT ON profiles
FOR EACH ROW
	BEGIN
		IF NEW.birthday >= current_date() THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insert Canceled. Birthday must be in the past!';
		END IF;
	END//
	
DELIMITER ;

INSERT INTO profiles VALUES (11 ,'f', '2030-11-25', YEAR(CURRENT_TIMESTAMP) - YEAR(birthday), NULL, DEFAULT);


