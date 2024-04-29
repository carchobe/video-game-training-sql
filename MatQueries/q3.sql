CREATE MATERIALIZED VIEW teammates_and_enemies AS 
  SELECT 
    md2.match_id,
    md2.player_gamertag AS analysis_player,
    md.player_gamertag AS other_player,
    md2.team_id AS analysis_player_team,
    md.team_id AS other_player_team,
    md.did_win AS analysis_player_did_win,
    md2.did_win AS other_player_did_win
	
	FROM match_details AS md
      JOIN match_details AS md2
	  ON md.match_id = md2.match_id
	  AND md.player_gamertag <> md2.player_gamertag;
	  
SELECT * FROM teammates_and_enemies LIMIT 15;

REFRESH MATERIALIZED VIEW teammates_and_enemies;

DROP MATERIALIZED VIEW teammates_and_enemies;

CREATE UNIQUE INDEX teammates_and_matches ON teammates_and_enemies(match_id,analysis_player,other_player);

REFRESH MATERIALIZED VIEW CONCURRENTLY teammates_and_enemies;