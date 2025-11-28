/*
# Student Records Management System
*/

/*
## Build A Student Records Management System

**A Student Records Management System** is a database-driven application designed to manage student information efficiently. It includes tasks like adding students, updating student details, tracking academic performance, and generating reports.
*/

/*
**Creating the Database in MySQL or PostgreSQL:**

**Create the Database:**
*/

CREATE DATABASE StudentRecordDB;

use StudentRecordDB

/*
Create the Tables:

**Students Table:**

Stores student information.

**Structure:**

| Column Name | Data Type | Description |
| --- | --- | --- |
| student\_id | INT | Unique identifier for each student (Primary Key) |
| name | VARCHAR(255) | Full name of the student |
| email | VARCHAR(255) | Email address of the student |
| phone\_number | VARCHAR(15) | Contact number |
| enrollment\_date | DATE | Date when the student enrolled |
*/

CREATE TABLE Students(

    student_id int not NULL auto_increment PRIMARY KEY,

    name VARCHAR (225) not null,

    email varchar(225),

    phone_number varchar (15),

    enrollment_date date DEFAULT (CURRENT_DATE)

);

/*
**Teachers Table:**

Stores information about the teachers.

**Structure:**

| Column Name | Data Type | Description |
| --- | --- | --- |
| teacher\_id | INT | Unique identifier for each teacher (Primary Key) |
| name | VARCHAR(255) | Full name of the teacher |
| email | VARCHAR(255) | Email address of the teacher |
| hire\_date | DATE | Date the teacher was hired |
*/

CREATE TABLE Teachers(

    teacher_id int not null auto_increment PRIMARY key,

    name VARCHAR(225) not null,

    email varchar(225),

    hire_date DATE DEFAULT(CURRENT_DATE)

)

/*
**Courses Table:**

Stores information about the courses offered.

**Structure:**

| Column Name | Data Type | Description |
| --- | --- | --- |
| course\_id | INT | Unique identifier for each course (Primary Key) |
| course\_name | VARCHAR(255) | Name of the course |
| teacher\_id | INT | Foreign Key (references Teachers) |
*/

create TABLE Courses

(

    course_id int not NULL auto_increment PRIMARY KEY,

    course_name varchar(100) not NULL,

    teacher_id int,

    FOREIGN KEY(teacher_id) REFERENCES teachers(teacher_id)

)

/*
**Enrollments Table:**

Manages student enrollments in courses.

**Structure:**

| Column Name | Data Type | Description |
| --- | --- | --- |
| enrollment\_id | INT | Unique identifier for each enrollment(Primary Key |
| student\_id | INT | Foreign Key (references Courses) |
| course\_id | INT | Foreign Key (references Courses) |
| enrollment\_date | DATE | Date the student enrolled in the course |
*/

CREATE TABLE Enrollments (
    enrollment_id INT NOT NULL auto_increment PRIMARY KEY,
    student_id int,
    course_id INT,
    enrollment_date DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN key (course_id) REFERENCES Courses(course_id)
)

/*
**Grades Table:**

Stores the grades students receive in courses.

**Structure:**

| Column Name | Data Type | Description |
| --- | --- | --- |
| grade\_id | INT | Unique identifier for each grade (Primary Key) |
| student\_id | INT | Foreign Key (references Courses) |
| course\_id | INT | Foreign Key (references Courses) |
| grade | CHAR(2) | Grade received by the student |
*/

create table Grades(

    grade_id int not null auto_increment PRIMARY key,

    student_id int,

    course_id int,

    grade char(2),

    FOREIGN KEY(student_id) REFERENCES students(student_id),

    FOREIGN KEY(course_id) REFERENCES courses(course_id)

)

/*
**Inserting Data:**

Add some sample data to the tables.

**Inserting into the Students Table:**
*/

-- Insert student records into the Students table

INSERT INTO Students (name, email, phone_number) VALUES

(' Liam Gentry', 'lima@example.com', '1234567890'),

(' Lyric Glass', 'lyric@example.com', '0987654321'),

('Mk Singh','mks33120@gmail.com','930423622'),

('Rk Singh','rakesh431@gmail.com','7319999042');

/*
**Inserting into the Teachers Table:**
*/

-- Insert teacher records into the Teachers table

INSERT INTO Teachers (name, email) VALUES

(' Aiden Nichols', 'alice@example.com'),

(' Beau Booth', 'beau@example.com'),

('Prity Singh','prity123@gmail.com'),

('Sonam tiwari','sonam124@gmail.com');

/*
**Inserting into the Courses Table:**
*/

-- Insert course records into the Courses table, associating each course with a teacher

INSERT INTO Courses (course_name, teacher_id) VALUES

('Mathematics', 1),

('Physics', 2),

('Chemistry', 3),

('Biology', 4);



/*
**Inserting into the Enrollments Table:**
*/

-- Insert enrollment records for students into courses

INSERT INTO Enrollments (student_id, course_id) VALUES

(1, 1), -- Student 1 enrolls in Course 1

(2, 2), -- Student 2 enrolls in Course 2

(3, 3), -- Student 3 enrolls in Course 3

(4, 1); -- Student 4 enrolls in Course 1

/*
**Inserting into the Grades Table:**
*/

-- Insert grade records for students in their respective courses

INSERT INTO Grades (student_id, course_id, grade) VALUES

(1, 1, 'A'), -- Student 1 gets grade 'A' in Course 1

(2, 2, 'B'), -- Student 2 gets grade 'B' in Course 2

(3, 3, 'A'), -- Student 3 gets grade 'A' in Course 3

(4, 1, 'C'); -- Student 4 gets grade 'C' in Course 1

/*
**Basic Functionalities:**

- Add new students, courses, and grades.
- Track which students are enrolled in which courses.
- Generate reports on student performance.
*/

/*
**Writing Queries for Functionality:**
*/

/*
**Query-1: Add a New Student**
*/

-- Insert a new student record into the Students table with name, email, and phone number

INSERT INTO Students (name, email, phone_number) VALUES

-- Values for the new student: 'Julio Stokes', 'julio@example.com', '0987654321'

('Julio Stokes', 'julio@example.com', '0987654321'),

('Aman','aman542@gmail.com','7845864587'),

('Danny ','danny45@gmail.com','4563245214'),

('Jack','jack@gmail.com','4512563548');

/*
**Query-2: Enroll a Student in a Course**
*/

-- Insert a new enrollment record into the Enrollments table

INSERT INTO Enrollments (student_id, course_id) VALUES

-- Enroll student 1 in course 2

(1, 2),

(2, 3),

(3, 1),

(4, 4);



/*
**Query-3: Assign a Grade to a Student**
*/

-- Insert a new grade record into the Grades table

INSERT INTO Grades (student_id, course_id, grade) VALUES

-- Assign grade 'A' to student 1 in course 2

(1, 2, 'A'),

(2, 3, 'B+'),

(3, 1, 'A-'),

(4, 4, 'B');



SELECT *from courses

select *FROM enrollments

SELECT *FROM grades

SELECT *FROM students

SELECT *FROM teachers

/*
**Query-4: List All Students Enrolled in a Course**
*/

-- Select student names and course name for students enrolled in course 1

SELECT s.name, c.course_name, e.enrollment_date

FROM Students s

JOIN Enrollments e ON s.student_id = e.student_id

JOIN Courses c ON e.course_id = c.course_id

    WHERE c.course_id = 1;

/*
**Query-5: View Student's Grades**
*/

-- Select student name, course name, and grade for student 1

SELECT s.name, c.course_name, g.grade

FROM Students s

JOIN Grades g ON s.student_id = g.student_id

JOIN Courses c ON g.course_id = c.course_id

WHERE s.student_id = 1;

/*
**Query-6: Update a Student’s Contact Information**
*/

UPDATE students

SET phone_number = '9053640558'

WHERE student_id = 3;

/*
**Query-7: Remove a Student from a Course**
*/

DELETE from enrollments

WHERE student_id=4 and course_id=3;



/*
**Query-8: View All Courses Taught by a Specific Teacher**
*/

select course_name

FROM Courses

WHERE teacher_id=5;

/*
**<mark>Query-9: Count the Number of Students in a Course</mark>**
*/

SELECT COUNT(*) AS Total_students

FROM enrollments

WHERE course_id = 1;

/*
**Query-10: List Students Who Have Not Yet Been Assigned a Grade**
*/

SELECT s.name

FROM students s

LEFT JOIN grades g ON s.student_id = g.student_id

WHERE g.student_id IS NULL;

/*
**Query-11: Calculate the Average Grade for a Course**
*/

-- Find the average grade for course 1 (assuming grades are stored as characters, e.g., 'A' = 4, 'B' = 3, etc.).

-- Calculate the average grade point for students in course 1

SELECT AVG(

    CASE 

        -- Assign a numeric value for each letter grade

        WHEN grade = 'A' THEN 4

        WHEN grade = 'B' THEN 3

        WHEN grade = 'C' THEN 2

        WHEN grade = 'D' THEN 1

        -- Assign 0 for any grade that is not A, B, C, or D

        ELSE 0

    END) AS avg_grade

-- From the Grades table

FROM Grades

-- Filter to include only grades for course_id 1

WHERE course_id = 1;



/*
**Query-12: Find the Highest Grade Assigned in a Course**
*/

SELECT MAX(grade) as higest_grade

FROM grades

where course_id = 4;

/*
**Query-15: Find the Total Number of Courses Each Student is Enrolled In**
*/

-- Retrieve student names along with the count of courses they are enrolled in

SELECT s.name, COUNT(e.course_id) AS total_courses

-- From the Enrollments table, using an alias 'e'

FROM Enrollments e

-- Join with the Students table based on student_id to link enrollments with student names

JOIN Students s ON e.student_id = s.student_id

-- Group the results by student name to get total courses for each student

GROUP BY s.name;



/*
**Query-16: List All Courses a Student is Enrolled In**
*/

-- Retrieve the names of courses that student with ID 1 is enrolled in

SELECT c.course_name

-- From the Enrollments table, using an alias 'e'

FROM Enrollments e

-- Join with the Courses table based on course_id to link enrollments with course names

JOIN Courses c ON e.course_id = c.course_id

-- Filter the results to include only the enrollments of the specified student

WHERE e.student_id = 1;



/*

*/