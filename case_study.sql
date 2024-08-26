create database student_management_7_to_9; 
  
use student_management_7_to_9; 
  
CREATE TABLE Students ( 
    StudentID INT PRIMARY KEY, 
    Name VARCHAR(255), 
    DateOfBirth DATE, 
    GradeLevel INT 
); 
  
CREATE TABLE Teachers ( 
    TeacherID INT PRIMARY KEY, 
    Name VARCHAR(255), 
    Subject VARCHAR(255) 
); 
  
CREATE TABLE Courses ( 
    CourseID INT PRIMARY KEY, 
    CourseName VARCHAR(255), 
    TeacherID INT, 
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID) 
); 
  
CREATE TABLE Enrollments ( 
    EnrollmentID INT PRIMARY KEY, 
    StudentID INT, 
    CourseID INT, 
    EnrollmentDate DATE, 
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID), 
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
); 
  
  
  
INSERT INTO Students (StudentID, Name, DateOfBirth, GradeLevel) VALUES 
    (1, 'Alice Johnson', '2005-03-15', 9), 
    (2, 'Bob Smith', '2004-08-22', 10), 
    (3, 'Charlie Brown', '2006-05-10', 8), 
     (4, 'Van Johnson', '2005-03-15', 9), 
    (5, 'Smith hen', '2004-08-22', 10), 
    (6, ' Brown', '2006-05-10', 8); 
    
    
   
  
INSERT INTO Teachers (TeacherID, Name, Subject) VALUES 
    (1, 'Ms. Davis', 'Math'), 
    (2, 'Mr. Johnson', 'English'), 
    (3, 'Mrs. Smith', 'Science'); 
  
INSERT INTO Courses (CourseID, CourseName, TeacherID) VALUES 
    (101, 'Algebra', 1), 
    (102, 'Literature', 2), 
    (103, 'Biology', 3), 
     (104, 'Geomentry', 1), 
    (105, 'Zoology', 3); 
  
  
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES 
    (1001, 1, 101, '2023-01-15'), 
    (1002, 2, 102, '2023-02-20'), 
    (1003, 3, 103, '2023-03-25'); 
    
    
    select avg(gradelevel) from students;
    
    select * from teachers;
    
    select teacherID,count(coursename) from courses group by teacherID;
    
    select t.Name,count(c.courseID) from teachers t
    left join
    courses c
    on t.teacherID=c.teacherID
    group by t.Name;
    
    -- USING ---
    select * from teachers t
    left join
    courses c
    using (TeacherID);
    
    
    select * from STUDENTs;
    select * from enrollments;
    
    create view four_table as
    select s.name,t.name as teacher_name from students s
    left join
    enrollments e
    using (studentID)
    left join 
    courses c
    using (courseID)
    left join 
    teachers t
    using(teacherID);
    
   select * from four_table; 
    
    
    
    