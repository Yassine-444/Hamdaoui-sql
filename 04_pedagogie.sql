USE educore;

/*Progression moyenne par cours */
SELECT
  c.title AS course_title,
  ROUND(AVG(e.progress), 2) AS avg_progress
FROM courses c
JOIN enrollments e ON e.course_id = c.id
GROUP BY c.id, c.title
ORDER BY avg_progress DESC;


/* Apprenants en risque d’abandon (progress < 25%) */
SELECT
  u.name AS user_name,
  u.email,
  c.title AS course_title,
  e.progress
FROM enrollments e
JOIN users u ON u.id = e.user_id
JOIN courses c ON c.id = e.course_id
WHERE e.progress < 25
ORDER BY e.progress ASC;


/*Cours à risque pédagogique
 - progression moyenne < 50%
 - au moins 3 inscrits */
SELECT
  c.title AS course_title,
  COUNT(e.id) AS nb_inscrits,
  ROUND(AVG(e.progress), 2) AS avg_progress
FROM courses c
JOIN enrollments e ON e.course_id = c.id
GROUP BY c.id, c.title
HAVING AVG(e.progress) < 50
   AND COUNT(e.id) >= 3
ORDER BY avg_progress ASC;
