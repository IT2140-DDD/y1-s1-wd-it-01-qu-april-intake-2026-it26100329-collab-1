-- a. Department ID and number of employees
SELECT 
    w.did AS DepartmentID,
    COUNT(w.eid) AS NumberOfEmployees
FROM works w
GROUP BY w.did
ORDER BY w.did;

-- b. Department name and number of employees
SELECT 
    w.did AS DepartmentName,
    COUNT(w.eid) AS NumberOfEmployees
FROM works w
GROUP BY w.did
ORDER BY w.did;
-- same answer as question a. since did is both department id and the name of the department

-- c. Department IDs with more than 2 employees
SELECT 
    w.did AS DepartmentID
FROM works w
GROUP BY w.did
HAVING COUNT(w.eid) > 2
ORDER BY w.did;

-- d. Departments with more than 2 employees, sorted by employee count (ascending)
SELECT 
    w.did AS DepartmentName,
    COUNT(w.eid) AS NumberOfEmployees
FROM works w
GROUP BY w.did
HAVING COUNT(w.eid) > 2
ORDER BY NumberOfEmployees ASC;
