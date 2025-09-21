-- ===============================
-- Student Records Management System
-- ===============================

-- 1. Students Table
CREATE TABLE Students(
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male','Female','Other') NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    admission_date DATE NOT NULL
);

-- Insert Students
INSERT INTO Students (first_name,last_name,date_of_birth,gender,email,admission_date) 
VALUES 
('Pravin','Mogeni','2002-05-12','Male','pravinokeri3@gmail.com','2024-02-01'),
('Joyce','Musembi','2002-08-25','Female','joycemwikali6@gmail.com','2024-03-02'),
('Andrew', 'Musyoka', '1995-08-05', 'Male', 'andrew.m.musyoka@gmail.com', '2025-05-01'),
('Isaac', 'Ganda',  '2002-09-01', 'Male', 'aizohwillmakeit@gmail.com', '2025-05-01'),
('Irene', 'Dzombo', '1999-12-06', 'Female', 'irenedzombo@gmail.com', '2024-02-01'),
('Ali', 'Abel', '1998-08-09', 'Female', 'aliabel900@gmail.com', '2025-04-03'), 
('Marlin', 'Mkawanyika', '1999-07-27', 'Female', 'marlinmkawanyika@gmail.com', '2025-04-20'),
('Caroline', 'Shighare', '2005-08-28', 'Female', 'carolineshighare@gmail.com', '2024-03-20'),
('Patience', 'Mzera', '2004-07-27', 'Female', 'patiencemzera@gmail.com', '2025-06-04'),
('Ahmed', 'Saad', '2005-07-23', 'Male', 'ahmedfauz678@gmail.com', '2025-02-03'),
('Walid', 'Uthman','2006-04-09', 'Male', 'walidmustafa@gmail.com', '2025-06-09'),
('Aziz', 'Munga', '2006-05-20', 'Male', 'azaphenia@gmail.com', '2025-05-01'),
('Swafaa', 'Hussein', '2004-04-03', 'Female', 'swafaahussein5116@gmail.com', '2025-02-04'),
('Idman', 'Deghow','1998-05-26', 'Female', 'moraaf100@gmail.com', '2025-01-03'),
('Ronny', 'Kaberia', '2006-04-26', 'Male', 'ronnykaberia9@gmail.com', '2025-07-25'),
('Annah', 'Barasa', '1999-11-04', 'Female', 'charlesbarasa02@gmail.com', '2024-04-24'),
('Ismail', 'Shee', '2006-04-21', 'Male', 'ismailshee8@gmail.com', '2025-06-03'),
('Daniel', 'Juma', '1998-01-01', 'Male', 'juma66919@gmail.com', '2025-05-04'),
('Fathiya', 'Juma', '2004-03-29', 'Female', 'fathiya86005@gmail.com', '2025-07-01'),
('Joyce', 'Otieno', '2006-01-20', 'Female', 'mamiike007@gmail.com', '2025-02-02');



-- 2. Teachers Table
CREATE TABLE Teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(50) NOT NULL,
    phone VARCHAR(15),
    hire_date DATE NOT NULL
);

-- Insert Teachers
INSERT INTO Teachers (first_name,last_name,specialty,phone,hire_date)
VALUES 
('Fred', 'Mukoba','Web Design', '0790987654', '2020-01-01'),
('Simon', 'Muraya','ICT', '0719478257', '2018-01-03'),
('Ali', 'Almasi', 'ICDL', '0715750729', '2024-02-03'),
('Elsa', 'Otieno', 'Graphic Design', '0718254673', '2024-04-02'),
('Jackson', 'Wambua', 'Autocad', '0701651584', '2024-09-04');



-- 3. Departments Table
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    head_of_department INT,
    FOREIGN KEY (head_of_department) REFERENCES Teachers(teacher_id)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- Insert Departments
INSERT INTO Departments (department_name, head_of_department) 
VALUES
('Computer Packages', 1),
('Design and Animation', 3),
('Web Development', 2),
('Information Technology', 4),
('Engineering', 5);



-- 4. Courses Table (now includes department_id directly)
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    teacher_id INT,
    department_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
        ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- Insert Courses (with department_id)
INSERT INTO Courses (course_name, course_code, teacher_id, department_id) 
VALUES 
('ICDL', '101',1, 1),
('Web Design', '102', 2, 3),
('Graphic Design', '103', 3, 2),
('ICT', '104', 4, 4),
('Autocad', '105', 5, 5);



-- 5. Enrollments Table
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    UNIQUE(student_id, course_id) -- Prevent duplicate enrollments
);

-- Insert Enrollments
INSERT INTO Enrollments (student_id, course_id, enrollment_date) 
VALUES
(1, 1, '2024-02-01'),
(2, 2, '2024-03-02'),
(3, 3, '2025-05-01'),
(4, 4, '2025-05-01'),
(5, 5, '2024-02-01'),
(6, 1, '2025-04-03'),
(7, 2, '2025-04-20'),
(8, 3, '2024-03-20'),
(9, 4, '2025-06-04'),
(10, 5, '2025-02-03'),
(11, 1, '2025-06-09'),
(12, 2, '2025-05-01'),
(13, 3, '2025-02-04'),
(14, 4, '2025-01-03'),
(15, 5, '2025-07-25'),
(16, 1, '2024-04-24'),
(17, 2, '2025-06-03'),
(18, 3, '2025-05-04'),
(19, 4, '2025-07-01'),
(20, 5, '2025-02-02');
