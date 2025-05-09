 
-- Database: `attachme`

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `full_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `role` enum('admin','student','company','') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'admin',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` timestamp NULL DEFAULT NULL COMMENT 'Timestamp of last successful login',
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `email` (`email`),
  KEY `full_name` (`full_name`),
  KEY `role` (`role`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;



--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
CREATE TABLE IF NOT EXISTS `applications` (
  `applications_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `opportunities_id` int NOT NULL,
  `status` enum('Accepted','Rejected','Pending') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reviewed_at` timestamp NOT NULL,
  `feedback` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `cover_letter` mediumblob NOT NULL,
  `resume` mediumblob NOT NULL,
  PRIMARY KEY (`applications_id`),
  KEY `opportunities_id` (`opportunities_id`),
  KEY `status` (`status`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;


--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
CREATE TABLE IF NOT EXISTS `companies` (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `company_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `location` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `industry` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `role` enum('admin','student','company','') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'company',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Active','Inactive','','') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'Active',
  `logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `contact_email` (`email`),
  UNIQUE KEY `company_name` (`company_name`) USING BTREE,
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;


--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `messages_id` int NOT NULL AUTO_INCREMENT,
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `status` enum('sent','delivered','read','unread') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `sent_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`messages_id`),
  KEY `sender_id` (`sender_id`),
  KEY `receiver_id` (`receiver_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `notifications_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notifications_id`),
  KEY `user_id` (`user_id`,`is_read`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities`
--

DROP TABLE IF EXISTS `opportunities`;
CREATE TABLE IF NOT EXISTS `opportunities` (
  `opportunities_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `requirements` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `available_slots` int NOT NULL,
  `application_deadline` date NOT NULL,
  `status` enum('open','closed','','') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `location` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `company_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `duration` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`opportunities_id`),
  UNIQUE KEY `company_id_2` (`company_id`),
  UNIQUE KEY `company_id` (`company_id`) USING BTREE,
  KEY `title` (`title`,`application_deadline`,`status`),
  KEY `available_slots` (`available_slots`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `full_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `level` enum('Certificate','Diploma','Degree','Masters') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `year_of_study` int NOT NULL,
  `course` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `role` enum('student','admin','company','') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'student',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `picture` mediumblob,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `email` (`email`),
  KEY `email_2` (`email`),
  KEY `full_name` (`full_name`),
  KEY `level` (`level`,`year_of_study`,`course`,`role`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

 
 

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `role` enum('student','admin','company','') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `admin_id` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Active','Inactive','','') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `student_id` (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `student_id_2` (`student_id`),
  UNIQUE KEY `company_id` (`company_id`),
  UNIQUE KEY `admin_id` (`admin_id`),
  KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

 

--
-- Constraints for table `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`opportunities_id`) REFERENCES `opportunities` (`opportunities_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `applications_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

 
--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`notifications_id`) REFERENCES `students` (`student_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `opportunities`
--
ALTER TABLE `opportunities`
  ADD CONSTRAINT `opportunities_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
 