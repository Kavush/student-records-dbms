# Student Records Management System (MySQL)

## 📌 Project Overview
This project is a **Student Records Management System** implemented in **MySQL**.  
It was developed as part of my Database Management Systems (DBMS) assignment.  

The database models a real-world academic environment, including:
- Students  
- Teachers  
- Departments  
- Courses  
- Enrollments  

## 📂 Database Schema
The database consists of the following tables:

1. **Students** – stores student personal details and admission records.  
2. **Teachers** – stores teacher details and specialties.  
3. **Departments** – stores departments and their heads.  
4. **Courses** – stores courses offered, linked to teachers and departments.  
5. **Enrollments** – stores student enrollments into courses.  

## 🛠 Features
- **Relational Schema** with proper **constraints**:
  - Primary Keys  
  - Foreign Keys  
  - Unique Constraints  
  - ENUM for gender  
- Relationships:
  - One-to-Many (Departments → Courses)  
  - One-to-Many (Teachers → Courses)  
  - Many-to-Many (Students ↔ Courses via Enrollments)  
- Prevents duplicate enrollments.  
- Cascading updates and deletions handled with **ON UPDATE CASCADE** and **ON DELETE CASCADE/SET NULL**.  

## 🚀 How to Run
1. Clone this repository or download the `student_records.sql` file.  
2. Open MySQL and create a new database (optional):  

   ```sql
   CREATE DATABASE student_records_db;
   USE student_records_db;
   ```


3. Import the SQL script:

mysql -u root -p student_records_db < student_records.sql


4. Verify the tables:  

   ```sql
   SHOW TABLES;
   ```



📊 Sample Data

The database includes:

20 Students

5 Teachers

5 Departments

5 Courses

20 Enrollments

This provides enough sample data to test queries and relationships.

📖 Example Queries
```sql
-- Get all students with their enrolled courses
SELECT s.first_name, s.last_name, c.course_name
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id;

-- Find all courses under 'Web Development' department
SELECT c.course_name
FROM Courses c
JOIN Departments d ON c.department_id = d.department_id
WHERE d.department_name = 'Web Development';
```


👤 Author  

Esther Kavata Alfred  
Assignment for Database Management Systems (DBMS)  
