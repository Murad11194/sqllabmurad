# SQL & Relational Database Design - Student Assignment Pack

This repository contains the complete solutions for the SQL & Relational Database Design student assignment pack, including database setup, foundational SQL tasks, business scenario queries, and ERD project breakdowns.

---

## Repository Contents
- **`numbered.sql`**: Contains all table creation scripts, sample data inserts, foundational SQL exercises (Tasks 1-10), and SalesDB business scenarios (Assignments 1, 2, and 3).
- **ERD Projects**: Conceptual relationship breakdowns for Assignments 4 and 5.

---

## Assignment 4: Sales Database (ERD) - Written Answers & Explanations

### 1. Primary Keys (PK)
* **`Customers`**: `CustomerID`
* **`Products`**: `ProductID`
* **`Employees`**: `EmployeeID`
* **`Orders`**: `OrderID`

### 2. Foreign Keys (FK)
* **`Orders.ProductID`** $\rightarrow$ `Products.ProductID`
* **`Orders.CustomerID`** $\rightarrow$ `Customers.CustomerID`
* **`Orders.SalesPersonID`** $\rightarrow$ `Employees.EmployeeID`
* **`Employees.ManagerID`** $\rightarrow$ `Employees.EmployeeID` (Self-referencing manager relationship)

### 3 & 7. Relationship Descriptions
* **Customer to Orders (1:N):** Each customer has a unique identifier. A customer can place multiple orders, but every order belongs to one customer.
* **Product to Orders (1:N):** Each product has a unique identifier. A product may appear in many order records, but each order record refers to one product.
* **Employee to Orders (1:N):** Each employee has a unique identifier. One sales employee may process multiple orders; each order is assigned to one sales employee.
* **Employee to Employee / Manager (1:N):** An employee may report to another employee who acts as a manager. A manager can supervise several employees.

---

## Assignment 5: University Course Registration Database (ERD) - Written Answers & Explanations

### 1. Primary Keys (PK)
* **`Students`**: `StudentID`
* **`Instructors`**: `InstructorID`
* **`Courses`**: `CourseID`
* **`Enrollments`**: `EnrollmentID`

### 2. Foreign Keys (FK)
* **`Courses.InstructorID`** $\rightarrow$ `Instructors.InstructorID`
* **`Enrollments.StudentID`** $\rightarrow$ `Students.StudentID`
* **`Enrollments.CourseID`** $\rightarrow$ `Courses.CourseID`

### 5, 6 & 7. Relationship & Design Explanations
* **Role of the `Enrollments` table:** This table acts as a junction table to resolve the many-to-many (M:N) relationship between students and courses. It generates a unique `EnrollmentID` for each registration, links a student to a course, and stores the enrollment date, grade, and status.
* **Short relationship definitions:**
  * **Students and Courses (M:N):** A student may register for several courses, and a course may have several students.
  * **Instructors and Courses (1:N):** Each course is taught by one instructor, and an instructor may teach several courses.
* **Preventing duplicate registration:** To prevent a student from being registered twice for the same course, a Unique Constraint is applied to the combination of `StudentID` and `CourseID` within the `Enrollments` table.