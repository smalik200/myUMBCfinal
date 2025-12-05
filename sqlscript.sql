-- Drop tables if they already exist
DROP TABLE IF EXISTS Notification CASCADE;
DROP TABLE IF EXISTS Recommendation CASCADE;
DROP TABLE IF EXISTS Review CASCADE;
DROP TABLE IF EXISTS Enrollment CASCADE;
DROP TABLE IF EXISTS Course CASCADE;
DROP TABLE IF EXISTS SemesterPlan CASCADE;
DROP TABLE IF EXISTS DegreePlan CASCADE;
DROP TABLE IF EXISTS Advisor CASCADE;
DROP TABLE IF EXISTS Student CASCADE;

-- 1. STUDENT TABLE
CREATE TABLE Student (
    student_id     INT PRIMARY KEY,
    name           VARCHAR(100),
    email          VARCHAR(100),
    major          VARCHAR(100),
    minor          VARCHAR(100),
    gpa            NUMERIC(3,2),
    total_credits  INT
);

-- 2. ADVISOR TABLE
CREATE TABLE Advisor (
    advisor_id  INT PRIMARY KEY,
    name        VARCHAR(100),
    email       VARCHAR(100),
    department  VARCHAR(100)
);

-- 3. DEGREEPLAN TABLE
CREATE TABLE DegreePlan (
    plan_id            INT PRIMARY KEY,
    student_id         INT REFERENCES Student(student_id),
    advisor_id         INT REFERENCES Advisor(advisor_id),
    major              VARCHAR(100),
    expected_grad_year INT,
    status             VARCHAR(20),
    last_updated       TIMESTAMP
);

-- 4. SEMESTERPLAN TABLE
CREATE TABLE SemesterPlan (
    semester_id   INT PRIMARY KEY,
    plan_id       INT REFERENCES DegreePlan(plan_id),
    semester_name VARCHAR(20),
    total_credits INT
);

-- 5. COURSE TABLE
CREATE TABLE Course (
    course_id     INT PRIMARY KEY,
    course_code   VARCHAR(10),
    course_name   VARCHAR(100),
    credits       INT,
    prerequisites VARCHAR(255),
    department    VARCHAR(50)
);

-- 6. ENROLLMENT TABLE
CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY,
    semester_id   INT REFERENCES SemesterPlan(semester_id),
    course_id     INT REFERENCES Course(course_id),
    grade         VARCHAR(2)
);

-- 7. REVIEW TABLE
CREATE TABLE Review (
    review_id       INT PRIMARY KEY,
    student_id      INT REFERENCES Student(student_id),
    course_id       INT REFERENCES Course(course_id),
    professor_name  VARCHAR(100),
    rating          INT,
    comment         TEXT,
    date_posted     TIMESTAMP,
    approved        BOOLEAN
);

-- 8. RECOMMENDATION TABLE
CREATE TABLE Recommendation (
    recommendation_id INT PRIMARY KEY,
    student_id        INT REFERENCES Student(student_id),
    course_id         INT REFERENCES Course(course_id),
    reason            TEXT,
    semester_suggested VARCHAR(20),
    status            VARCHAR(20)
);

-- 9. NOTIFICATION TABLE
CREATE TABLE Notification (
    notification_id INT PRIMARY KEY,
    student_id      INT REFERENCES Student(student_id),
    message         TEXT,
    type            VARCHAR(50),
    date_sent       TIMESTAMP,
    read_status     BOOLEAN
);

-- Sample data Insert

-- STUDENT
INSERT INTO Student VALUES
(1001, 'Alice Nguyen',  'anguyen1@umbc.edu', 'Computer Science',      'Mathematics', 3.85, 90),
(1002, 'Brandon Lee',   'blee2@umbc.edu',   'Information Systems',    NULL,          3.40, 75),
(1003, 'Chloe Smith',   'csmith3@umbc.edu', 'Mechanical Engineering', 'Physics',     3.67, 105);

-- ADVISOR
INSERT INTO Advisor VALUES
(2001, 'Dr. Karen Holt',   'kholt@umbc.edu', 'Computer Science & Electrical Engineering'),
(2002, 'Prof. Michael Tran','mtran@umbc.edu','Information Systems'),
(2003, 'Dr. Ana Rivera',   'arivera@umbc.edu','Mechanical Engineering');

-- DEGREEPLAN
INSERT INTO DegreePlan VALUES
(3001, 1001, 2001, 'Computer Science',         2026, 'Approved',  NOW()),
(3002, 1002, 2002, 'Information Systems',      2025, 'Submitted', NOW()),
(3003, 1003, 2003, 'Mechanical Engineering',   2027, 'Draft',     NOW());

-- SEMESTERPLAN
INSERT INTO SemesterPlan VALUES
(4001, 3001, 'Fall 2025',   15),
(4002, 3002, 'Spring 2025', 12),
(4003, 3003, 'Fall 2026',   16);

-- COURSE
INSERT INTO Course VALUES
(5001, 'CMSC202', 'Computer Science II', 4, 'CMSC201', 'Computer Science'),
(5002, 'IS310',   'Database Design',     3, 'IS210',   'Information Systems'),
(5003, 'ENME301', 'Dynamics',            3, 'ENME101', 'Mechanical Engineering');

-- ENROLLMENT
INSERT INTO Enrollment VALUES
(6001, 4001, 5001, 'A'),
(6002, 4002, 5002, 'B'),
(6003, 4003, 5003, NULL);

-- REVIEW
INSERT INTO Review VALUES
(7001, 1001, 5001, 'Dr. Jessica Park', 5,
 'Great lectures and clear assignments.', NOW(), TRUE),
(7002, 1002, 5002, 'Prof. Li Chen', 4,
 'Challenging but rewarding.', NOW(), TRUE),
(7003, 1003, 5003, 'Dr. Raj Patel', 3,
 'Interesting material but fast-paced.', NOW(), FALSE);

-- RECOMMENDATION
INSERT INTO Recommendation VALUES
(8001, 1001, 5002, 'Good complement for database systems knowledge.',
 'Spring 2026', 'Pending'),
(8002, 1002, 5001, 'To strengthen programming fundamentals.',
 'Fall 2025', 'Accepted'),
(8003, 1003, 5003, 'Core requirement for major completion.',
 'Fall 2026', 'Pending');

-- NOTIFICATION
INSERT INTO Notification VALUES
(9001, 1001, 'Your degree plan was approved.',          'Approval',    NOW(), TRUE),
(9002, 1002, 'Missing prerequisite for IS310.',         'Prerequisite',NOW(), FALSE),
(9003, 1003, 'Course ENME301 added to plan.',           'Update',      NOW(), TRUE);

COMMIT;
