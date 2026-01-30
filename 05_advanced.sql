USE educore;

/* Dépense totale par user Base préparatoire */
SELECT
  u.id AS user_id,
  COALESCE(SUM(p.amount), 0) AS total_spent
FROM users u
LEFT JOIN payments p
  ON p.user_id = u.id
 AND p.status = 'SUCCEEDED'
GROUP BY u.id;


/* Users au-dessus de la moyenne Top spenders */
SELECT
  t.user_id,
  t.total_spent
FROM (
  SELECT
    u.id AS user_id,
    COALESCE(SUM(p.amount), 0) AS total_spent
  FROM users u
  LEFT JOIN payments p
    ON p.user_id = u.id
   AND p.status = 'SUCCEEDED'
  GROUP BY u.id
) t
WHERE t.total_spent > (
  SELECT AVG(total_spent)
  FROM (
    SELECT
      COALESCE(SUM(p.amount), 0) AS total_spent
    FROM users u
    LEFT JOIN payments p
      ON p.user_id = u.id
     AND p.status = 'SUCCEEDED'
    GROUP BY u.id
  ) x
);


/* Cours plus chers que la moyenne */
SELECT
  id,
  title,
  price
FROM courses
WHERE price > (
  SELECT AVG(price) FROM courses
);


/* Users inscrits à au moins 2 cours */
SELECT
  u.id AS user_id,
  COUNT(e.course_id) AS nb_courses
FROM users u
JOIN enrollments e ON e.user_id = u.id
GROUP BY u.id
HAVING COUNT(e.course_id) >= 2;


/* Cours jamais achetés (approx logique) */
SELECT
  c.id,
  c.title
FROM courses c
WHERE EXISTS (
  SELECT 1
  FROM enrollments e
  WHERE e.course_id = c.id
)
AND NOT EXISTS (
  SELECT 1
  FROM enrollments e
  JOIN payments p
    ON p.user_id = e.user_id
   AND p.status = 'SUCCEEDED'
  WHERE e.course_id = c.id
);
