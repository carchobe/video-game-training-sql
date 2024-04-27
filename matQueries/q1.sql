SELECT * FROM match_details AS md
  JOIN (SELECT * FROM medals_matches_players WHERE count < 5) AS mp
    ON md.match_id = mp.match_id
	LIMIT 5; -- Way too many items