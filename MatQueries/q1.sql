WITH teammates_and_enemies AS (SELECT md2.player_gamertag AS analysis_player,
							          md.player_gamertag AS other_player,
							          md2.team_id AS analysis_player_team,
							          md.team_id AS other_player_team,
							          md.did_win AS analysis_player_won,
							          md2.did_win AS other_player_won
							   FROM match_details AS md
							     JOIN match_details AS md2
							       ON md.match_id = md2.match_id
							         AND md.player_gamertag <> md2.player_gamertag)

SELECT analysis_player, other_player, COUNT(1), AVG(analysis_player_won)
FROM teammates_and_enemies
GROUP BY 1,2
ORDER BY 3 DESC