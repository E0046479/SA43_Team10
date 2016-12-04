CREATE SCHEMA `caps` ;

CREATE TABLE `caps`.`login` (
  `userId` VARCHAR(50) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`userId`));
  
  CREATE TABLE `caps`.`lecturer` (
  `lecturerId` VARCHAR(50) NOT NULL,
  `lecturerName` VARCHAR(45) NOT NULL,
  `lecturerEmail` VARCHAR(45) NULL,
  `lecturerPhoneNumber` VARCHAR(45) NULL,
  `lecturerAddress` VARCHAR(150) NULL,
  PRIMARY KEY (`lecturerId`));
  
  CREATE TABLE `caps`.`course` (
  `courseId` VARCHAR(50) NOT NULL,
  `lecturerId` VARCHAR(50) NOT NULL,
  `courseName` VARCHAR(45) NOT NULL,
  `courseDescription` VARCHAR(250) NULL,
  `courseDuration` DOUBLE NULL,
  `courseType` VARCHAR(45) NULL,
  `courseStartDate` DATE NULL,
  `courseSize` INT NULL,
  `courseCredit` FLOAT NULL,
  PRIMARY KEY (`courseId`),
  INDEX `lecturerId_idx` (`lecturerId` ASC),
  CONSTRAINT `lecturerId`
    FOREIGN KEY (`lecturerId`)
    REFERENCES `caps`.`lecturer` (`lecturerId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
    CREATE TABLE `caps`.`student` (
  `studentId` VARCHAR(50) NOT NULL,
  `studentName` VARCHAR(45) NOT NULL,
  `studentEmail` VARCHAR(45) NULL,
  `studentPhoneNumber` VARCHAR(45) NULL,
  `studentAddress` VARCHAR(150) NULL,
  `enrolmentDate` DATE NULL,
  PRIMARY KEY (`studentId`));
  
  CREATE TABLE `caps`.`enrolment` (
  `studentId` VARCHAR(50) NOT NULL,
  `courseId` VARCHAR(50) NOT NULL,
  `courseStartDate` DATE NULL,
  `courseEnrolmentDate` DATE NULL,
  `grade` FLOAT NULL,
  PRIMARY KEY (`studentId`, `courseId`),
  INDEX `courseId_idx` (`courseId` ASC),
  CONSTRAINT `studentId`
    FOREIGN KEY (`studentId`)
    REFERENCES `caps`.`student` (`studentId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `courseId`
    FOREIGN KEY (`courseId`)
    REFERENCES `caps`.`course` (`courseId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

