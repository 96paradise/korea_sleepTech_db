-- 1. 팀 테이블 생성
CREATE TABLE baseball_team (
    team_id_rank INT,
    name VARCHAR(10),
    city VARCHAR(10),
    founded_year DATE
);

-- 2. 팀 데이터 삽입
INSERT INTO baseball_team (team_id_rank, name, city, founded_year)
VALUES 
    (9, '롯데', '부산', '2025-04-10'),
    (1, 'LG', '서울', '2025-04-10'),
    (2, 'SSG', '인천', '2025-04-10'),
    (3, '삼성', '대구', '2025-04-10'),
    (4, 'KT', '수원', '2025-04-10'),
    (5, '두산', '서울', '2025-04-10'),
    (6, 'KIA', '광주', '2025-04-10'),
    (7, 'NC', '창원', '2025-04-10'),
    (8, '키움', '서울', '2025-04-10'),
    (10, '한화', '대전', '2025-04-10');

-- 3. 선수 테이블 생성
CREATE TABLE baseball_players (
    player_id_backnumber INT,
    player_name VARCHAR(10),
    player_position VARCHAR(10),
    player_birthday DATE
);

-- 4. 선수 데이터 삽입
INSERT INTO baseball_players (player_id_backnumber, player_name, player_position, player_birthday)
VALUES
	(88, '김태형', '감독', '1967-09-12'),
    (43, '나균안', '투수', '1998-03-16'),
    (27, '유강남', '포수', '1992-07-15'),
    (8, '전준우', '4번타자, 외야수', '1986-02-25'),
    (51, '나승엽', '내야수', '2002-02-15');
    
/* ALTER TABLE baseball_players 
ADD player_birthday DATE; */

-- 5. 게임(리그) 테이블 생성
CREATE TABLE baseball_games_league (
	team_rank INT,
    team_name varchar(10),
    team_games INT,
    team_win INT,
    team_draw INT,
    team_lose INT  
);

-- 6. 게임(리그) 테이블 삽입
INSERT INTO baseball_games_league (team_rank, team_name, team_games, team_win, team_draw, team_lose)
VALUE
	(9, '롯데', 15, 5, 1, 9),
	(1, 'LG', 13, 11, 0, 2),
	(2, 'SSG', 12, 8, 0, 4),
	(3, '삼성', 15, 9, 0, 6),
	(4, 'KT', 14, 7, 1, 6),
	(5, '두산', 15, 7, 0, 8),
	(6, 'KIA', 14, 6, 0, 8),
	(7, 'NC', 12, 5, 0, 7),
	(8, '키움', 15, 6, 0, 9),
	(10, '한화', 15, 5, 0, 10);

-- 7. 전체 팀 데이터 출력
SELECT * FROM baseball_team;

-- 8. 전체 선수 데이터 출력
SELECT * FROM baseball_players;

-- 9. 전체 게임(리그) 데이터 출력
SELECT * FROM baseball_games_league;

-- 10. 게임(리그) 테이블 삭제
DROP TABLE `baseball_games_league`;