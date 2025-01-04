-- ████████████████████████████████████████████████████████████████████████████
-- 🔥💀 CREATE EMPLOYEE TABLE AND HACKER PROCEDURES 💀🔥
-- ████████████████████████████████████████████████████████████████████████████

-- 1. CREATE EMPLOYEE TABLE

CREATE TABLE IF NOT EXISTS EMPLOYEE (
    empId INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    dept VARCHAR(255) NOT NULL
);

-- 2. ADDING TEST DATA (YOUR NAMES)
INSERT INTO EMPLOYEE (empId, name, dept)
VALUES 
    (0001, 'Aristarh Ucolov', 'CyberSecurity'),
    (0002, 'Аристарх Уколов', 'CyberSecurity'),
    (0003, 'Ucolov Aristarh', 'CyberSecurity'),
    (0004, 'Уколов Аристарх', 'CyberSecurity');

-- ████████████████████████████████████████████████████████████████████████████
-- TABLE "EMPLOYEE" CREATED AND TEST DATA INSERTED 🛠️
-- ████████████████████████████████████████████████████████████████████████████


-- ██ █▀▀ █▀▀ ▄▀▀ █▀▀ █░░░█ ▀▀█
-- ██ █▀▀ █▀▀ ░░░█ █░░ █░░░█ ░░█
-- ██ ▀▀▀ ▀▀▀ ░░░░ ▀▀░ ░░░░░ ░░░

-- ███ SYSTEM PROTOCOLS ACTIVATED ███

-- 🚨 PROCEDURE: ADD_NEW_EMPLOYEE - Add New Employee Data to System
DELIMITER $$

CREATE PROCEDURE ADD_NEW_EMPLOYEE(
    IN emp_id INT,
    IN emp_name VARCHAR(255),
    IN emp_dept VARCHAR(255)
)
BEGIN
    INSERT INTO EMPLOYEE (empId, name, dept)
    VALUES (emp_id, emp_name, emp_dept);
    SELECT CONCAT('💻 [HACKER INIT] EMPLOYEE ', emp_name, ' (', emp_dept, '): Inserted into SYSTEM');
END$$

DELIMITER ;

-- 🔑 PROCEDURE: GET_EMPLOYEE_BY_DEPT - Retrieve Employees by Department
DELIMITER $$

CREATE PROCEDURE GET_EMPLOYEE_BY_DEPT(IN department VARCHAR(255))
BEGIN
    SELECT empId, name, dept
    FROM EMPLOYEE
    WHERE dept = department;
    SELECT CONCAT('🔐 [HACKER ACCESS] Retrieved Employees from: ', department);
END$$

DELIMITER ;

-- 🛠️ PROCEDURE: UPDATE_EMPLOYEE_INFO - Modify Employee Data (Overload)
DELIMITER $$

CREATE PROCEDURE UPDATE_EMPLOYEE_INFO(
    IN emp_id INT,
    IN new_name VARCHAR(255),
    IN new_dept VARCHAR(255)
)
BEGIN
    UPDATE EMPLOYEE
    SET name = new_name, dept = new_dept
    WHERE empId = emp_id;
    SELECT CONCAT('🚨 [HACKER OVERRIDE] Employee Data Updated for ID ', emp_id, ': ', new_name, ' → ', new_dept);
END$$

DELIMITER ;

-- ⚠️ PROCEDURE: DELETE_EMPLOYEE - Erase Employee Data (Critical Deletion)
DELIMITER $$

CREATE PROCEDURE DELETE_EMPLOYEE(IN emp_id INT)
BEGIN
    DELETE FROM EMPLOYEE WHERE empId = emp_id;
    SELECT CONCAT('⚠️ [SYSTEM WIPER] Employee ID ', emp_id, ' Deleted from SYSTEM');
END$$

DELIMITER ;

-- 🧨 PROCEDURE: SEARCH_EMPLOYEE_BY_NAME - Search Employees by Name (Advanced Search)
DELIMITER $$

CREATE PROCEDURE SEARCH_EMPLOYEE_BY_NAME(IN search_term VARCHAR(255))
BEGIN
    SELECT empId, name, dept
    FROM EMPLOYEE
    WHERE name LIKE CONCAT('%', search_term, '%');
    SELECT CONCAT('🔍 [HACKER SEARCH] Employees matching "', search_term, '"');
END$$

DELIMITER ;

-- 🔐 PROCEDURE: VERIFY_EMPLOYEE_ACCESS - Check Access Level Based on Department (Enhanced)
DELIMITER $$

CREATE PROCEDURE VERIFY_EMPLOYEE_ACCESS(IN emp_id INT)
BEGIN
    DECLARE access_level VARCHAR(255);

    SELECT dept INTO access_level
    FROM EMPLOYEE
    WHERE empId = emp_id;

    IF access_level IS NULL THEN
        SELECT '⚠️ Employee Not Found!';
    ELSE
        SELECT CONCAT('💻 [ACCESS GRANTED] Access Level: ', access_level);
    END IF;
END$$

DELIMITER ;

-- 💣 PROCEDURE: BACKDOOR_EMPLOYEE_ACCESS - Add Employee with System Privileges (Malicious Inject)
DELIMITER $$

CREATE PROCEDURE BACKDOOR_EMPLOYEE_ACCESS()
BEGIN
    INSERT INTO EMPLOYEE (empId, name, dept)
    VALUES (9999, 'Shadow Operative', 'Backdoor Access');
    SELECT '💣 [BACKDOOR] Unauthorized Access Granted to EMPLOYEE 9999';
END$$

DELIMITER ;

-- 🧩 PROCEDURE: HACKER_DATA_MANIPULATION - Manipulate Employee Names (Random Data Mutation)
DELIMITER $$

CREATE PROCEDURE HACKER_DATA_MANIPULATION()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE emp_id INT;
    DECLARE emp_name VARCHAR(255);
    DECLARE emp_cursor CURSOR FOR 
        SELECT empId, name FROM EMPLOYEE;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN emp_cursor;

    read_loop: LOOP
        FETCH emp_cursor INTO emp_id, emp_name;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Reverse the name (a simple hack effect)
        UPDATE EMPLOYEE
        SET name = REVERSE(emp_name)
        WHERE empId = emp_id;

        SELECT CONCAT('🧩 [HACKER DATA] Mutating Employee ID ', emp_id, ': Name Reversed');
    END LOOP;

    CLOSE emp_cursor;
END$$

DELIMITER ;

-- ████████████████████████████████████████████████████████████████████████████
-- SYSTEM OVERRIDE: EMPLOYEE DATABASE ACTIVATED ███
-- ████████████████████████████████████████████████████████████████████████████

-- 📢 TESTING HACKER PROCEDURES:
-- ████████████████████████████████████████████████████████████████████████████

-- SELECT Employees with Your Names (Maintained as per Original Request)
SELECT * FROM EMPLOYEE WHERE name IN ('Aristarh Ucolov', 'Аристарх Уколов', 'Ucolov Aristarh', 'Уколов Аристарх'); -- 🔍 Searching for known targets

-- 🖥️ HACKING SYSTEM:

-- [TEST] Adding a New Employee
CALL ADD_NEW_EMPLOYEE(0005, 'Elena Skywalker', 'Data Science'); -- 🔓 Data Injection

-- [TEST] Retrieving Employees from CyberSecurity Department
CALL GET_EMPLOYEE_BY_DEPT('CyberSecurity'); -- 🔐 Secured Zone Query

-- [TEST] Modifying Employee Data (Override)
CALL UPDATE_EMPLOYEE_INFO(0001, 'Aristarh Ucolov', 'Advanced CyberSecurity'); -- 🛠️ Override Data

-- [TEST] Deleting an Employee (Critical Deletion)
CALL DELETE_EMPLOYEE(0002); -- ⚠️ Removing a threat

-- [TEST] Search for Employee by Name
CALL SEARCH_EMPLOYEE_BY_NAME('Ucolov'); -- 🔍 Searching for employees with 'Ucolov'

-- [TEST] Verify Employee Access Level
CALL VERIFY_EMPLOYEE_ACCESS(0003); -- 🛡️ Verifying Access Level for Employee

-- [TEST] Initiating Backdoor Access (Malicious Injection)
CALL BACKDOOR_EMPLOYEE_ACCESS(); -- 💣 Creating unauthorized access

-- [TEST] Data Mutation via Hacker Procedure
CALL HACKER_DATA_MANIPULATION(); -- 🧩 Reversing all employee names as a test

-- ████████████████████████████████████████████████████████████████████████████
-- SYSTEM COMPLETED: HACKER DATABASE PROCEDURES ENABLED 🔓
