
---- First Query ----

SELECT f.Player_name AS Players, t.Team_name AS Team
FROM Footballer AS f JOIN Teams AS t
ON f.Team_id=t.Team_id
WHERE f.Team_id=1;

---- Second Query ----

SELECT 
SUM(CASE WHEN t.Team_id = g.Hometeam_id AND g.Hometeam_score > g.Awayteam_score OR t.Team_id = g.Awayteam_id AND g.Awayteam_score > g.Hometeam_score THEN 1 ELSE 0 END) AS WINS,
SUM(CASE WHEN t.Team_id = g.Hometeam_id AND g.Hometeam_score < Awayteam_score OR t.Team_id = g.Awayteam_id AND g.Awayteam_score < g.Hometeam_score THEN 1 ELSE 0 END) AS LOSSES,
SUM(CASE WHEN t.Team_id = g.Hometeam_id AND g.Hometeam_score = g.Awayteam_score OR t.Team_id = g.Awayteam_id AND g.Awayteam_score = g.Hometeam_score THEN 1 ELSE 0 END) AS TIES,
COUNT(*) AS GAMESPLAYED
FROM Games AS g JOIN Teams as t
ON g.Hometeam_id = t.Team_id OR g.Awayteam_id = t.Team_id
WHERE t.Team_id = 6;  -- OR -- GROUP BY t.Team_id;

---- Third Query ----

SELECT t.Team_name AS Hometeam, g.Hometeam_score, g.Awayteam_score, g.Game_date
FROM Games AS g JOIN Teams AS t
ON g.Hometeam_id=t.Team_id OR g.Awayteam_id=t.Team_id
WHERE t.Team_id=6 
ORDER BY g.Game_date DESC;

---- Fourth Query ----

;WITH Teams_games 
AS
(SELECT t.Team_name AS Team, COUNT(*) AS GamesPlayed,
SUM(CASE WHEN t.Team_id = g.Hometeam_id AND g.Hometeam_score > g.Awayteam_score OR t.Team_id = g.Awayteam_id AND g.Awayteam_score > g.Hometeam_score THEN 1 ELSE 0 END) AS GameWins,
SUM(CASE WHEN t.Team_id = g.Hometeam_id AND g.Hometeam_score < g.Awayteam_score OR t.Team_id = g.Awayteam_id AND g.Awayteam_score < g.Hometeam_score THEN 1 
	     WHEN t.Team_id = g.Hometeam_id AND g.Hometeam_score = g.Awayteam_score OR t.Team_id = g.Awayteam_id AND g.Awayteam_score = g.Hometeam_score THEN 1 ELSE 0 END) AS LossAndTie
FROM Games AS g JOIN Teams as t
ON g.Hometeam_id = t.Team_id OR g.Awayteam_id = t.Team_id
GROUP BY t.Team_name)
SELECT *
FROM Teams_games
WHERE GameWins>(GamesPlayed/2); -- OR -- LossAndTie>(GamesPlayed/2);

---- Fifth Query ----

USE FootballMariyaTsenkina
GO;

CREATE PROCEDURE CalcPoints (@Team_id AS INT)
AS 
SELECT t.Team_name AS Team, SUM(
CASE WHEN t.Team_id = g.Hometeam_id AND g.Hometeam_score > g.Awayteam_score OR t.Team_id = g.Awayteam_id AND g.Awayteam_score > g.Hometeam_score THEN 3  
	 WHEN t.Team_id = g.Hometeam_id AND g.Hometeam_score = g.Awayteam_score OR t.Team_id = g.Awayteam_id AND g.Awayteam_score = g.Hometeam_score THEN 1 ELSE 0 END) AS Pts,
	   g.Game_date
FROM Games AS g JOIN Teams as t
ON g.Hometeam_id = t.Team_id OR g.Awayteam_id = t.Team_id 
WHERE Team_id=@Team_id 
GROUP BY g.Game_date,t.Team_name;


EXEC CalcPoints
@Team_id = 6;
GO;

















