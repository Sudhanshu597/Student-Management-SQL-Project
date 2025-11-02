
-- Database creation
CREATE DATABASE IF NOT EXISTS studentdb;
USE studentdb;

-- Students table
CREATE TABLE IF NOT EXISTS students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    gender VARCHAR(10),
    dob DATE
);

-- Courses table
CREATE TABLE IF NOT EXISTS courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    credits INT
);

-- Enrollments table
CREATE TABLE IF NOT EXISTS enrollments (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Insert sample data into students
INSERT INTO students (id, name, email, gender, dob) VALUES
(1, 'Amit Sharma', 'amit@gmail.com', 'Male', '2001-05-12'),
(2, 'Sneha Gupta', 'sneha@gmail.com', 'Female', '2000-09-23'),
(3, 'Rahul Verma', 'rahul@gmail.com', 'Male', '2002-01-15');

-- Insert sample data into courses
INSERT INTO courses (course_id, course_name, credits) VALUES
(101, 'Database Management', 4),
(102, 'Python Programming', 3),
(103, 'Data Analytics', 5);

-- Insert sample data into enrollments
INSERT INTO enrollments (enroll_id, student_id, course_id, grade) VALUES
(1001, 1, 101, 'A'),
(1002, 1, 102, 'B'),
(1003, 2, 103, 'A'),
(1004, 3, 101, 'B'),
(1005, 3, 103, 'A');

-- Query 1: Fetch all students with their courses and grades
SELECT s.name, c.course_name, e.grade
FROM students s
JOIN enrollments e ON s.id = e.student_id
JOIN courses c ON c.course_id = e.course_id;

-- Query 2: Count of students enrolled in each course
SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;
