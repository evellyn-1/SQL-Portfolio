  SELECT main_category, backers, pledged, goal,
         pledged / goal AS pct_pledged,
    CASE
         WHEN pledged / goal >= 1 THEN 'Fully funded'
         WHEN pledged / goal BETWEEN .75 AND 1 THEN 'Nearly funded'
         WHEN pledged / goal < .75 THEN 'Not nearly funded'
         END AS funding_status
    FROM ksprojects   
   WHERE state IN ('failed')
     AND backers >= 100 AND pledged >= 20000
ORDER BY main_category, pct_pledged DESC
   LIMIT 10;
