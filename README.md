# AttachME - Student Attachment Platform

**AttachME** is a student attachment (internship) management system built to simplify the connection between students and companies. The platform allows students to apply for internships, companies to post opportunities, and admins to manage users and system integrity.

 **Live Repository:**  
https://github.com/owuorviny109/AttachME-student-attachment-platform.git


##  Features

-  Student Registration, Resume Upload, Profile Management  
-  Company Account Management & Internship Posting  
-  Internship Applications Tracking  
-  Secure Messaging between Students and Companies  
-  System Notifications for Application Updates  
-  Company Feedback on Student Applications  
-  Role-Based Access Control (Students, Companies, Admins)  
-  Daily Backup Script for Database Recovery  

 

##  Database Structure

| Table         | Description                              |
|---------------|------------------------------------------|
| `students`    | Stores student profiles and resumes      |
| `companies`   | Stores company accounts and job details  |
| `attachments` | Internship/job listings by companies     |
| `applications`| Student applications for internships     |
| `notifications`| System messages to users                |
| `messages`    | Secure messaging between users           |
|  `admins`      |  Admin system management   

 

## ⚙️ Setup Instructions

1. **Clone the Repository**

   git clone https://github.com/owuorviny109/AttachME-student-attachment-platform.git
   cd AttachME-student-attachment-platform

Database Setup
Create the database:
CREATE DATABASE attachme;

Import schema:
mysql -u root -p attachme < database/schema.sql


Configure Environment
Update your .env or config file:
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=" "
DB_NAME=attachme


Run Application


Security & Best Practices
Passwords are securely hashed (password_hash in DB)

Unique constraints for emails to prevent duplicates

Foreign keys ensure relational integrity

Backups:

Daily automated with bash script:
mysqldump -u root -p attachme > /home/user/backups/db_backup_$(date +%F).sql

Restore with:
mysql -u root -p attachme < /path/to/latest_backup.sql

 

