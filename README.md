# User Access Management System

## Overview

The **User Access Management System** is a web-based platform designed to streamline the management of software access requests. The system supports three user roles—**Employee**, **Manager**, and **Admin**—each with distinct functionalities to facilitate role-based access control. 

## Video of the project
https://drive.google.com/file/d/1nZLDLt7ZgaTTqSxyjmiBQN0JrrnlgNtM/view?usp=sharing

## Features

### For Employees
- **Sign Up & Log In**: Create an account and log in.
- **Request Access**: Submit access requests for specific software applications with the desired access levels and a reason.

### For Managers
- **View Pending Requests**: View access requests submitted by employees.
- **Approval Workflow**: Approve or reject access requests.

### For Admins
- **Create Software**: Add new software applications to the system.
- **Manage Access Levels**: Define access levels such as "Read", "Write", and "Admin" for each software.

---

## Technologies Used

### Backend
- **Java Servlets** for business logic.
- **PostgreSQL** as the database.

### Frontend
- **JSP (JavaServer Pages)** for dynamic rendering.
- **HTML/CSS/JavaScript** for styling and interactivity.

### Build and Deployment
- **Maven** as the build tool.
- **Apache Tomcat** as the web server.

---

## Installation and Setup

### Prerequisites
- **Java Development Kit (JDK)** (8 or higher)
- **Apache Maven**
- **Apache Tomcat**
- **PostgreSQL**

### Steps
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-repo-url.git
   cd UserAccessManagement
   ```

2. **Set Up the Database**:
   - Create the database and tables using the provided SQL scripts.
   - CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL CHECK (role IN ('Employee', 'Manager', 'Admin'))
);

CREATE TABLE software (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    access_levels TEXT NOT NULL CHECK (access_levels IN ('Read', 'Write', 'Admin'))
);

CREATE TABLE requests (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    software_id INT NOT NULL,
    access_type TEXT NOT NULL CHECK (access_type IN ('Read', 'Write', 'Admin')),
    reason TEXT NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('Pending', 'Approved', 'Rejected')),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (software_id) REFERENCES software(id)
);
   - Update `DatabaseConnection.java` with your PostgreSQL credentials.

3. **Build the Project**:
   ```bash
   mvn clean package
   ```

4. **Deploy the WAR File**:
   - Copy the WAR file generated in the `target/` directory to the `webapps/` directory of your Tomcat server.
   - Start Tomcat.

5. **Access the Application**:
   Open your browser and navigate to:
   ```
   http://localhost:8080/UserAccessManagement
   ```

---

## How to Use

### Employee
1. **Sign Up**:
   - Create an account via the signup page.
2. **Log In**:
   - Log in to access the **Request Access** page.
3. **Submit a Request**:
   - Choose a software application, access level, and provide a reason.

### Manager
1. **Log In**:
   - Log in to access the **Pending Requests** page.
2. **Approve or Reject Requests**:
   - Review and take action on employee access requests.

### Admin
1. **Log In**:
   - Log in to access the **Create Software** page.
2. **Add Software**:
   - Add new software applications to the system.






