CREATE PROC GeneratePassword
    @output VARCHAR(10) OUTPUT,
    @len INT,
    @min TINYINT = 48,
    @range TINYINT = 74,
    @exclude VARCHAR(50) = '0:;<=>?@O[]`^\/'
AS
DECLARE @char CHAR
SET @output = ''
WHILE @len > 0 BEGIN
    SELECT @char = CHAR(ROUND(RAND() * @range + @min, 0))
    IF CHARINDEX(@char, @exclude) = 0 BEGIN
        SET @output += @char
        SET @len = @len - 1
    END
END
GO
CREATE PROC CalculateAverage
    @avg DECIMAL(4,2) OUTPUT,
    @grade1 DECIMAL(4,2),
    @grade2 DECIMAL(4,2)
AS
SET @avg = (@grade1 + @grade2) / 2
GO
CREATE PROC CalculateTotalBachelorGrade
    @result DECIMAL(4,2) OUTPUT,
    @thesis_grade DECIMAL(4,2),
    @defense_grade DECIMAL(4,2),
    @cumulative_progress_report_grade DECIMAL(4,2)
AS
SET @result = (0.3 * @thesis_grade + 0.3 * @defense_grade + 0.4 * @cumulative_progress_report_grade)
GO
CREATE PROCEDURE UserRegister
    @user_id INT OUTPUT,
    @password VARCHAR(10) OUTPUT,
    @usertype VARCHAR(20),
    @userName VARCHAR(20),
    @email VARCHAR(50),
    @first_name VARCHAR(20),
    @last_name VARCHAR(20),
    @birth_date DATETIME,
    @GPA DECIMAL(3,2),
    @semester INT,
    @address VARCHAR(100),
    @faculty_code VARCHAR(10),
    @major_code VARCHAR(10),
    @company_name VARCHAR(20),
    @representative_name VARCHAR(20),
    @representative_email VARCHAR(50),
    @phone_number VARCHAR(20)
AS
EXEC GeneratePassword @output = @password OUTPUT, @len = 10
INSERT INTO Milestone2.dbo.Users
    (userRole, userName, userPassword, email, phoneNum)
VALUES
    (@userType, @userName, @password, @email, @phone_number)
SELECT @user_id = userID
FROM Milestone2.dbo.Users
WHERE @userName = userName
IF @userType = 'Students' BEGIN
    INSERT INTO Milestone2.dbo.Student
        (
        studentID,
        fName,
        lName,
        majorCode,
        dateOfBirth,
        studentAddress,
        semester,
        GPA
        )
    VALUES
        (
            @user_id,
            @first_name,
            @last_name,
            @major_code,
            @birth_date,
            @address,
            @semester,
            @GPA
        )
END
ELSE IF @userType = 'Companies' BEGIN
    INSERT INTO Milestone2.dbo.Company
        (
        companyID,
        companyName,
        repName,
        repEmail,
        companyLocation
        )
    VALUES
        (
            @user_id,
            @company_name,
            @representative_name,
            @representative_email,
            @address
        )
END
ELSE IF @userType = 'Lecturers' BEGIN
    INSERT INTO Milestone2.dbo.Lecturer
        (lecturerID, schedule)
    VALUES
        (@user_id, NULL)
END
ELSE IF @userType = 'TeachingAssistants' BEGIN
    INSERT INTO Milestone2.dbo.TeachingAssistant
        (TAID, schedule)
    VALUES
        (@user_id, NULL)
END
ELSE IF @userType = 'ExternalExaminers' BEGIN
    INSERT INTO Milestone2.dbo.ExternalExaminer
        (EEID, schedule)
    VALUES
        (@user_id, NULL)
END
ELSE IF @userType = 'Coordinators' BEGIN
    INSERT INTO Milestone2.dbo.Coordinator
        (coordinatorID)
    VALUES
        (@user_id)
END
GO
CREATE PROCEDURE UserLogin
    @success BIT OUTPUT,
    @user_id INT OUTPUT,
    @email VARCHAR(50),
    @password VARCHAR(10)
AS
IF EXISTS (
SELECT userID
FROM Milestone2.dbo.Users
WHERE email = @email AND userPassword = @password) BEGIN
    SET @success = 1
    SELECT @user_id = userID
    FROM Milestone2.dbo.Users
    WHERE email = @email AND userPassword = @password
-- SUCCESSFUL LOGIN
END
ELSE BEGIN
    SET @success = 0
    SET @user_id = -1
-- UNSUCCESSFUL LOGIN
END
GO
CREATE PROCEDURE ViewProfile
    @user_id INT
AS
DECLARE @role VARCHAR(20)
SELECT @role = userRole
FROM Milestone2.dbo.Users
WHERE Users.userID = @user_id
IF @role = 'Students' BEGIN
    SELECT *
    FROM Milestone2.dbo.Student INNER JOIN Milestone2.dbo.Users
        ON Student.studentID = Users.userID
    WHERE Users.userID = @user_id
END
ELSE IF @role = 'Companies' BEGIN
    SELECT *
    FROM Milestone2.dbo.Company INNER JOIN Milestone2.dbo.Users
        ON Company.companyID = Users.userID
    WHERE Users.userID = @user_id
END
ELSE IF @role = 'Lecturers' BEGIN
    SELECT *
    FROM Milestone2.dbo.Lecturer INNER JOIN Milestone2.dbo.Users
        ON Lecturer.lecturerID = Users.userID
    WHERE Users.userID = @user_id
END
ELSE IF @role = 'TeachingAssistants' BEGIN
    SELECT *
    FROM Milestone2.dbo.TeachingAssistant INNER JOIN Milestone2.dbo.Users
        ON TeachingAssistant.TAID = Users.userID
    WHERE Users.userID = @user_id
END
ELSE IF @role = 'ExternalExaminers' BEGIN
    SELECT *
    FROM Milestone2.dbo.ExternalExaminer INNER JOIN Milestone2.dbo.Users
        ON ExternalExaminer.EEID = Users.userID
    WHERE Users.userID = @user_id
END
ELSE IF @role = 'Coordinators' BEGIN
    SELECT *
    FROM Milestone2.dbo.Coordinator INNER JOIN Milestone2.dbo.Users
        ON Coordinator.coordinatorID = Users.userID
    WHERE Users.userID = @user_id
END
ELSE IF @role = 'Employees' BEGIN
    SELECT *
    FROM Milestone2.dbo.Employee INNER JOIN Milestone2.dbo.Users
        ON Employee.staffID = Users.userID
    WHERE Users.userID = @user_id
END
GO
CREATE PROCEDURE ViewBachelorProjects
    @ProjectType VARCHAR(20),
    @User_id INT
AS
IF @ProjectType = 'Industrial' AND @User_id <> NULL BEGIN
    SELECT *
    FROM Milestone2.dbo.IndustrialProject
        INNER JOIN Milestone2.dbo.Student ON IndustrialProject.industrialProjectCode = Student.assignedProjectCode
    WHERE Student.studentID = @User_id
END
ELSE IF @ProjectType = 'Academic' AND @User_id <> NULL BEGIN
    SELECT *
    FROM Milestone2.dbo.AcademicProject
        INNER JOIN Milestone2.dbo.Student ON AcademicProject.academicProjectCode = Student.assignedProjectCode
    WHERE Student.studentID = @User_id
END
ELSE IF @ProjectType = NULL AND @User_id <> NULL BEGIN
    SELECT *
    FROM Milestone2.dbo.BachelorProject
        INNER JOIN Milestone2.dbo.Student ON BachelorProject.projectCode = Student.assignedProjectCode
    WHERE Student.studentID = @User_id
END
ELSE BEGIN
    SELECT *
    FROM Milestone2.dbo.BachelorProject
END
GO
CREATE PROCEDURE ViewUsers
    @User_type VARCHAR(20),
    @User_id INT
AS
IF @User_id = NULL BEGIN
    IF @User_type = 'Students' BEGIN
        SELECT *
        FROM Milestone2.dbo.Student
            INNER JOIN Users ON Student.studentID = Users.userID
    END
    ELSE IF @User_type = 'Companies' BEGIN
        SELECT *
        FROM Company
            INNER JOIN Users ON Company.companyID = Users.userID
    END
    ELSE IF @User_type = 'Lecturers' BEGIN
        SELECT *
        FROM Lecturer
            INNER JOIN Users ON Lecturer.lecturerID = Users.userID
    END
    ELSE IF @User_type = 'TeachingAssistants' BEGIN
        SELECT *
        FROM TeachingAssistant
            INNER JOIN Users ON TeachingAssistant.TAID = Users.userID
    END
    ELSE IF @User_type = 'ExternalExaminers' BEGIN
        SELECT *
        FROM ExternalExaminer
            INNER JOIN Users ON ExternalExaminer.EEID = Users.userID
    END
    ELSE IF @User_type = 'Coordinators' BEGIN
        SELECT *
        FROM Milestone2.dbo.Coordinator
            INNER JOIN Users ON Coordinator.coordinatorID = Users.userID
    END
    ELSE IF @User_type = 'Employees' BEGIN
        SELECT *
        FROM Employee
            INNER JOIN Users ON Employee.staffID = Users.userID
    END
END
ELSE IF @User_type = 'Students' BEGIN
    SELECT *
    FROM Users
        INNER JOIN Milestone2.dbo.Student ON Users.userID = Student.studentID
    WHERE Users.userID = @User_id
END
ELSE IF @User_type = 'Companies' BEGIN
    SELECT *
    FROM Users
        INNER JOIN Company ON Users.userID = Company.companyID
    WHERE Users.userID = @User_id
END
ELSE IF @User_type = 'Lecturers' BEGIN
    SELECT *
    FROM Users
        INNER JOIN Lecturer ON Users.userID = Lecturer.lecturerID
    WHERE Users.userID = @User_id
END
ELSE IF @User_type = 'TeachingAssistants' BEGIN
    SELECT *
    FROM Users
        INNER JOIN TeachingAssistant ON Users.userID = TeachingAssistant.TAID
    WHERE Users.userID = @User_id
END
ELSE IF @User_type = 'ExternalExaminers' BEGIN
    SELECT *
    FROM Users
        INNER JOIN Milestone2.dbo.ExternalExaminer ON Users.userID = ExternalExaminer.EEID
    WHERE Users.userID = @User_id
END
ELSE IF @User_type = 'Coordinators' BEGIN
    SELECT *
    FROM Users
        INNER JOIN Milestone2.dbo.Coordinator ON Users.userID = Coordinator.coordinatorID
    WHERE Users.userID = @User_id
END
ELSE IF @User_type = 'Employees' BEGIN
    SELECT *
    FROM Users
        INNER JOIN Employee ON Users.userID = Employee.staffID
    WHERE Users.userID = @User_id
END
GO
CREATE PROCEDURE AssignTAs
    @coordinator_id INT,
    @TA_id INT,
    @proj_code VARCHAR(10)
AS
IF EXISTS (SELECT *
FROM Milestone2.dbo.Coordinator
WHERE Coordinator.coordinatorID = @coordinator_id) BEGIN
    UPDATE Milestone2.dbo.AcademicProject
    SET AcademicProject.TAID = @TA_id
    WHERE AcademicProject.academicProjectCode = @proj_code
END
GO
CREATE PROCEDURE LecturerCreateLocalProject
    @Lecturer_id INT,
    @proj_code VARCHAR(10),
    @title VARCHAR(50),
    @description VARCHAR(200),
    @major_code VARCHAR(10)
AS
INSERT INTO Milestone2.dbo.BachelorProject
    (
    projectCode,
    projectName,
    submittedMaterials,
    projectDescription
    )
VALUES
    (@proj_code, @title, NULL, @description)
INSERT INTO Milestone2.dbo.AcademicProject
    (academicProjectCode, lecturerID, TAID, EEID)
VALUES
    (@proj_code, @Lecturer_id, NULL, NULL)
INSERT INTO Milestone2.dbo.MajorHasBachelorProject
    (majorCode, projectCode)
VALUES
    (@major_code, @proj_code)
GO
CREATE PROCEDURE SpecifyThesisDeadline
    @deadline DATETIME
AS
DECLARE @student_id INT
SELECT studentID = @student_id
FROM Milestone2.dbo.Student
UPDATE Milestone2.dbo.Thesis
    SET deadline = @deadline
    WHERE studentID = @student_id
GO
CREATE PROCEDURE CreateMeeting
    @Lecturer_id INT,
    @start_time TIME,
    @end_time TIME,
    @date DATETIME,
    @meeting_point VARCHAR(5)

AS
INSERT INTO Milestone2.dbo.Meeting
    (
    lecturerID,
    startTime,
    endTime,
    meetingDate,
    meetingPoint
    )
VALUES
    (
        @Lecturer_id,
        @start_time,
        @end_time,
        @date,
        @meeting_point
    )
GO
CREATE PROCEDURE LecturerAddToDo
    @meeting_id INT,
    @to_do_list VARCHAR(200)
AS
INSERT INTO Milestone2.dbo.MeetingToDolist
    (meetingID, toDoList)
VALUES
    (@meeting_id, @to_do_list)
GO
CREATE PROC ViewMeetingLecturer
    @Lecturer_id INT,
    @meeting_id INT
AS
IF (@meeting_id = NULL) BEGIN
    SELECT *
    FROM Milestone2.dbo.Meeting
    WHERE lecturerID = @Lecturer_id
    ORDER BY Meeting.meetingDate DESC
END
ELSE BEGIN
    SELECT *
    FROM Milestone2.dbo.Meeting
    WHERE meetingID = @meeting_id
END
GO
CREATE PROCEDURE ViewEE
AS
SELECT *
FROM ExternalExaminer
WHERE EEID IN (SELECT EEID
FROM Milestone2.dbo.LecturerRecommendEE)
GO
CREATE PROCEDURE RecommendEE
    @Lecturer_id INT,
    @proj_code VARCHAR(10),
    @EE_id INT
AS
INSERT INTO Milestone2.dbo.LecturerRecommendEE
    (lecturerID, EEID, projectCode)
VALUES
    (@Lecturer_id, @EE_id, @proj_code)
GO
CREATE PROC SuperviseIndustrial
    @Lecturer_id INT,
    @proj_code VARCHAR(10)
AS
UPDATE Milestone2.dbo.IndustrialProject
    SET lecturerID = @Lecturer_id WHERE industrialProjectCode = @proj_code
GO
CREATE PROCEDURE LecGradeThesis
    @Lecturer_id INT,
    @sid INT,
    @thesis_title VARCHAR(50),
    @Lecturer_grade DECIMAL(4, 2)
AS
IF EXISTS (SELECT studentID
FROM Milestone2.dbo.AcademicThesisGrade
WHERE studentID = @sid) BEGIN
    UPDATE Milestone2.dbo.AcademicThesisGrade
    SET lecturerGrade = @Lecturer_grade
    WHERE @sid = studentID AND @Lecturer_id = lecturerID
END
ELSE BEGIN
    INSERT INTO Milestone2.dbo.AcademicThesisGrade
        (
        lecturerID,
        EEID,
        studentID,
        title,
        externalExaminerGrade,
        lecturerGrade
        )
    VALUES
        (
            @Lecturer_id,
            NULL,
            @sid,
            @thesis_title,
            NULL,
            @Lecturer_grade
        )
END
GO
CREATE PROCEDURE LecGradedefense
    @Lecturer_id INT,
    @sid INT,
    @defense_location VARCHAR(5),
    @Lecturer_grade DECIMAL(4, 2)
AS
IF EXISTS (SELECT studentID
FROM Milestone2.dbo.AcademicDefenseGrade
WHERE studentID = @sid) BEGIN
    UPDATE Milestone2.dbo.AcademicDefenseGrade
    SET lecturerGrade = @Lecturer_grade
    WHERE @sid = studentID
END
ELSE BEGIN
    INSERT INTO Milestone2.dbo.AcademicDefenseGrade
        (
        lecturerID,
        EEID,
        studentID,
        gradingLocation,
        externalExaminerGrade,
        lecturerGrade
        )
    VALUES
        (
            @Lecturer_id,
            NULL,
            @sid,
            @defense_location,
            NULL,
            @Lecturer_grade
        )
END
GO
CREATE PROCEDURE LecCreatePR
    @Lecturer_id INT,
    @sid INT,
    @date DATETIME,
    @content VARCHAR(1000)
AS
INSERT INTO Milestone2.dbo.ProgressReport
    (
    studentID,
    reportDate,
    content,
    grade,
    updatingUserID,
    cumulativeProgressReportGrade
    )
VALUES
    (@sid, @date, @content, NULL, @Lecturer_id, NULL)
GO
CREATE PROCEDURE LecGradePR
    @Lecturer_id INT,
    @sid INT,
    @date DATETIME,
    @Lecturer_grade DECIMAL(4, 2)
AS
IF EXISTS (SELECT studentID
FROM Milestone2.dbo.AcademicProjectGrade
WHERE studentID = @sid) BEGIN
    UPDATE Milestone2.dbo.ProgressReport
    SET grade = @Lecturer_grade
    WHERE @sid = studentID
END
GO
CREATE PROCEDURE TACreatePR
    @TA_id INT,
    @sid INT,
    @date DATETIME,
    @content VARCHAR(1000)
AS
INSERT INTO Milestone2.dbo.ProgressReport
    (
    studentID,
    reportDate,
    content,
    grade,
    updatingUserID,
    cumulativeProgressReportGrade
    )
VALUES
    (@sid, @date, @content, NULL, @TA_id, NULL)
GO
CREATE PROCEDURE TAAddToDo
    @meeting_id INT,
    @to_do_list VARCHAR(200)
AS
INSERT INTO Milestone2.dbo.MeetingToDolist
    (meetingID, toDoList)
VALUES
    (@meeting_id, @to_do_list)
GO
CREATE PROCEDURE ViewRecommendation
    @lecture_id INT
AS
SELECT *
FROM Milestone2.dbo.LecturerRecommendEE
WHERE lecturerID = @lecture_id
GO
CREATE PROCEDURE AssignEE
    @coordinator_id INT,
    @EE_id INT,
    @proj_code VARCHAR(10)
AS
IF EXISTS (SELECT *
FROM Milestone2.dbo.Coordinator
WHERE coordinatorID = @coordinator_id) BEGIN
    DECLARE @tempLecID INT
    SELECT @tempLecID = lecturerID
    FROM Milestone2.dbo.LecturerRecommendEE
    WHERE EEID = @EE_id
    INSERT INTO Milestone2.dbo.AcademicProject
        (academicProjectCode, lecturerID, TAID, EEID)
    VALUES
        (@proj_code, @tempLecID, NULL, @EE_id)
END
GO
CREATE PROCEDURE ScheduleDefense
    @sid INT,
    @date DATETIME,
    @time TIME,
    @location VARCHAR(5)
AS
INSERT INTO Milestone2.dbo.Defense
    (
    StudentID,
    defenseLocation,
    content,
    defenseTime,
    defenseDate,
    totalGrade
    )
VALUES
    (@sid, @location, NULL, @time, @date, NULL)
GO
-- CREATE PROCEDURE AssignAllStudentsToLocalProject

GO
---------------------------------------------------------------- Mariam's part
CREATE PROCEDURE AddEmployee
    @ComapnyID INT,
    @email VARCHAR(50),
    @name VARCHAR(20),
    @phone_number VARCHAR(20),
    @field VARCHAR(25),
    @StaffID  INT OUTPUT,
    @password VARCHAR(10) OUTPUT
AS
INSERT INTO Users
    (email, userName, userRole, phoneNum)
VALUES
    (@email, @name, 'Employees', @phone_number)
SET @StaffID = (SELECT userID
FROM Users
WHERE @name = Users.userName)
INSERT INTO
    Employee
    (
    staffID,
    companyID,
    userName,
    email,
    phoneNum,
    field
    )
VALUES
    (
        @StaffID ,
        @ComapnyID,
        @name,
        @email,
        @phone_number,
        @field
    )
GO



CREATE PROCEDURE CompanyCreateLocalProject
    @company_id INT,
    @proj_code VARCHAR(10),
    @title VARCHAR(50),
    @description VARCHAR(200),
    @major_code VARCHAR(10)
AS
INSERT INTO Milestone2.dbo.BachelorProject
    (projectCode, projectDescription, projectName)
VALUES
    (@proj_code, @description, @title)
INSERT INTO Milestone2.dbo.IndustrialProject
    (companyID, industrialProjectCode)
VALUES
    (@company_id, @proj_code)
INSERT INTO Milestone2.dbo.MajorHasBachelorProject
    (majorCode, projectCode)
VALUES
    (@major_code, @proj_code)
GO

CREATE PROCEDURE AssignEmployee
    @bachelor_code VARCHAR(10),
    @staff_id INT,
    @Company_id INT
AS
UPDATE Milestone2.dbo.IndustrialProject
SET employeeID = @staff_id, companyID = @Company_id
WHERE industrialProjectCode = @bachelor_code
SELECT *
FROM Milestone2.dbo.IndustrialProject
WHERE employeeID = @staff_id
GO

CREATE PROCEDURE CompanyGradeThesis
    @Company_id INT,
    @sid INT,
    @thesis_title VARCHAR(50),
    @Company_grade  DECIMAL(4, 2)
AS
IF EXISTS (SELECT studentID
FROM Milestone2.dbo.IndustrialThesisGrade
WHERE @sid = studentID) BEGIN
    UPDATE Milestone2.dbo.IndustrialThesisGrade
SET
    companyGrade = @Company_grade ,
    companyID = @Company_id
WHERE studentID = @sid
END
ELSE BEGIN
    INSERT INTO Milestone2.dbo.IndustrialThesisGrade
        (companyID, studentID, title, companyGrade)
    VALUES
        (@Company_id, @sid, @thesis_title, @Company_grade)
END
GO

CREATE PROCEDURE CompanyGradedefense
    @Company_id INT,
    @sid INT,
    @defense_location VARCHAR(5),
    @Company_grade DECIMAL(4, 2)
AS
IF EXISTS (SELECT studentID
FROM Milestone2.dbo.IndustrialDefenseGrade
WHERE @sid = studentID) BEGIN
    UPDATE Milestone2.dbo.IndustrialDefenseGrade
SET
    companyGrade = @Company_grade,
    companyID = @Company_id
WHERE studentID = @sid
END
GO



CREATE PROCEDURE CompanyGradePR
    @Company_id INT,
    @sid INT,
    @date DATETIME,
    @Company_grade DECIMAL(4, 2)
AS
IF EXISTS (SELECT studentID
FROM Milestone2.dbo.IndustrialProjectGrade
WHERE studentID = @sid) BEGIN
    UPDATE Milestone2.dbo.ProgressReport
SET
    grade = @Company_grade,
    updatingUserID = @Company_id
WHERE studentID = @sid
END
GO



CREATE PROCEDURE EmployeeGradeThesis
    @Employee_id INT,
    @sid  INT,
    @thesis_title VARCHAR(50),
    @Employee_grade DECIMAL(4, 2)
AS
IF NOT EXISTS (SELECT studentID
FROM Milestone2.dbo.IndustrialThesisGrade
WHERE studentID = @sid ) BEGIN
    INSERT INTO Milestone2.dbo.IndustrialThesisGrade
        (empID, title, employeeGrade)
    VALUES
        (@Employee_id, @thesis_title, @Employee_grade)
END
GO


CREATE PROCEDURE EmployeeGradedefense
    @Employee_id INT,
    @sid INT,
    @defense_location VARCHAR(5),
    @Employee_grade DECIMAL(4, 2)
AS
IF NOT EXISTS (SELECT studentID
FROM Milestone2.dbo.IndustrialDefenseGrade
WHERE studentID = @sid) BEGIN
    INSERT INTO Milestone2.dbo.IndustrialDefenseGrade
        (empID, studentID, gradingLocation, employeeGrade)
    VALUES
        (
            @Employee_id,
            @sid,
            @defense_location,
            @Employee_grade
        )
END
GO
CREATE PROCEDURE EmployeeCreatePR
    @Employee_id INT,
    @sid INT,
    @date DATETIME,
    @content VARCHAR(1000)
AS
IF NOT EXISTS (SELECT studentID
FROM Milestone2.dbo.ProgressReport
WHERE studentID = @sid) BEGIN
    INSERT INTO Milestone2.dbo.ProgressReport
        (updatingUserID, studentID, reportDate, content)
    VALUES
        (@Employee_id, @sid, @date, @content)
END
GO
-------------------------------------------------- Tato's Part
CREATE PROCEDURE MakePreferencesLocalProject
    @sid INT,
    @bachelor_code VARCHAR(10),
    @preference_number INT
AS
INSERT INTO Milestone2.dbo.StudentPreferences
    (studentID, projectCode, preferenceNumber)
VALUES
    (@sid, @bachelor_code, @preference_number)
GO
CREATE PROCEDURE ViewMyThesis
    @sid INT,
    @title VARCHAR(50)
AS
IF EXISTS (SELECT *
FROM Milestone2.dbo.Student INNER JOIN Milestone2.dbo.AcademicThesisGrade ON Student.studentID = AcademicThesisGrade.studentID
WHERE externalExaminerGrade <> NULL AND lecturerGrade <> NULL AND Student.studentID = @sid) BEGIN
    DECLARE @tempAcademicGrade DECIMAL(4,2)
    DECLARE @ee_grade DECIMAL(4,2)
    DECLARE @lecturer_grade DECIMAL(4,2)
    SELECT @ee_grade = externalExaminerGrade
    FROM Milestone2.dbo.AcademicThesisGrade
    WHERE StudentID = @sid
    SELECT @lecturer_grade = lecturerGrade
    FROM Milestone2.dbo.AcademicThesisGrade
    WHERE StudentID = @sid
    EXEC CalculateAverage @avg = @tempAcademicGrade OUTPUT,
    @grade1 = @ee_grade,
    @grade2 = @lecturer_grade
    UPDATE Milestone2.dbo.Thesis SET totalGrade = @tempAcademicGrade WHERE studentID = @sid
END
ELSE IF EXISTS (SELECT *
FROM Milestone2.dbo.Student INNER JOIN Milestone2.dbo.IndustrialThesisGrade ON Student.studentID = IndustrialThesisGrade.studentID
WHERE companyGrade <> NULL AND employeeGrade <> NULL AND Student.studentID = @sid) BEGIN
    DECLARE @tempIndustrialGrade DECIMAL(4,2)
    DECLARE @company_grade DECIMAL(4,2)
    DECLARE @employee_grade DECIMAL(4,2)
    SELECT @company_grade = companyGrade
    FROM Milestone2.dbo.IndustrialThesisGrade
    WHERE StudentID = @sid
    SELECT @employee_grade = employeeGrade
    FROM Milestone2.dbo.IndustrialThesisGrade
    WHERE StudentID = @sid
    EXEC CalculateAverage @avg = @tempIndustrialGrade OUTPUT,
    @grade1 = @company_grade,
    @grade2 = @employee_grade
    UPDATE Milestone2.dbo.Thesis SET totalGrade = @tempIndustrialGrade WHERE studentID = @sid
END
SELECT *
FROM Milestone2.dbo.Thesis
WHERE studentID = @sid
GO
CREATE PROCEDURE SubmitMyThesis
    @sid INT,
    @title VARCHAR(50),
    @PDF_Document VARCHAR(1000)
AS
INSERT INTO Milestone2.dbo.Thesis
    (studentID, thesisTitle, PDFDoc)
VALUES
    (@sid, @title, @PDF_Document)
GO
CREATE PROCEDURE ViewMyProgressReport
    @sid INT,
    @date DATETIME
AS
IF EXISTS (SELECT *
FROM Milestone2.dbo.ProgressReport
WHERE studentID = @sid AND grade <> NULL) BEGIN
    DECLARE @temp DECIMAL (4,2)
    SELECT @temp = AVG(grade)
    FROM Milestone2.dbo.ProgressReport
    WHERE studentID = @sid
    UPDATE Milestone2.dbo.ProgressReport SET cumulativeProgressReportGrade = @temp WHERE studentID = @sid
END
IF @date = NULL BEGIN
    SELECT *
    FROM Milestone2.dbo.ProgressReport
    WHERE studentID = @sid
    ORDER BY ProgressReport.reportDate DESC
END
ELSE BEGIN
    SELECT *
    FROM Milestone2.dbo.ProgressReport
    WHERE studentID = @sid AND reportDate = @date
END
GO
CREATE PROCEDURE ViewMyDefense
    @sid INT
AS
IF EXISTS (SELECT *
FROM Milestone2.dbo.Student INNER JOIN Milestone2.dbo.AcademicDefenseGrade ON Student.studentID = AcademicDefenseGrade.studentID
WHERE externalExaminerGrade <> NULL AND lecturerGrade <> NULL AND Student.studentID = @sid) BEGIN
    DECLARE @tempAcademicGrade DECIMAL(4,2)
    DECLARE @ee_grade DECIMAL(4,2)
    DECLARE @lecturer_grade DECIMAL(4,2)
    SELECT @ee_grade = externalExaminerGrade
    FROM Milestone2.dbo.AcademicDefenseGrade
    WHERE StudentID = @sid
    SELECT @lecturer_grade = lecturerGrade
    FROM Milestone2.dbo.AcademicDefenseGrade
    WHERE StudentID = @sid
    EXEC CalculateAverage @avg = @tempAcademicGrade OUTPUT,
    @grade1 = @ee_grade,
    @grade2 = @lecturer_grade
    UPDATE Milestone2.dbo.Defense SET totalGrade = @tempAcademicGrade WHERE studentID = @sid
END
ELSE IF EXISTS (SELECT *
FROM Milestone2.dbo.Student INNER JOIN Milestone2.dbo.IndustrialDefenseGrade ON Student.studentID = IndustrialDefenseGrade.studentID
WHERE companyGrade <> NULL AND employeeGrade <> NULL AND Student.studentID = @sid) BEGIN
    DECLARE @tempIndustrialGrade DECIMAL(4,2)
    DECLARE @company_grade DECIMAL(4,2)
    DECLARE @employee_grade DECIMAL(4,2)
    SELECT @company_grade = companyGrade
    FROM Milestone2.dbo.IndustrialDefenseGrade
    WHERE StudentID = @sid
    SELECT @employee_grade = employeeGrade
    FROM Milestone2.dbo.IndustrialDefenseGrade
    WHERE StudentID = @sid
    EXEC CalculateAverage @avg = @tempIndustrialGrade OUTPUT,
    @grade1 = @company_grade,
    @grade2 = @employee_grade
    UPDATE Milestone2.dbo.Defense SET totalGrade = @tempIndustrialGrade WHERE studentID = @sid
END
SELECT *
FROM Milestone2.dbo.Defense
WHERE studentID = @sid
GO
--3f)
CREATE PROCEDURE UpdateMyDefense
    @sid INT,
    @defense_content VARCHAR(1000)
AS
IF EXISTS (SELECT studentID
FROM Milestone2.dbo.Defense
WHERE studentID = @sid) BEGIN
    UPDATE Milestone2.dbo.Defense
SET
    Defense.content = @defense_content
    WHERE Defense.studentID = @sid
END
GO
--3g)
CREATE PROCEDURE ViewMyBachelorProjectGrade
    @BachelorGrade DECIMAL(4,2) OUTPUT,
    @sid INT
AS
IF EXISTS (SELECT *
FROM Milestone2.dbo.Student
    INNER JOIN Milestone2.dbo.Defense ON Defense.studentID = @sid AND Defense.totalGrade <> NULL
    INNER JOIN Milestone2.dbo.Thesis ON Thesis.studentID = @sid AND Thesis.totalGrade <> NULL
    INNER JOIN Milestone2.dbo.ProgressReport ON ProgressReport.studentID = @sid AND ProgressReport.cumulativeProgressReportGrade <> NULL
WHERE Student.studentID = @sid) BEGIN
    DECLARE @tempGrade DECIMAL(4,2)
    DECLARE @tempThesis DECIMAL(4,2)
    DECLARE @tempDefense DECIMAL(4,2)
    DECLARE @tempCPRG DECIMAL(4,2)
    SELECT @tempThesis = totalGrade
    FROM Milestone2.dbo.Thesis
    WHERE studentID = @sid
    SELECT @tempDefense = totalGrade
    FROM Milestone2.dbo.Defense
    WHERE studentID = @sid
    SELECT @tempCPRG = cumulativeProgressReportGrade
    FROM Milestone2.dbo.ProgressReport
    WHERE studentID = @sid
    EXEC CalculateTotalBachelorGrade @result = @tempGrade OUTPUT,
    @thesis_grade = @tempThesis,
    @defense_grade = @tempDefense,
    @cumulative_progress_report_grade = @tempCPRG
END
GO
--3h)
CREATE PROCEDURE ViewNotBookedMeetings
    @sid INT
AS
SELECT Meeting.MeetingID
FROM Milestone2.dbo.Meeting
    INNER JOIN Milestone2.dbo.MeetingAttendants ON Meeting.meetingID = MeetingAttendants.meetingID
WHERE attendantID NOT IN (SELECT studentID
FROM Milestone2.dbo.Student)
GO
--3i)
CREATE PROCEDURE BookMeeting
    @sid INT,
    @meeting_id INT
AS
IF NOT EXISTS (SELECT *
FROM Milestone2.dbo.MeetingAttendants
WHERE attendantID IN (SELECT studentID
FROM Milestone2.dbo.Student)) BEGIN
    INSERT INTO Milestone2.dbo.MeetingAttendants
        (meetingID, attendantID)
    VALUES
        (@meeting_id, @sid)
END
GO
DROP PROC BookMeeting
EXEC BookMeeting @sid = 2, @meeting_id = 3

--3j)
CREATE PROCEDURE ViewMeeting
    @meeting_id INT,
    @sid INT
AS
IF (@meeting_id = NULL) BEGIN
    SELECT *
    FROM Milestone2.dbo.MeetingAttendants
        INNER JOIN Milestone2.dbo.MeetingToDoList ON MeetingAttendants.meetingID = MeetingToDoList.meetingID
        INNER JOIN Milestone2.dbo.Meeting ON MeetingAttendants.meetingID = Meeting.meetingID
    WHERE Meeting.meetingID = @meeting_id AND MeetingAttendants.attendantID = @sid
END
ELSE BEGIN
    SELECT *
    FROM Milestone2.dbo.MeetingAttendants
        INNER JOIN Milestone2.dbo.Meeting ON MeetingAttendants.meetingID = Meeting.meetingID
    WHERE Meeting.meetingID = @meeting_id AND MeetingAttendants.attendantID = @sid
END
GO
--3k)
GO
CREATE PROCEDURE StudentAddToDo
    @meeting_id INT,
    @to_do_list VARCHAR(200)
AS
INSERT INTO Milestone2.dbo.MeetingToDolist
    (meetingID, toDoList)
VALUES
    (@meeting_id, @to_do_list)
GO

--7a)
CREATE PROCEDURE EEGradeThesis
    @EE_id INT,
    @sid INT,
    @thesis_title VARCHAR(50),
    @EE_grade DECIMAL(4,2)
AS
INSERT INTO Milestone2.dbo.AcademicThesisGrade
    (EEID, studentID, title, externalExaminerGrade)
VALUES
    (@EE_id, @sid, @thesis_title, @EE_grade)
GO

--7b)
CREATE PROCEDURE EEGradedefense
    @EE_id INT,
    @sid INT,
    @defense_location VARCHAR(5),
    @EE_grade DECIMAL(4,2)
AS
INSERT INTO Milestone2.dbo.AcademicDefenseGrade
    (EEID, studentID, gradingLocation, externalExaminerGrade)
VALUES
    (@EE_id, @sid, @defense_location, @EE_grade)
GO

DECLARE @tempOutput1 INT
DECLARE @tempOutput2 VARCHAR(10)

EXEC UserRegister
@tempOutput1 OUTPUT,
@tempOutput2 OUTPUT,
@userType = 'Coordinators',
@userName = 'coord1',
@email = 'coord1@mail.com',
@first_name = NULL,
@last_name = NULL,
@birth_date = NULL,
@GPA = NULL,
@semester = NULL,
@address = NULL,
@faculty_code = NULL,
@major_code = NULL,
@company_name = NULL,
@representative_name = NULL,
@representative_email = NULL,
@phone_number = '654654654'

INSERT INTO Milestone2.dbo.Faculty
VALUES
    ('fac1', 'Computer Science', 1)
INSERT INTO Milestone2.dbo.Major
VALUES
    ('testMajor1', 'fac1', 'Data Science')