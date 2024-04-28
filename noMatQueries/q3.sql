CREATE VIEW medals_over_5 AS SELECT * FROM medals_matches_players WHERE count < 5;

-- WITH medals_over_5 AS (
--   SELECT * FROM medals_matches_players WHERE count < 5
-- ) -- Common Table Expression

SELECT * FROM match_details AS md
  JOIN medals_over_5 AS mp
    ON md.match_id = mp.match_id
	LIMIT 5; -- Way too many items