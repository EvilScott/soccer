## Soccer on Rails
Data source: https://www.kaggle.com/hugomathien/soccer
```bash
$ pgloader db/soccer.load 
```

Test query with cleaned up data:
```sql
SELECT
  ht.short_name || ' ' || m.home_team_goal || ' - ' || m.away_team_goal || ' ' || at.short_name AS result,
  m.date
FROM matches m
  JOIN leagues l ON (m.league_id = l.id)
  JOIN seasons s ON (m.season_id = s.id)
  JOIN teams ht ON (m.home_team_id = ht.id)
  JOIN teams at ON (m.away_team_id = at.id)
WHERE l.name = 'England Premier League'
      AND s.name = '2015/2016'
ORDER BY m.date
```

TODOs:
* add many to many players to models
