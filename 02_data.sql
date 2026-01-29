USE educore;

INSERT INTO users (name, email) VALUES
('Alice Martin', 'alice@educore.com'),
('Benoit Leroy', 'benoit@educore.com'),
('Chloe Dubois', 'chloe@educore.com'),
('David Moreau', 'david@educore.com'),
('Emma Petit', 'emma@educore.com'),
('Farid El Amrani', 'farid@educore.com'),
('Giulia Rossi', 'giulia@educore.com'),
('Hugo Bernard', 'hugo@educore.com'),
('Ines Kacem', 'ines@educore.com'),
('Jules Thomas', 'jules@educore.com');

INSERT INTO courses (title, price) VALUES
('Python pour Data', 199),
('SQL Avancé', 149),
('Cybersécurité', 179),
('IA Générative', 129),
('DevOps & CI/CD', 219),
('AWS Cloud', 189);

INSERT INTO enrollments (user_id, course_id, progress) VALUES
(1,1,80),
(1,2,40),
(2,2,55),
(2,3,20),
(3,1,10),
(3,4,60),
(4,5,30),
(4,2,15),
(5,6,70),
(6,3,90),
(6,2,35),
(7,4,5),
(8,5,65),
(9,2,95),
(10,6,25);

INSERT INTO payments (user_id, amount, status) VALUES
(1,199,'SUCCEEDED'),
(1,149,'SUCCEEDED'),
(2,149,'FAILED'),
(3,129,'SUCCEEDED'),
(4,219,'PENDING'),
(5,189,'SUCCEEDED'),
(6,179,'SUCCEEDED'),
(6,149,'SUCCEEDED'),
(8,219,'FAILED'),
(9,149,'SUCCEEDED');
