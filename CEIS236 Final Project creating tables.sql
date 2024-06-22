-- Drop dependent tables first
DROP TABLE IF EXISTS empskill;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS skill;
DROP TABLE IF EXISTS region;

-- Create non-dependent tables first and dependent tables last
CREATE TABLE region (
	regionID int NOT NULL,
    regionName varchar(15) NOT NUll, 
    PRIMARY KEY (regionID)
);

CREATE TABLE customer (
	cusID int NOT NULL,
    cusName varchar(30) NOT NULL,
    cusPhone varchar(15) NOT NUll,
    regionID int NOT NULL,
    PRIMARY KEY (cusID),
	FOREIGN KEY (regionID) REFERENCES region(regionID)
);

CREATE TABLE employee (
	empID varchar(10) NOT NULL,
    empLastName varchar(20) NOT NULL,
    empFirstName varchar(20) NOT NULL,
    empHireDate DATE NOT NULL,
	regionID int NOT NULL,
    PRIMARY KEY (empID),
	FOREIGN KEY (regionID) REFERENCES region(regionID)
);

CREATE TABLE skill (
	skillID varchar(10) NOT NULL,
	skillDescription varchar(30) NOT NUll,
	skillRate DOUBLE NOT NULL, 
	PRIMARY KEY (skillID)
);

CREATE TABLE empskill (
	empID varchar(10) NOT NULL,
	skillID varchar(15) NOT NUll,
	PRIMARY KEY (empID, skillID),
    FOREIGN KEY (empID) REFERENCES employee(empID),
    FOREIGN KEY (skillID) REFERENCES skill(skillID)
);
    
