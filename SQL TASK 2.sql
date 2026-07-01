create database task2;
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(50),
    Department VARCHAR(30),
    Salary INT,
    Experience INT,
    City VARCHAR(30),
    JoiningDate DATE
);
INSERT INTO Staff
(StaffID, StaffName, Department, Salary, Experience, City, JoiningDate)
VALUES
(201,'Amit Sharma','IT',85000,5,'Nagpur','2026-01-15'),
(202,'Neha Patel','HR',60000,3,'Pune','2025-08-20'),
(203,'Rahul Verma','Finance',92000,7,'Mumbai','2026-03-10'),
(204,'Sneha Joshi','Marketing',70000,4,'Delhi','2025-12-05'),
(205,'Vikas Singh','IT',98000,8,'Nagpur','2026-02-18'),
(206,'Priya Deshmukh','Sales',55000,2,'Hyderabad','2026-05-12'),
(207,'Karan Gupta','Operations',65000,4,'Bhopal','2025-10-25'),
(208,'Anjali Rao','Finance',92000,6,'Mumbai','2026-04-08'),
(209,'Rohit Kumar','IT',78000,5,'Nagpur','2025-09-18'),
(210,'Pooja Nair','Sales',55000,2,'Chennai','2026-05-12');

CREATE TABLE Staff_Department (
    Department VARCHAR(30),
    Location VARCHAR(30)
);INSERT INTO Staff_Department
VALUES
('IT','Block A'),
('HR','Block B'),
('Finance','Block C'),
('Marketing','Block D'),
('Sales','Block E'),
('Operations','Block F');

#2Window Function
SELECT StaffName,
       Salary,
       RANK() OVER(ORDER BY Salary DESC) AS Rank_No
FROM Staff;

#3CASE WHEN
SELECT StaffName,
Salary,
CASE
WHEN Salary >= 90000 THEN 'High'
WHEN Salary >= 70000 THEN 'Medium'
ELSE 'Low'
END AS Salary_Category
FROM Staff;

#4. Create a View
CREATE VIEW Staff_View AS
SELECT
    StaffID,
    StaffName,
    Department,
    Salary
FROM Staff;

#5. Trigger
DELIMITER $$
CREATE TRIGGER Check_Salary
BEFORE INSERT
ON Staff
FOR EACH ROW
BEGIN
    IF NEW.Salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END$$

DELIMITER ;

INSERT INTO Staff
VALUES
(212,'Test User','IT',-5000,2,'Pune','2026-06-25');



