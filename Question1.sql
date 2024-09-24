CREATE DATABASE fitness_center_db

USE fitness_center_db;

CREATE TABLE Members (
	id INT auto_increment PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT
);

CREATE TABLE WorkoutSessions (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    session_date DATE,
    session_time VARCHAR(50),
    activity VARCHAR(255),
    FOREIGN KEY (member_id) REFERENCES Members(id)
);

-- task 1, pupulate Members and WorkoutSessions tables with relevent data.

INSERT INTO Members (name, age)
VALUES
('Jane Doe', 27),
('Mary Jane', 34),
('Moby Dog', 18),
('John Smith', 21);

SELECT * FROM Members;

INSERT INTO WorkoutSessions (member_id, session_date, session_time, activity)
VALUES
(1, '2024-09-19', 'morning', 'Treadmill'),
(2, '2024-09-25', 'afternoon', 'Treadmill'),
(3, '2024-09-09', 'morning', 'Bench Press'),
(4, '2024-09-26', 'evening', 'Treadmill');

SELECT * FROM WorkoutSessions;

-- Task 2 - Update session time for Jane Doe from morning to evening.

UPDATE WorkoutSessions
SET session_time = 'evening'
WHERE member_id = 1;

SELECT m.name AS MemberName, w.session_date, w.session_time, w.activity
FROM Members m, WorkoutSessions w
WHERE m.id = w.session_id;

-- Task 3 - Remove data of a member who has cancelled their gym membership.

DELETE FROM WorkoutSessions
WHERE member_id = 4;

SELECT * FROM WorkoutSessions;
-- confirms the workout for John Smith was deleted

DELETE FROM Members
WHERE id = 4;

SELECT * FROM Members;
-- confirms John Smith's record was deleted.
