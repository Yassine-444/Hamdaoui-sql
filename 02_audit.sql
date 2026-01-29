USE educore;

/* ================================
   AUDIT QUALITÉ DES DONNÉES
   ================================ */

/* Audit 1 : nombre de lignes par table */
SELECT 'users' AS table_name, COUNT(*) AS total FROM users
UNION ALL
SELECT 'courses', COUNT(*) FROM courses
UNION ALL
SELECT 'enrollments', COUNT(*) FROM enrollments
UNION ALL
SELECT 'payments', COUNT(*) FROM payments;

/* Audit 2 : progress invalide */
SELECT *
FROM enrollments
WHERE progress < 0 OR progress > 100;

/* Audit 3 : enrollments orphelins */
SELECT e.*
FROM enrollments e
LEFT JOIN users u ON u.id = e.user_id
LEFT JOIN courses c ON c.id = e.course_id
WHERE u.id IS NULL OR c.id IS NULL;

/* Audit 4 : paiements avec montant invalide */
SELECT *
FROM payments
WHERE amount <= 0;
