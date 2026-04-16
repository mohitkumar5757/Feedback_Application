# Feedback Management System (Servlet Based)

This is a web-based feedback application developed using Java Servlets, JSP, and JDBC.
The project is built as part of learning core Java web development concepts without using Spring Boot or any frameworks.

## Technologies Used

* Java (Servlets and JSP)
* JDBC (Database Connectivity)
* MySQL
* Apache Tomcat Server
* HTML, CSS, Bootstrap

## Project Type

This project is built using:

* Java Servlets (not Spring Boot)
* JSP for frontend
* JDBC for database interaction

It is a basic full-stack web application created while learning Servlets.

## Features

* User Signup
* User Login
* Session Management
* Logout Functionality
* Feedback Submission Form
* Store Feedback in Database
* View All Feedback in Table Format
* Authentication-based access (login required for feedback)

## Database

Database Name: feedback_db

### Users Table

* id
* email
* password

### Feedback Table

* id
* user_email
* phone
* message
* created_at

## How It Works

1. User registers using signup form
2. User logs in using email and password
3. Session is created after login
4. Only logged-in users can submit feedback
5. Feedback is stored in MySQL database using JDBC
6. All feedback can be viewed in a table

## Key Concepts Covered

* Java Servlets
* HTTP Requests and Responses
* Session Handling
* JDBC Connectivity
* PreparedStatement
* MVC Basic Structure
* Form Handling
* Redirect and Forward

## Important Note

This project is created for learning purposes using Servlets and JSP.
No frameworks like Spring Boot are used.

## Future Improvements

* Password encryption
* Form validation
* Admin dashboard
* Delete and update feedback
* Role-based access control

