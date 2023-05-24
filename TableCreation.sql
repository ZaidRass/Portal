-- CREATE DATABASE Milestone2
-- USE Milestone2
-- DROP DATABASE Milestone2

CREATE TABLE Users
(
  userID INT PRIMARY KEY IDENTITY,
  userName VARCHAR(20),
  userPassword VARCHAR(10),
  email VARCHAR(50) UNIQUE,
  userRole VARCHAR(20) NOT NULL,
  phoneNum VARCHAR(20)
);


CREATE TABLE Lecturer
(
  lecturerID INT PRIMARY KEY FOREIGN KEY REFERENCES Users (userID) ON DELETE CASCADE ON UPDATE CASCADE,
  schedule VARCHAR(15)
);


CREATE TABLE LecturerField
(
  lecturerID INT FOREIGN KEY REFERENCES Lecturer (lecturerID) ON DELETE CASCADE ON UPDATE CASCADE,
  field VARCHAR(15),
  PRIMARY KEY (lecturerID, field)
);


CREATE TABLE Company
(
  companyID INT PRIMARY KEY FOREIGN KEY REFERENCES Users (userID) ON DELETE CASCADE ON UPDATE CASCADE,
  companyName VARCHAR(20),
  repName VARCHAR(20),
  repEmail VARCHAR(50),
  companyLocation VARCHAR(50)
);


CREATE TABLE Employee
(
  staffID INT,
  companyID INT FOREIGN KEY REFERENCES Company (companyID) ON DELETE CASCADE ON UPDATE CASCADE,
  userName VARCHAR(20),
  employeePassword VARCHAR(10),
  email VARCHAR(20),
  field VARCHAR(25),
  phoneNum VARCHAR(20),
  PRIMARY KEY (staffID, companyID)
);


CREATE TABLE ExternalExaminer
(
  EEID INT PRIMARY KEY FOREIGN KEY REFERENCES Users (userID) ON DELETE CASCADE ON UPDATE CASCADE,
  schedule VARCHAR(15)
);


CREATE TABLE TeachingAssistant
(
  TAID INT PRIMARY KEY FOREIGN KEY REFERENCES Users (userID) ON DELETE CASCADE ON UPDATE CASCADE,
  schedule VARCHAR(15)
);


CREATE TABLE Coordinator
(
  coordinatorID INT PRIMARY KEY FOREIGN KEY REFERENCES Users (userID) ON DELETE CASCADE ON UPDATE CASCADE,
);


CREATE TABLE BachelorProject
(
  projectCode VARCHAR(10) PRIMARY KEY,
  projectName VARCHAR(50),
  submittedMaterials VARCHAR(40),
  projectDescription VARCHAR(200)
);

CREATE TABLE Faculty
(
  facultyCode VARCHAR(10) PRIMARY KEY,
  facultyName VARCHAR(20),
  dean INT FOREIGN KEY REFERENCES Lecturer (lecturerID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Major
(
  majorCode VARCHAR(10) PRIMARY KEY,
  facultyCode VARCHAR(10) FOREIGN KEY REFERENCES Faculty (facultyCode) ON DELETE CASCADE ON UPDATE CASCADE,
  majorName VARCHAR(30)
);


CREATE TABLE Student ---------------
(
  studentID INT PRIMARY KEY FOREIGN KEY REFERENCES Users (userID) ON DELETE CASCADE ON UPDATE CASCADE,
  fName VARCHAR(20),
  lName VARCHAR(20),
  majorCode VARCHAR(10) FOREIGN KEY REFERENCES Major (majorCode) ON UPDATE NO ACTION,
  dateOfBirth DATETIME,
  studentAddress VARCHAR(100),
  age AS (YEAR (CURRENT_TIMESTAMP) - YEAR (dateOfBirth)),
  semester INT,
  GPA DECIMAL(3, 2),
  totalBachelorGrade DECIMAL(4, 2),
  assignedProjectCode VARCHAR(10) FOREIGN KEY REFERENCES BachelorProject (projectCode) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE BachelorSubmittedMaterials
(
  code VARCHAR(10) PRIMARY KEY FOREIGN KEY REFERENCES BachelorProject (projectCode) ON DELETE CASCADE ON UPDATE CASCADE,
  material VARCHAR(30)
);


CREATE TABLE AcademicProject -----------------
(
  academicProjectCode VARCHAR(10) PRIMARY KEY FOREIGN KEY REFERENCES BachelorProject (projectCode) ON DELETE CASCADE ON UPDATE CASCADE,
  lecturerID INT FOREIGN KEY REFERENCES Lecturer (lecturerID) ON DELETE CASCADE ON UPDATE CASCADE,
  TAID INT FOREIGN KEY REFERENCES TeachingAssistant (TAID),
  EEID INT FOREIGN KEY REFERENCES ExternalExaminer (EEID)
);


CREATE TABLE IndustrialProject ------------------
(
  industrialProjectCode VARCHAR(10) PRIMARY KEY FOREIGN KEY REFERENCES BachelorProject (projectCode) ON DELETE CASCADE ON UPDATE CASCADE,
  companyID INT,
  lecturerID INT FOREIGN KEY REFERENCES Lecturer (lecturerID) ON DELETE CASCADE ON UPDATE CASCADE,
  employeeID INT,
  FOREIGN KEY (employeeID, companyID) REFERENCES Employee (staffID, companyID)
);


CREATE TABLE Meeting
(
  meetingID INT PRIMARY KEY,
  lecturerID INT FOREIGN KEY REFERENCES Lecturer (lecturerID) ON DELETE CASCADE ON UPDATE CASCADE,
  startTime TIME,
  endTime TIME,
  duration AS (DATEDIFF (HOUR, endTime, startTime)),
  meetingDate DATETIME,
  meetingPoint VARCHAR(5)
);


CREATE TABLE MeetingToDoList
(
  meetingID INT PRIMARY KEY FOREIGN KEY REFERENCES Meeting (meetingID) ON DELETE CASCADE ON UPDATE CASCADE,
  toDoList VARCHAR(200)
);


CREATE TABLE MeetingAttendants -----------
(
  meetingID INT FOREIGN KEY REFERENCES Meeting (meetingID) ON DELETE CASCADE ON UPDATE CASCADE,
  attendantID INT FOREIGN KEY REFERENCES Users (userID),
  PRIMARY KEY (meetingID, attendantID)
);


CREATE TABLE Thesis ----------------
(
  studentID INT FOREIGN KEY REFERENCES Student (studentID) ON DELETE CASCADE ON UPDATE CASCADE,
  thesisTitle VARCHAR(50),
  deadline DATETIME,
  PDFDoc VARCHAR(1000),
  totalGrade DECIMAL(4, 2),
  -- Thesis.totalGrade = Calculated((GradeAcademicThesis.EE_grade+GradeAcademicThesis.Lecturer_grade)/2 or (GradeIndustrialThesis.Company_grade + GradeIndustrialThesis.Employee_grade)/2)
  PRIMARY KEY (studentID, thesisTitle)
);


CREATE TABLE Defense -----------
(
  studentID INT FOREIGN KEY REFERENCES Student (studentID) ON DELETE CASCADE ON UPDATE CASCADE,
  defenseLocation VARCHAR(5),
  content VARCHAR(1000),
  defenseTime TIME,
  defenseDate DATETIME,
  totalGrade DECIMAL(4, 2),
  -- Defense.totalGrade = Calculated((GradeAcademicDefense.EE_grade + GradeAcademicDefense.Lecturer_grade)/2 or (GradeIndustrialDefense.Compay_grade+GradeIndustrialDefense.Employee_grade)/2)
  PRIMARY KEY (studentID, defenseLocation)
);


CREATE TABLE ProgressReport ------------
(
  studentID INT FOREIGN KEY REFERENCES Student (studentID) ON DELETE CASCADE ON UPDATE CASCADE,
  reportDate DATETIME,
  content VARCHAR(1000),
  grade DECIMAL(4, 2),
  updatingUserID INT FOREIGN KEY REFERENCES Users (userID),
  cumulativeProgressReportGrade DECIMAL(4, 2),
  -- ProgressReport.grade = Calculated(AcademicProjectGrade.Lecturer_grade or IndustrialProjectGrade.Company_grade)
  -- ProgressReport.cumulativeProgressReportGrade = calculated(Average ProgressReport.grade)
  PRIMARY KEY (studentID, reportDate)
);


CREATE TABLE IndustrialProjectGrade ------------
(
  companyID INT FOREIGN KEY REFERENCES Company (companyID),
  studentID INT,
  gradeDate DATETIME,
  companyGrade DECIMAL(4, 2),
  lecturerGrade DECIMAL(4, 2),
  FOREIGN KEY (studentID, gradeDate) REFERENCES ProgressReport (studentID, reportDate) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (studentID, gradeDate)
);


CREATE TABLE AcademicProjectGrade -----------------
(
  lecturerID INT FOREIGN KEY REFERENCES Lecturer (lecturerID) ON DELETE CASCADE ON UPDATE CASCADE,
  studentID INT,
  gradeDate DATETIME,
  lecturerGrade DECIMAL(4, 2),
  FOREIGN KEY (studentID, gradeDate) REFERENCES ProgressReport (studentID, reportDate),
  PRIMARY KEY (studentID, gradeDate)
);


CREATE TABLE AcademicThesisGrade ------------------
(
  lecturerID INT FOREIGN KEY REFERENCES Lecturer (lecturerID),
  EEID INT FOREIGN KEY REFERENCES ExternalExaminer (EEID) ON DELETE CASCADE ON UPDATE CASCADE,
  studentID INT,
  title VARCHAR(50),
  externalExaminerGrade DECIMAL(4, 2),
  lecturerGrade DECIMAL(4, 2),
  FOREIGN KEY (studentID, title) REFERENCES Thesis (studentID, thesisTitle),
  PRIMARY KEY (studentID, title)
);


CREATE TABLE IndustrialThesisGrade ----------------
(
  companyID INT FOREIGN KEY REFERENCES Company (companyID),
  empID INT,
  studentID INT,
  title VARCHAR(50),
  companyGrade DECIMAL(4, 2),
  employeeGrade DECIMAL(4, 2),
  FOREIGN KEY (studentID, title) REFERENCES Thesis (studentID, thesisTitle),
  FOREIGN KEY (empID, companyID) REFERENCES Employee (staffID, companyID) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (studentID, title)
);


CREATE TABLE AcademicDefenseGrade --------------------
(
  lecturerID INT FOREIGN KEY REFERENCES Lecturer (lecturerID),
  EEID INT FOREIGN KEY REFERENCES ExternalExaminer (EEID) ON DELETE CASCADE ON UPDATE CASCADE,
  studentID INT,
  gradingLocation VARCHAR(5),
  externalExaminerGrade DECIMAL(4, 2),
  lecturerGrade DECIMAL(4, 2),
  FOREIGN KEY (studentID, gradingLocation) REFERENCES Defense (studentID, defenseLocation),
  PRIMARY KEY (studentID, gradingLocation)
);


CREATE TABLE IndustrialDefenseGrade --------------------
(
  companyID INT FOREIGN KEY REFERENCES Company (companyId),
  empID INT,
  studentID INT,
  gradingLocation VARCHAR(5),
  companyGrade DECIMAL(4, 2),
  employeeGrade DECIMAL(4, 2),
  FOREIGN KEY (empID, companyID) REFERENCES Employee (staffID, companyID) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (studentID, gradingLocation) REFERENCES Defense (studentID, defenseLocation),
  PRIMARY KEY (studentID, gradingLocation)
);


CREATE TABLE LecturerRecommendEE -----------------
(
  lecturerID INT FOREIGN KEY REFERENCES Lecturer (lecturerID),
  EEID INT FOREIGN KEY REFERENCES ExternalExaminer (EEID) ON DELETE CASCADE ON UPDATE CASCADE,
  projectCode VARCHAR(10) FOREIGN KEY REFERENCES AcademicProject (academicProjectCode),
  PRIMARY KEY (EEID, projectCode)
);


CREATE TABLE StudentPreferences ------------------
(
  studentID INT FOREIGN KEY REFERENCES Student (studentID),
  projectCode VARCHAR(10) FOREIGN KEY REFERENCES BachelorProject (projectCode) ON DELETE CASCADE ON UPDATE CASCADE,
  preferenceNumber INT,
  PRIMARY KEY (studentID, projectCode)
);


CREATE TABLE MajorHasBachelorProject
(
  majorCode VARCHAR(10) FOREIGN KEY REFERENCES Major (majorCode) ON DELETE CASCADE ON UPDATE CASCADE,
  projectCode VARCHAR(10) FOREIGN KEY REFERENCES BachelorProject (projectCode) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (majorCode, projectCode)
);