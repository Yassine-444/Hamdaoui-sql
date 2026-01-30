USE educore;

/* MISSION 6 — VUES MÉTIER*/

/* Étape 1 — v_active_users */
CREATE OR REPLACE VIEW v_active_users AS
SELECT
  u.id,
  u.name,
  u.email
FROM users u
WHERE EXISTS (
  SELECT 1
  FROM enrollments e
  WHERE e.user_id = u.id
);

/* Test */
SELECT * FROM v_active_users;


/* Étape 2 — v_monthly_revenue */
CREATE OR REPLACE VIEW v_monthly_revenue AS
SELECT
  DATE_FORMAT(paid_at, '%Y-%m') AS month,
  SUM(amount) AS monthly_revenue
FROM payments
WHERE status = 'SUCCEEDED'
GROUP BY DATE_FORMAT(paid_at, '%Y-%m');

/* Test */
SELECT * FROM v_monthly_revenue;


/* v_popular_courses */
CREATE OR REPLACE VIEW v_popular_courses AS
SELECT
  c.id AS course_id,
  c.title,
  COUNT(e.id) AS nb_inscriptions
FROM courses c
LEFT JOIN enrollments e ON e.course_id = c.id
GROUP BY c.id, c.title
ORDER BY nb_inscriptions DESC;

/* Test */
SELECT * FROM v_popular_courses;
