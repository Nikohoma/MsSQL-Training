Create table Employees(
	Name varchar(100),
	Salary int
)


INSERT INTO Employees(Name , Salary)
Values ('Ankit',100000), ('Ajay',1400204);


INSERT INTO Employees(Name , Salary)
Values ('Jay',100780), ('Vijay',144204);


SELECT e1.Name, e1.Salary FROM Employees e1 Where e1.Salary <
(
SELECT Max(e2.Salary) as MaxSalary FROM Employees e2
) 
ORDER BY e1.Salary DESC
Limit 1


SELECT Name, Salary
FROM Employees
WHERE Salary = (
    SELECT DISTINCT Salary
    FROM Employees
    ORDER BY Salary DESC
    LIMIT 1 OFFSET 1
);
