USE `YinZheng`;

SELECT player_number, player_name, team_initial FROM player
WHERE player_number=23;

SELECT * FROM player;

DROP PROCEDURE IF EXISTS find_coach;

DELIMITER //

CREATE PROCEDURE find_coach(coach_names VARCHAR(50))

BEGIN

SELECT coach_name, 
	(SELECT win 
    FROM regular_season_current_state
    WHERE regular_season_current_state.coach_name=coach.coach_name) 
    AS regular_season_win,
    (SELECT lose 
    FROM regular_season_current_state
    WHERE regular_season_current_state.coach_name=coach.coach_name) 
    AS regular_season_lose
FROM coach
where coach_name=coach_names;
END//

DELIMITER ;

DROP PROCEDURE IF EXISTS find_team;

DELIMITER //

CREATE PROCEDURE find_team(team_names VARCHAR(50))

BEGIN

SELECT current_name, win, lose
FROM team
where team_names = current_name;
END//

DELIMITER ;

DROP PROCEDURE IF EXISTS find_player;
DELIMITER //

CREATE PROCEDURE find_player(player_names VARCHAR(50))

BEGIN

SELECT player_name, team_initial, age, game_played, 
		game_start_up, minutes_played, FG
FROM player
where player_name= player_names;
END//

DELIMITER ;

CALL find_coach('gregg popovich');
CALL find_team('Lonzo Ball');
CALL find_player('Lonzo Ball');

use yinzheng;
select * from regular_season_current_state;