USE educore;

/* Cours les plus suivis */
SELECT
  c.title AS course_title,
  COUNT(e.id) AS nb_inscriptions
FROM courses c
JOIN enrollments e ON e.course_id = c.id
GROUP BY c.id, c.title
ORDER BY nb_inscriptions DESC;

/* Users avec au moins deux paiements */
SELECT
  u.id AS user_id,
  u.name,
  u.email,
  COUNT(p.id) AS nb_paiements
FROM users u
JOIN payments p ON p.user_id = u.id
GROUP BY u.id, u.name, u.email
HAVING COUNT(p.id) >= 2
ORDER BY nb_paiements DESC;

/*Users sans aucun paiement */
SELECT
  u.id AS user_id,
  u.name,
  u.email
FROM users u
LEFT JOIN payments p ON p.user_id = u.id
WHERE p.id IS NULL
ORDER BY u.name;
