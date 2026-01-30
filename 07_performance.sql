USE educore;

/* MISSION 7 — PERFORMANCE & INDEX */

/* Étape 1 — EXPLAIN (avant index) */

/* Recherche user par email */
EXPLAIN
SELECT * FROM users
WHERE email = 'alice@educore.com';

/* Paiements par date */
EXPLAIN
SELECT * FROM payments
WHERE paid_at BETWEEN '2026-01-01' AND '2026-01-31';

/* Enrollments d’un cours */
EXPLAIN
SELECT * FROM enrollments
WHERE course_id = 2;


/* Étape 2 — Création des index */
CREATE INDEX idx_users_email
ON users(email);

CREATE INDEX idx_payments_paid_at
ON payments(paid_at);

CREATE INDEX idx_enrollments_course_user
ON enrollments(course_id, user_id);


/* Étape 3 — EXPLAIN (après index) */
EXPLAIN
SELECT * FROM users
WHERE email = 'alice@educore.com';

EXPLAIN
SELECT * FROM payments
WHERE paid_at BETWEEN '2026-01-01' AND '2026-01-31';

EXPLAIN
SELECT * FROM enrollments
WHERE course_id = 2;
