-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.21 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for flask_app
CREATE DATABASE IF NOT EXISTS `flask_app` /*!40100 DEFAULT CHARACTER SET utf8mb4  */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `flask_app`;

-- Dumping structure for table flask_app.education
CREATE TABLE IF NOT EXISTS `education` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `major` text,
  `start` text,
  `end` text,
  `university` text,
  `type` text,
  KEY `Index 1` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 ;

-- Dumping data for table flask_app.education: 28 rows
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` (`id`, `user_id`, `major`, `start`, `end`, `university`, `type`) VALUES
	(2, 1, 'Master degree in Computer Science (Economical Informatics)', '2009', '2010', 'Romanian-American University - Bucharest', 'school'),
	(1, 1, 'Bachelor degree in Computer Science (Managerial Informatics)', '2004', '2008', 'Romanian-American University - Bucharest', 'school'),
	(3, 1, 'Internal auditor', '2015', '', 'Rina Simpex Organism de certificare', 'course'),
	(4, 1, 'Public Speaker', '2017', '', 'Extreme Training', 'course'),
	(6, 1, 'CCNA 2 V6', 'June 2018', '', 'Cisco Network Academy', 'course'),
	(5, 1, 'CCNA 1 V6', 'December 2017', '', 'Cisco Network Academy', 'course'),
	(7, 1, 'Python Fundamentals', 'Oct 2018)', '', 'Bitacad', 'course'),
	(8, 1, 'Python Advanced', 'March 2019', '', 'Bitacad', 'course'),
	(9, 1, 'Certified Trainer', 'November 2019', '', 'Avis Budget Group', 'course'),
	(10, 1, 'Back-end Developer PHP Fundamentals', 'May 2020', '', 'Bitacad', 'course'),
	(11, 1, 'SQL Fundamentals and SQL Programming', 'June 2020', '', 'Bitacad', 'course'),
	(12, 1, 'Microsoft 20741 Networking with Windows Server 2016 (', 'Sep 2020', '', 'ComputerLand', 'course'),
	(13, 1, 'Microsoft 20740 - Installation, Storage, and Compute Windows Server 2016', 'Oct 2020', '', 'ComputerLand', 'course'),
	(14, 1, 'Frontend Web Development – Javascript', 'November 2020)', '', 'BitAcad', 'course'),
	(15, 1, 'CCNA V7 Bridging', 'Dec 2020', '', 'Cisco Network Academy', 'course'),
	(16, 1, 'Back-end Developer PHP Advanced & Wordpress', 'February 2021', '', 'Bitacad', 'course'),
	(17, 1, 'Microsoft 20742 - Identity with Windows Server 2016', 'Mar 2021', '', 'ComputerLand', 'course'),
	(18, 1, 'Microsoft 10985C - Introduction to SQL Databases', 'April 2021', '', 'ComputerLand', 'course'),
	(19, 1, 'Microsoft 20761C - Querying Data with Transact-SQL', 'June 2021', '', 'ComputerLand', 'course'),
	(20, 1, 'Microsoft WS-011T00-A: Windows Server 2019 Administration', 'April 2021', '', 'ComputerLand', 'course'),
	(21, 1, 'Six Sigma Green Belt Certification', 'May 2021', '', NULL, 'course'),
	(22, 1, 'Microsoft 20764C - Administering a SQL Databases Infrastructure', 'August 2021', '', 'ComputerLand', 'course'),
	(23, 1, 'Azure Fundamentals AZ-900 Certification', 'November 2021', '', 'Microsoft', 'course'),
	(24, 1, 'MTA Database Fundamentals Certification', 'December 2021', '', 'Microsoft', 'course'),
	(25, 1, 'Azure Data Fundamentals DP-900 Certification', 'December 2021', '', 'Microsoft', 'course'),
	(26, 1, 'PCAP Certification - Python Certified Associate Programmer', 'February 2022', '', 'Python Institute', 'course'),
	(27, 1, 'PCPP Certification – Python Certified Professional Programming', 'ongoing', '', 'Python Institute', 'course'),
	(28, 1, 'CCNA 3 V7', 'ongoing', '', 'Cisco Network Academy', 'course');
/*!40000 ALTER TABLE `education` ENABLE KEYS */;

-- Dumping structure for table flask_app.employers
CREATE TABLE IF NOT EXISTS `employers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_name` text,
  `company_location` ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ;

-- Dumping data for table flask_app.employers: ~4 rows (approximately)
INSERT INTO `employers` (`id`, `company_name`, `company_location`) VALUES
	(1, 'Avis Rent a Car Romania (Aviroms Rent a Car S.R.L.)', 'Bucharest, Romania'),
	(2, 'Honeywell Romania', 'Bucharest, Romania'),
	(3, 'Zitec', 'Bucharest, Romania'),
	(4, 'Avis Rent a Car Romania (Aviroms Rent a Car S.R.L.) and\r\nBudget Rent a Car Romania (Globe Trading S.R.L.)', 'Bucharest, Romania');

-- Dumping structure for table flask_app.employments
CREATE TABLE IF NOT EXISTS `employments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `employer_id` int DEFAULT '0',
  `position` text,
  `job_start` text,
  `job_end` text,
  KEY `Index 1` (`id`),
  KEY `FK__employers` (`employer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ;

-- Dumping data for table flask_app.employments: ~9 rows (approximately)
INSERT INTO `employments` (`id`, `user_id`, `employer_id`, `position`, `job_start`, `job_end`) VALUES
	(1, 1, 1, 'Rental Sales Agent', 'May 2006', 'February 2010'),
	(2, 1, 1, 'Station Manager', 'February 2010', 'November 2012'),
	(3, 1, 1, 'Customer Service Manager', 'November 2012', 'December 2017'),
	(4, 1, 4, 'Data Protection Officer', 'May 2018', 'May 2020'),
	(5, 1, 1, 'Certified Trainer', 'March 2013', 'May 2020'),
	(6, 1, 1, 'Internal Audit Manager', 'December 2017', 'May 2020'),
	(7, 1, 1, 'Junior Python Developer', 'March 2019', 'May 2020'),
	(8, 1, 2, 'Cyber Security Architect/Engineer', 'July 2020', 'April 2022'),
	(9, 1, 3, 'Business Automation Engineer', 'April 2022', 'July 2022');

-- Dumping structure for table flask_app.employment_details
CREATE TABLE IF NOT EXISTS `employment_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employment_id` int DEFAULT '0',
  `tasks` text,
  KEY `Index 1` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 ;

-- Dumping data for table flask_app.employment_details: 53 rows
/*!40000 ALTER TABLE `employment_details` DISABLE KEYS */;
INSERT INTO `employment_details` (`id`, `employment_id`, `tasks`) VALUES
	(1, 1, 'Ensuring the availability of vehicles for reservations and walk-ins'),
	(2, 1, 'Opening and closing rental contracts and promoting additional products or services'),
	(3, 1, 'Informing customers about the terms and conditions, rates and providing phone assistance'),
	(4, 2, 'Opening and administration of an office inside the Porsche Bucharest North car service'),
	(5, 2, 'Management of the contract with this service'),
	(6, 2, 'Managing the portfolio of own clients of the office, as well as those coming through the service'),
	(7, 2, 'Management of the company\'s car fleet from the Volkswagen range'),
	(8, 3, 'Ensuring the increase of the brand notoriety by solving the claims and complaints'),
	(9, 3, 'Mediating with representatives of the international group the various cases that appeared in the activity carried out internally / externally (Submission of complaints and claims to the country where the rental took place / receipt of complaints for internal rentals)'),
	(10, 3, 'Elaboration of policies and working procedures of the Customer Service Department'),
	(11, 3, 'Coordinating the activity of the subordinate team, in order to achieve the objectives of the department'),
	(12, 3, 'Granting means of compensation for the client in case the situation required it, as well as the recovery of the amounts disputed by the client from the responsible country, according to the internal procedures'),
	(13, 4, 'Inserting and deleting customers from the risk database'),
	(14, 4, 'Implementing Scrive (electronic signature of the rental contracts)'),
	(15, 4, 'Implementing 365ID (customer’s documents identification)'),
	(16, 4, 'Implementing security standards in order to protect the personal data of the company\'s customers'),
	(17, 4, 'Securing the methods of access to the data server, as well as the methods of taking these data from customers'),
	(18, 4, 'Communication with customers who wanted to exercise their rights provided in the GDPR regulation'),
	(19, 4, 'Informing the employer about the identified fraud risks of the system'),
	(20, 5, 'Organizing and conducting training sessions, both for onboarding new rental agents and for important changes in the main program in which the rental contracts were operated'),
	(21, 5, 'Teaching agents the company’s terms and conditions, the company’s own procedures, the issuing methods of the rental contracts (automatic or manual), trading bank cards and identifying attempts of fraud'),
	(22, 5, 'Final evaluation of new agents'),
	(23, 6, 'Once I had finished Python courses, I was able to automize 95% of my audit tasks, with a severe drop in terms of time from about 20 days per month to only 12 seconds in high season, plus 2 or 3 days of manual checking afterwards'),
	(24, 6, 'Assuring PCI-DSS compliance'),
	(25, 6, 'Identification of the situations in which the internal procedures were not observed, the reason why they were not observed, as well as the elaboration of the measures to prevent their non-observance'),
	(26, 6, 'Monthly reporting of non-conformities identified in the audit of rental contracts or the audit of the technical and aesthetic condition of cars in the company\'s fleet'),
	(27, 6, 'Elaboration of internal quality control procedures'),
	(28, 6, 'Providing assistance to all departments in order to develop their own working procedures'),
	(29, 7, 'Automating unzipping, interpreting, parsing, regexing and trimming data within the ZIP and TXT files received from the Avis Headquarters servers located in Bracknell, UK'),
	(30, 7, 'Developing functions, triggers and stored procedures to analyse and store data from above files into PostgreSQL and MySQL databases using Python and PSYCOPG2 / MYSQLDB / PYMYSQL libraries'),
	(31, 7, 'Developing Python scripts to automate the management of copying and removing documents containing sensitive data to/from a secure location through Fortinet VPN (customer\'s driving licensee and passport copies)'),
	(32, 7, 'Creating automated Excel reports with Python and XLSXWRITER / CSV / PANDAS libraries'),
	(33, 7, 'Creating email alerts and automated reports for Customer Service Department and Accounting Department using Python and EMAIL / SMTP libraries'),
	(34, 7, 'Pulling data from Scrive (electronic signature app) and 365ID (passport and driving licensee secure scanning) and merging it with the data fetched from the central web app, in order to deliver an automated report to the Audit Department'),
	(35, 7, 'Fetching data from MySQL database and further processing with PHP / HTML / CSS to populate the modules in the central web app used within the organization (preventing HTML and SQL injection and including PHP design patterns, such as: Singleton Pattern, Front Controller Pattern and MVC);'),
	(36, 7, 'Developing Python scripts (using SFTP library) to upload automated generated files on Avis Headquarters servers through a SSH connection'),
	(37, 8, 'Configuring and implementing of standard and non-standard projects to accommodate customer requirements. Remote installation for 400+ industrial customers in EMEA/APAC region for the services provided by the Managed Security Center. Supporting the local engineers to configure and test the new projects once on-site (performing FAT\\SAT - Factory\\Site Acceptance Tests)'),
	(38, 8, 'Responding to monitoring alerts received by interfacing with customer to advise of alarm situation, investigate problem and determine the optimal solution'),
	(39, 8, 'Providing technical support for cases raised in Salesforce for customers, assessment and troubleshooting for inquiries and issues by diagnosing problems and providing the most appropriate technical solution in an accurate and timely manner'),
	(40, 8, 'Ensuring that the services are up and running and that the customer\'s Process Control Network is out of cyber security risks'),
	(41, 8, 'In charge of the monthly approval process and administration of the master WSUS Server that coordinates our customers globally'),
	(42, 8, 'Mentoring and coaching junior colleagues in the team'),
	(43, 8, 'Participating in 24 x 7 on-call process as necessary'),
	(44, 8, 'Creating knowledge base articles for peers'),
	(45, 8, 'Maintaining and extending technical knowledge by self-study and by attending relevant training sessions'),
	(46, 8, 'Experience with remote access solution and device monitoring (using ICMP, WMI, SNMP and proprietary protocols), antivirus solutions with centralized management (McAfee ePolicy Orchestrator, Symantec), virtualization - VMware (ESXi), Microsoft - Windows Server 2008, 2012, 2016, 2019, WSUS, Active'),
	(47, 9, 'Developing Python scripts and deploying them along with Pub/Sub and Storage Buckets in Google Cloud'),
	(48, 9, 'Developing JavaScript scripts in Google AppsScripts and implementing triggers for automatizing certain repetitive and labour-intensive tasks'),
	(49, 9, 'Maintaining datasets and tables in Google Cloud\\ MySQL and BigQuery databases'),
	(50, 9, 'Automating issues creation in Jira for certain type of events'),
	(51, 9, 'Automating worklogs creation in Tempo for work hours tracking'),
	(52, 9, 'Implementing Pipeline DataFlows in Google Cloud for daily backups in BigQuery database'),
	(53, 9, 'Altering data structures with Google Cloud Data Fusion tool and creating reports with Google Data Studio');
/*!40000 ALTER TABLE `employment_details` ENABLE KEYS */;

-- Dumping structure for table flask_app.key_skills
CREATE TABLE IF NOT EXISTS `key_skills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `skill` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 ;

-- Dumping data for table flask_app.key_skills: ~10 rows (approximately)
INSERT INTO `key_skills` (`id`, `user_id`, `skill`) VALUES
	(1, 1, 'Programming languages:\r\no Python (PCAP Certified)\r\no PHP\r\no JavaScript, HTML & CSS'),
	(2, 1, 'Database: SQL Server, BigQuery, MySQL, MySQL programming language (MTA Database Fundamentals Certified)'),
	(3, 1, 'Networking: IPv4 Subnetting, Static and Dynamic Routing, Firewall'),
	(4, 1, 'Virtualization: VMWare'),
	(5, 1, 'Cloud: Google, Azure (AZ-900, DP-900 certified)'),
	(6, 1, 'DevOps Tools: Docker, Jenkins, Git, GitHub'),
	(7, 1, 'System Administration: AD, WSUS, McAfee ePO, Windows Server\r\n'),
	(8, 1, 'Data protection: GDPR implementation, Security Policies'),
	(9, 1, 'Other: Agile methodologies, SalesForce, Jira, Confluence'),
	(10, 1, 'Self-educator and detail-oriented, problem-solving');

-- Dumping structure for table flask_app.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` text CHARACTER SET utf8mb4 ,
  `location` text CHARACTER SET utf8mb4 ,
  `age` int DEFAULT NULL,
  `gender` text CHARACTER SET utf8mb4 ,
  `mobile` text CHARACTER SET utf8mb4 ,
  `linkedIn` text CHARACTER SET utf8mb4 ,
  `email` text CHARACTER SET utf8mb4 ,
  `github` text CHARACTER SET utf8mb4 ,
  `project` text CHARACTER SET utf8mb4 ,
  `objectives` text CHARACTER SET utf8mb4 ,
  `languages` text CHARACTER SET utf8mb4 ,
  `driving_license` text CHARACTER SET utf8mb4 ,
  `personal_interests` text CHARACTER SET utf8mb4 ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ;

-- Dumping data for table flask_app.users: ~1 rows (approximately)
INSERT INTO `users` (`id`, `user_name`, `location`, `age`, `gender`, `mobile`, `linkedIn`, `email`, `github`, `project`, `objectives`, `languages`, `driving_license`, `personal_interests`) VALUES
	(1, 'Ion Sorin-Alexandru', 'Bucharest', 38, 'Male', '+40.721.420.657', 'https://www.linkedin.com/in/ion-sorin-alexandru-16089477/', 'ION.SORINALEXANDRU@YAHOO.COM', 'https://github.com/alex-ion', 'https://www.youtube.com/watch?v=eGkYXfU3hew', 'I want to be part of an enthusiastic and challenging work environment in the field of Software Development. I am looking forward to joining a team that will guide me at the beginning in what I have to do, so that later we can enjoy together the benefits of our work. I enjoy dreaming about efficiently using my skills so that I can add value to the company’s performance and development.', 'Romanian – native\r\nEnglish – fluent', 'Category B from 2002', 'Embeded microcontrollers, Cycling, Electronics, Bricolage/Do-it-yourself');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
