-- a.
SELECT 
    w.did AS DepartmentID,
    COUNT(w.eid) AS EmployeeCount
FROM works w
GROUP BY w.did
HAVING COUNT(w.eid) < 3
ORDER BY w.did;

-- b. 
SELECT 
    e.eid AS ManagerID,
    e.ename AS ManagerName,
    COUNT(d.did) AS DepartmentCount
FROM dept d
INNER JOIN emp e ON d.managerId = e.eid
GROUP BY e.eid, e.ename
HAVING COUNT(d.did) > 1
ORDER BY DepartmentCount ASC;

-- c.
SELECT 
    e.age AS AgeGroup,
    AVG(e.salary) AS AvgSalary
FROM dbo.emp e
GROUP BY e.age
HAVING AVG(e.salary) > 40000

-- d.
SELECT 
    e.eid AS EmployeeID,
    e.ename AS EmployeeName,
    COUNT(*) AS AssignmentCount
FROM works w
INNER JOIN emp e ON w.eid = e.eid
GROUP BY e.eid, e.ename
HAVING COUNT(*) > 2

-- e.
SELECT 
    did AS DepartmentID,
    budget AS TotalBudget
FROM dept
WHERE budget > 1000000

select *
from emp
