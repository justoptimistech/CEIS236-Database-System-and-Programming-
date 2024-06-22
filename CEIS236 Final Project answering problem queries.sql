-- Problem 3
INSERT INTO region VALUES (1001, 'Northwest');
INSERT INTO region VALUES (1002, 'southwest');
INSERT INTO region VALUES (1003, 'Northeast');
INSERT INTO region VALUES (1004, 'Southeast');
INSERT INTO region VALUES (1005, 'Central');

SELECT * FROM region;

-- Problem 4
INSERT INTO customer VALUES (1, 'Bellsouth', '222-333-4571', '1004');
INSERT INTO customer VALUES (2, 'Comcast', '253-444-5555', '1003');
INSERT INTO customer VALUES (3, 'Ford', '367-555-6666', '1005');
INSERT INTO customer VALUES (4, 'Exxon', '444-777-7777', '1004');
INSERT INTO customer VALUES (5, 'Tesla', '555-222-8888', '1005');

SELECT * FROM customer;

-- Problem 5
INSERT INTO employee VALUES ('E1', 'Top', 'Sovanarry', '2019-2-7', '1004');
INSERT INTO employee VALUES ('E2', 'Craig','Brett', '2019-3-10', '1004');
INSERT INTO employee VALUES ('E3', 'Williams', 'Josh', '1999-3-17', '1005');
INSERT INTO employee VALUES ('E4', 'Cope', 'Leslie', '2017-4-21', '1002');
INSERT INTO employee VALUES ('E5', 'Mudd', 'Roger', '2017-10-18', '1001');

SELECT * FROM employee;

-- Problem 6
INSERT INTO skill VALUES ('S1', 'Data Entry I', '20');
INSERT INTO skill VALUES ('S2', 'Database Admin I', '35');
INSERT INTO skill VALUES ('S3', 'Database Admin II', '50');
INSERT INTO skill VALUES ('S4', 'Database Architect', '65');
INSERT INTO skill VALUES ('S5', 'Java I', '40');
INSERT INTO skill VALUES ('S6', 'Java II', '65');
INSERT INTO skill VALUES ('S7', 'Python I', '35');
INSERT INTO skill VALUES ('S8', 'Python II', '55');

SELECT * FROM skill;

-- Problem 7
INSERT INTO empskill VALUES ('E1', 'S2');
INSERT INTO empskill VALUES ('E1', 'S5');
INSERT INTO empskill VALUES ('E1', 'S8');
INSERT INTO empskill VALUES ('E2', 'S1');
INSERT INTO empskill VALUES ('E3', 'S4');
INSERT INTO empskill VALUES ('E3', 'S6');
INSERT INTO empskill VALUES ('E3', 'S7');
INSERT INTO empskill VALUES ('E3', 'S5');
INSERT INTO empskill VALUES ('E4', 'S6');
INSERT INTO empskill VALUES ('E4', 'S8');

SELECT * FROM empskill ORDER By empID, skillID;

-- Problem 8
SELECT ROUND(AVG(skillRate), 2) AS Average, MAX(skillRate) AS Maximum, MIN(skillRate)
FROM skill;

-- Problem 9
SELECT cusName
FROM customer 
JOIN region ON customer.regionID = region.regionID
WHERE regionName = 'Central';

-- Problem 10
SELECT DISTINCT e.empID, empLastName, empFirstName
FROM employee e
JOIN empskill es ON e.empID = es.empID
WHERE skillID IN
	(SELECT skillID FROM skill WHERE skillRate >= 50)
ORDER BY empID;

-- Problem 11
CREATE OR REPLACE VIEW Employee_Skills AS
(SELECT e.empID, empLastName, empFirstName, skillDescription, skillRate
FROM employee e
JOIN empskill es ON e.empID = es.empID
JOIN skill s ON es.skillID = s.skillID);

SELECT * FROM Employee_Skills;



