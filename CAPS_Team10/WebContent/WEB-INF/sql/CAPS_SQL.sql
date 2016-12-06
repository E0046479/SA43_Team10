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

/*
-- Query: SELECT * FROM caps.student
LIMIT 0, 1000

-- Date: 2016-12-05 17:08
*/
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrolmentDate`) VALUES ('s001','Haley Headrick','HaleyHeadrick@gmail.com','23652363',NULL,'2016-08-01');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrolmentDate`) VALUES ('s002','Kassie Ardaly','KassieArdaly@gmail.com','34637457',NULL,'2016-08-01');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrolmentDate`) VALUES ('s003','Bettie Laper','BettieLaper@gmail.com','25467547',NULL,'2016-08-01');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrolmentDate`) VALUES ('s004','Nichole Mosty','NicholeMosty@gmail.com','79765845',NULL,'2016-08-01');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrolmentDate`) VALUES ('s005','Tami Vanert','TamiVanert@gmail.com','25437375',NULL,'2016-08-01');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrolmentDate`) VALUES ('s006','Ora Purtle ','OraPurtle@gmail.com','69785656',NULL,'2016-08-01');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrolmentDate`) VALUES ('s007','Lee Fillo','LeeFillo@gmail.com','53475447',NULL,'2016-08-01');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrolmentDate`) VALUES ('s008','Merlin Prok ','MerlinProk@gmail.com','98708676',NULL,'2016-08-01');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrolmentDate`) VALUES ('s009','Vincent Lofton ','VincentLofton@gmail.com','95246754',NULL,'2016-08-01');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrolmentDate`) VALUES ('s010','Oma Bannett ','Oma Bannett@gmail.com','34786865',NULL,'2016-08-01');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrolmentDate`) VALUES ('s011','Grover Evitt','GroverEvitt@gmail.com','24675467',NULL,'2016-08-01');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrolmentDate`) VALUES ('s012','Kitty Blomstrand','KittyBlomstrand@gmail.com','67975656',NULL,'2016-08-01');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrolmentDate`) VALUES ('s013','Cristopher Yakel','CristopherYakel@gmail.com','85433637',NULL,'2016-08-01');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrolmentDate`) VALUES ('s014','Amy Smith','AmySmith@gmail.com','75685843',NULL,'2016-08-01');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrolmentDate`) VALUES ('s015','Victor Johnson','VictorJohnson@gmail.com','37848856',NULL,'2016-08-01');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrolmentDate`) VALUES ('s016','Francis Mollett','FrancisMollett@gmail.com','45645688',NULL,'2016-08-01');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrolmentDate`) VALUES ('s017','Forest Turpen ','ForestTurpen@gmail.com','64895647',NULL,'2016-08-01');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrolmentDate`) VALUES ('s018','Christal Gali','ChristalGali@gmail.com','76585699',NULL,'2016-08-01');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrolmentDate`) VALUES ('s019','Malinda Shelley ','MalindaShelley@gmail.com','67658658',NULL,'2016-08-01');
INSERT INTO `student` (`studentId`,`studentName`,`studentEmail`,`studentPhoneNumber`,`studentAddress`,`enrolmentDate`) VALUES ('s020','Jimmy Stoppel','JimmyStoppel@gmail.com','79568522',NULL,'2016-08-01');

/*
-- Query: SELECT * FROM caps.lecturer
LIMIT 0, 1000

-- Date: 2016-12-05 17:07
*/
INSERT INTO `lecturer` (`lecturerId`,`lecturerName`,`lecturerEmail`,`lecturerPhoneNumber`,`lecturerAddress`) VALUES ('l001','Barry Easton','BarryEaston@gmail.com','78976075',NULL);
INSERT INTO `lecturer` (`lecturerId`,`lecturerName`,`lecturerEmail`,`lecturerPhoneNumber`,`lecturerAddress`) VALUES ('l002','Cassidy Poucher','CassidyPoucher@gmail.com','23675454',NULL);
INSERT INTO `lecturer` (`lecturerId`,`lecturerName`,`lecturerEmail`,`lecturerPhoneNumber`,`lecturerAddress`) VALUES ('l003','Maxwell Stillman','MaxwellStillman@gmail.com','97695575',NULL);
INSERT INTO `lecturer` (`lecturerId`,`lecturerName`,`lecturerEmail`,`lecturerPhoneNumber`,`lecturerAddress`) VALUES ('l004','Clint Holom','ClintHolom@gmail.com','56856724',NULL);


/*
-- Query: SELECT * FROM caps.course
LIMIT 0, 1000

-- Date: 2016-12-05 17:04
*/
INSERT INTO `course` (`courseId`,`lecturerId`,`courseName`,`courseDescription`,`courseDuration`,`courseType`,`courseStartDate`,`courseSize`,`courseCredit`) VALUES ('c001','l004','Theatre Studies','study of theatrical performance in relation to its literary, physical, psycho-biological, sociological, and historical contexts',24,'Arts','2016-08-01',10,6);
INSERT INTO `course` (`courseId`,`lecturerId`,`courseName`,`courseDescription`,`courseDuration`,`courseType`,`courseStartDate`,`courseSize`,`courseCredit`) VALUES ('c002','l001','Architecture','principles of design and construction and ornamentation of fine buildings',32,'Arts','2016-10-01',10,8);
INSERT INTO `course` (`courseId`,`lecturerId`,`courseName`,`courseDescription`,`courseDuration`,`courseType`,`courseStartDate`,`courseSize`,`courseCredit`) VALUES ('c003','l003','Economics','production and distribution and consumption of goods and services and their management',32,'Economy','2017-01-01',10,8);
INSERT INTO `course` (`courseId`,`lecturerId`,`courseName`,`courseDescription`,`courseDuration`,`courseType`,`courseStartDate`,`courseSize`,`courseCredit`) VALUES ('c004','l001','Finance','management of money and credit and banking and investments',40,'Economy','2016-08-01',10,10);
INSERT INTO `course` (`courseId`,`lecturerId`,`courseName`,`courseDescription`,`courseDuration`,`courseType`,`courseStartDate`,`courseSize`,`courseCredit`) VALUES ('c005','l002','Philosophy','rational investigation of questions about existence and knowledge and ethics',24,'Philosophy','2017-01-01',10,6);
INSERT INTO `course` (`courseId`,`lecturerId`,`courseName`,`courseDescription`,`courseDuration`,`courseType`,`courseStartDate`,`courseSize`,`courseCredit`) VALUES ('c006','l004','Statistics','collection and interpretation of quantitative data and the use of probability theory to estimate population parameters',32,'Math','2016-10-01',10,8);

/*
-- Query: SELECT * FROM caps.login
LIMIT 0, 1000

-- Date: 2016-12-05 17:07
*/
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('a001','a001','admin');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('a002','a002','admin');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('l001','l001','lecturer');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('l002','l002','lecturer');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('l003','l003','lecturer');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('l004','l004','lecturer');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s001','s001','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s002','s002','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s003','s003','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s004','s004','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s005','s005','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s006','s006','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s007','s007','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s008','s008','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s009','s009','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s010','s010','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s011','s011','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s012','s012','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s013','s013','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s014','s014','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s015','s015','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s016','s016','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s017','s017','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s018','s018','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s019','s019','student');
INSERT INTO `login` (`userId`,`password`,`role`) VALUES ('s020','s020','student');

/*
-- Query: SELECT * FROM caps.enrolment
LIMIT 0, 1000

-- Date: 2016-12-05 17:06
*/
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s001','c001','2016-08-01','2016-07-13',3.5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s001','c002','2016-10-01','2016-07-13',4);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s002','c003','2017-01-01','2016-07-13',4);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s002','c004','2016-08-01','2016-07-13',4);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s003','c005','2017-01-01','2016-07-13',3.5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s003','c006','2016-10-01','2016-07-13',5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s004','c001','2016-08-01','2016-07-13',4.5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s004','c003','2017-01-01','2016-07-13',3.5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s005','c004','2016-08-01','2016-07-13',4.5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s005','c005','2017-01-01','2016-07-13',4);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s006','c002','2016-10-01','2016-07-13',5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s006','c006','2016-10-01','2016-07-13',4.5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s007','c001','2016-08-01','2016-07-13',3.5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s007','c004','2016-08-01','2016-07-13',3);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s008','c005','2017-01-01','2016-07-13',4);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s008','c006','2016-10-01','2016-07-13',4);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s009','c002','2016-10-01','2016-07-13',4.5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s009','c003','2017-01-01','2016-07-13',4);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s010','c001','2016-08-01','2016-07-13',3.5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s010','c005','2017-01-01','2016-07-13',4.5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s011','c002','2016-10-01','2016-07-13',4);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s011','c006','2016-10-01','2016-07-13',3.5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s012','c003','2017-01-01','2016-07-13',4.5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s012','c004','2016-08-01','2016-07-13',4.5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s013','c001','2016-08-01','2016-07-13',3);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s013','c006','2016-10-01','2016-07-13',4.5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s014','c002','2016-10-01','2016-07-13',4);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s014','c003','2017-01-01','2016-07-13',4);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s015','c004','2016-08-01','2016-07-13',4);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s015','c005','2017-01-01','2016-07-13',4.5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s016','c002','2016-10-01','2016-07-13',3.5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s016','c004','2016-08-01','2016-07-13',4.5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s017','c001','2016-08-01','2016-07-13',4);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s017','c003','2017-01-01','2016-07-13',3.5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s018','c005','2017-01-01','2016-07-13',4.5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s018','c006','2016-10-01','2016-07-13',4.5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s019','c003','2017-01-01','2016-07-13',4.5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s019','c006','2016-10-01','2016-07-13',4);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s020','c002','2016-10-01','2016-07-13',5);
INSERT INTO `enrolment` (`studentId`,`courseId`,`courseStartDate`,`courseEnrolmentDate`,`grade`) VALUES ('s020','c005','2017-01-01','2016-07-13',5);

