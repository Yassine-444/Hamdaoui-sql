USE educore;

/* MISSION 8 — TRANSACTIONS & SÉCURITÉ */

/* Étape 1 — Transaction paiement propre */
START TRANSACTION;

INSERT INTO payments (user_id, amount, status)
VALUES (1, 99, 'SUCCEEDED');

UPDATE users
SET name = CONCAT(name, ' (VIP)')
WHERE id = 1;

COMMIT;


/* Étape 2 — SAVEPOINT + erreur + rollback partiel */
START TRANSACTION;

INSERT INTO payments (user_id, amount, status)
VALUES (2, 49, 'SUCCEEDED');

SAVEPOINT sp_after_payment;

/* Erreur volontaire : email UNIQUE */
INSERT INTO users (name, email)
VALUES ('Erreur Test', 'alice@educore.com');

ROLLBACK TO sp_after_payment;

COMMIT;
