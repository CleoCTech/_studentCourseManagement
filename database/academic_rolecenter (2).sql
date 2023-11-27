-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2023 at 10:42 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `academic_rolecenter`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `is_approver` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `uuid`, `name`, `email`, `role`, `is_approver`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'a95aaf49-5aa3-4adf-8d2a-7183bce4d695', 'Cronus', 'cronus@cronus.com', 1, 0, 1, NULL, NULL, NULL, NULL),
(2, 'a6f6a592-509d-4254-944d-bf9a1c87b00b', 'admin@wenlasystems.com', 'admin@wenlasystems.com', 1, 0, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `table_id` varchar(255) NOT NULL,
  `record_id` varchar(255) NOT NULL,
  `storageName` varchar(255) NOT NULL,
  `is_archived` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `uuid`, `filename`, `description`, `table_id`, `record_id`, `storageName`, `is_archived`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'bd2ec3bf-c2e1-4799-b3c3-c33044d744c6', 'TU399447_1700441063.pdf', 'Course Content', 'courses', 'b26cfda2-9665-4b00-847c-1195dd8588a5', 'adminAttachments.attachments', 0, 'cronus@cronus.com', NULL, '2023-11-19 21:44:23', '2023-11-19 21:44:23'),
(2, 'f9ae69e6-9d1f-443f-90a9-f59d0ac064a7', 'Cleophas_Resume_v2023_1700441233.pdf', 'Test', 'courses', 'b26cfda2-9665-4b00-847c-1195dd8588a5', 'adminAttachments.attachments', 0, 'cronus@cronus.com', NULL, '2023-11-19 21:47:13', '2023-11-19 21:47:13'),
(4, '8582d129-4022-4a94-8c3b-72178c26c115', 'academic_rolecenter_1700562831.sql', 'Test', 'courses', 'b26cfda2-9665-4b00-847c-1195dd8588a5', 'adminAttachments.attachments', 0, 'cronus@cronus.com', NULL, '2023-11-21 07:33:52', '2023-11-21 07:33:52'),
(5, '6cbde539-7582-4a66-9a31-dad045119e86', 'WDM_Phase 4 (1)_1700968446.docx', 'Chapter 1 CAT 1', 'exams', '771f9d8e-aa52-4178-b658-ba9305a0161d', 'adminAttachments.attachments', 0, 'cronus@cronus.com', NULL, '2023-11-26 00:14:06', '2023-11-26 00:14:06'),
(6, '8605a67c-519d-474f-b407-8378164b81f1', 'TU399447_1700968446.pdf', 'Chapter 1 CAT 1', 'exams', '771f9d8e-aa52-4178-b658-ba9305a0161d', 'adminAttachments.attachments', 0, 'cronus@cronus.com', NULL, '2023-11-26 00:14:06', '2023-11-26 00:14:06'),
(7, '4a3e4b70-b8d1-4173-a091-89466b34f6aa', 'TU399447_1700969228.pdf', 'SE601 CAT 2 - Group Work - TU399447_1700969228.pdf', 'exams', '09e60a28-2d3f-4979-bc9e-e1c1cfd5baf6', 'adminAttachments.attachments', 0, 'cronus@cronus.com', NULL, '2023-11-26 00:27:08', '2023-11-26 00:27:08'),
(8, '1a144104-cbeb-47a4-82dc-00b7d4223417', 'RCK SYSTEM REVIEW REPORT_1700969228.docx', 'SE601 CAT 2 - Group Work - RCK SYSTEM REVIEW REPORT_1700969228.docx', 'exams', '09e60a28-2d3f-4979-bc9e-e1c1cfd5baf6', 'adminAttachments.attachments', 0, 'cronus@cronus.com', NULL, '2023-11-26 00:27:08', '2023-11-26 00:27:08'),
(9, 'b7956e26-a901-4f9a-a084-90ae3c1371a2', 'Cleophas_Resume_v2023_1701030690.pdf', 'SE601 CAT_student@gmail.com - Cleophas_Resume_v2023_1701030690.pdf', 'exam_submissions', '19b09641-3624-405c-b183-3227ce6cdcd1', 'adminAttachments.attachments', 0, 'student@gmail.com', NULL, '2023-11-26 17:31:30', '2023-11-26 17:31:30'),
(10, '6e43efdb-74a1-41a2-897c-406e781e9e3f', 'TU399447_1701030691.pdf', 'SE601 CAT_student@gmail.com - TU399447_1701030691.pdf', 'exam_submissions', '19b09641-3624-405c-b183-3227ce6cdcd1', 'adminAttachments.attachments', 0, 'student@gmail.com', NULL, '2023-11-26 17:31:31', '2023-11-26 17:31:31');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `program_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `uuid`, `program_id`, `code`, `title`, `description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'b26cfda2-9665-4b00-847c-1195dd8588a5', 2, 'SE601', 'SE601: Software Engineering Principles', '<h2>Course Title: SE601 - Software Engineering Principles</h2><h3>Course Overview:<br>This course provides an in-depth exploration of fundamental principles in software engineering. Students will gain a solid understanding of the theoretical and practical aspects of software development processes, project management, and quality assurance.</h3><h3>**Module 1: Introduction to Software Engineering**<br>- Understanding the software development life cycle<br>- Historical overview of software engineering<br>- Importance of software engineering principles in modern applications</h3><h3>**Module 2: Requirements Engineering**<br>- Requirements elicitation and analysis<br>- Use case modeling<br>- Requirement specification and validation</h3><h3>**Module 3: Software Design Principles**<br>- Object-oriented design concepts<br>- Design patterns and their application<br>- Architectural design and trade-offs</h3><h3>**Module 4: Implementation and Coding Standards**<br>- Best practices in coding<br>- Code reviews and inspections<br>- Introduction to coding standards and guidelines</h3><h3>**Module 5: Software Testing and Quality Assurance**<br>- Basics of software testing<br>- Different testing levels (unit, integration, system, acceptance)<br>- Quality assurance processes and techniques</h3><h3>**Module 6: Software Project Management**<br>- Project planning and estimation<br>- Risk management in software projects<br>- Agile and Scrum methodologies</h3><h3>**Module 7: Software Maintenance and Evolution**<br>- Principles of software maintenance<br>- Software re-engineering and refactoring<br>- Legacy system migration strategies</h3><h3>**Module 8: Ethical and Professional Issues in Software Engineering**<br>- Ethical considerations in software development<br>- Professional responsibilities of software engineers<br>- Legal aspects and intellectual property in software</h3><h3>**Assessment:**<br>- Weekly assignments and quizzes<br>- Midterm examination<br>- Group project: Software development project applying principles learned<br>- Final examination</h3><h3>**Recommended Textbook:**<br>\"Software Engineering: A Practitioner\'s Approach\" by Roger S. Pressman</h3><p>Again, these contents are entirely fictional and are provided as an example. Real courses will have specific content tailored to the goals and standards of the university offering the program.</p>', 2, NULL, 'cronus@cronus.com', '2023-11-18 22:03:29', '2023-11-18 22:03:29'),
(2, 'dcb6adfe-41bf-480a-9756-03d4ee7a2cf6', 2, 'SE602', 'SE602: Object-Oriented Design and Programming', '<p><strong>Course Overview:</strong> This course provides an in-depth exploration of fundamental principles in software engineering. Students will gain a solid understanding of the theoretical and practical aspects of software development processes, project management, and quality assurance.</p>', 2, NULL, 'cronus@cronus.com', '2023-11-25 06:01:31', '2023-11-25 06:01:31'),
(3, 'f19ffc97-af8c-4770-b367-c9b273d8d47c', 2, 'SE603', 'SE603: Software Development Lifecycle', '<p><strong>Course Overview:</strong> This course provides an in-depth exploration of fundamental principles in software engineering. Students will gain a solid understanding of the theoretical and practical aspects of software development processes, project management, and quality assurance.</p>', 2, NULL, 'cronus@cronus.com', '2023-11-25 06:02:04', '2023-11-25 06:05:41'),
(4, '14d161ad-baa3-4f54-a55f-4c5a7980e6f0', 2, 'SE604', 'SE604: Algorithms and Data Structures for Software Engineers', '<p><strong>Course Overview:</strong> This course provides an in-depth exploration of fundamental principles in software engineering. Students will gain a solid understanding of the theoretical and practical aspects of software development processes, project management, and quality assurance.</p>', 2, NULL, 'cronus@cronus.com', '2023-11-25 06:03:13', '2023-11-25 06:03:13'),
(5, '42eca1dd-b9c0-41c3-bdfa-057258832560', 2, 'SE701', 'SE701: Advanced Software Architecture', '<p><strong>Course Overview:</strong> This course provides an in-depth exploration of fundamental principles in software engineering. Students will gain a solid understanding of the theoretical and practical aspects of software development processes, project management, and quality assurance.</p>', 2, NULL, 'cronus@cronus.com', '2023-11-25 06:04:28', '2023-11-25 06:04:28'),
(6, '9710a081-660f-42ad-89bb-a09b17cd39ca', 2, 'SE702', 'SE702: Design Patterns in Software Engineering', '<p><strong>Course Overview:</strong> This course provides an in-depth exploration of fundamental principles in software engineering. Students will gain a solid understanding of the theoretical and practical aspects of software development processes, project management, and quality assurance.</p>', 2, NULL, 'cronus@cronus.com', '2023-11-25 06:05:21', '2023-11-25 06:05:21');

-- --------------------------------------------------------

--
-- Table structure for table `course_materials`
--

CREATE TABLE `course_materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `material_type` varchar(255) NOT NULL,
  `material_path` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `exam_type` varchar(255) NOT NULL,
  `exam_path` varchar(255) DEFAULT NULL,
  `max_score` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `uuid`, `code`, `name`, `description`, `course_id`, `exam_type`, `exam_path`, `max_score`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(3, '771f9d8e-aa52-4178-b658-ba9305a0161d', 'SE601 CAT', 'Chapter 1 CAT 1', '<h2><strong>Instructions:</strong><br>This course provides an in-depth exploration of fundamental principles in software engineering. Students will gain a solid understanding of the theoretical and practical aspects of software development processes, project management, and quality assurance.</h2>', 1, 'CAt', 'TU399447_1700947106.pdf', 30, 2, NULL, 'cronus@cronus.com', '2023-11-25 18:18:26', '2023-11-25 18:18:26'),
(4, '09e60a28-2d3f-4979-bc9e-e1c1cfd5baf6', 'SE601 CAT 2', 'SE601 CAT 2 - Group Work', '<p><strong>Instructions:</strong><br>This course provides an in-depth exploration of fundamental principles in software engineering. Students will gain a solid understanding of the theoretical and practical aspects of software development processes, project management, and quality assurance.</p>', 1, 'CAT', NULL, 30, 2, NULL, 'cronus@cronus.com', '2023-11-26 00:27:08', '2023-11-26 00:27:08');

-- --------------------------------------------------------

--
-- Table structure for table `exam_submissions`
--

CREATE TABLE `exam_submissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_submissions`
--

INSERT INTO `exam_submissions` (`id`, `uuid`, `exam_id`, `user_id`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(9, '19b09641-3624-405c-b183-3227ce6cdcd1', 3, 8, 2, NULL, 'student@gmail.com', '2023-11-26 17:31:30', '2023-11-26 17:31:30');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `grade` decimal(5,2) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `uuid`, `user_id`, `course_id`, `grade`, `desc`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `exam_id`) VALUES
(1, '146a6283-13bf-45b3-bd2d-448caea078a8', 8, 1, '20.00', 'B', 2, NULL, 'cronus@cronus.com', '2023-11-26 05:37:26', '2023-11-26 05:37:26', 3),
(2, '40e47edb-6d46-4e52-928d-e0e91eddb527', 8, 1, '26.00', 'A', 2, NULL, 'cronus@cronus.com', '2023-11-26 06:28:47', '2023-11-26 06:28:47', 4),
(6, 'b638b108-103e-4e51-b5f1-4bacd4f60486', 13, 1, '27.00', 'A', 2, NULL, 'cronus@cronus.com', '2023-11-26 06:40:13', '2023-11-26 06:40:13', 3);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_11_18_030639_create_sessions_table', 1),
(7, '2023_11_18_031715_create_admin_users_table', 1),
(8, '2023_11_18_041130_laratrust_setup_tables', 1),
(14, '2023_11_18_211548_create_programs_table', 2),
(15, '2023_11_18_211830_create_courses_table', 2),
(16, '2023_11_18_213057_create_course_materials_table', 2),
(17, '2023_11_18_213511_create_exams_table', 2),
(18, '2023_11_18_213918_create_grades_table', 2),
(19, '2023_11_20_002048_create_attachments_table', 3),
(20, '2023_11_25_092732_add_max_score_to_exams_table', 4),
(21, '2023_11_26_083510_add_exam_id_to_grades_table', 5),
(22, '2023_11_26_191337_create_exam_submissions_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('coordinator@gmail.com', '$2y$12$HJ13Z9B8Evar9gqy3x0o3.M36h3vNZ3yXJ7U3O4BDxW/zFuaMXOqW', '2023-11-22 01:03:49'),
('instructor@gmail.com', '$2y$12$AirXG24gteMSfeqyR9YrHeYhRzM36EVj/rYG7Y3jPJAvPhSTWcjdK', '2023-11-22 01:03:02');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `uuid`, `code`, `name`, `description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(2, '2f3f0b92-2504-4655-b302-dc8145fc9638', 'MSSE', 'Master of Science in Software Engineering', NULL, 2, NULL, 'cronus@cronus.com', '2023-11-18 20:02:59', '2023-11-18 20:02:59');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'administrator', 'Administrator', 'administrator', '2023-11-18 09:33:49', '2023-11-18 09:33:58'),
(2, 'instructor', 'Instructor', 'instructor', '2023-11-18 09:33:56', '2023-11-18 09:33:53'),
(3, 'student', 'Student', 'student', '2023-11-18 09:33:44', '2023-11-18 09:33:46'),
(4, 'QA', 'Quality Assurance Officer', 'Quality Assurance Officer', '2023-11-18 09:35:11', '2023-11-18 09:35:13'),
(5, 'coordinator', 'Coordinator', 'coordinator', '2023-11-19 01:20:57', '2023-11-19 01:20:59');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(1, 1, 'App\\Models\\User'),
(3, 8, 'App\\Models\\User'),
(3, 9, 'App\\Models\\User'),
(2, 10, 'App\\Models\\User'),
(5, 11, 'App\\Models\\User'),
(3, 12, 'App\\Models\\User'),
(3, 13, 'App\\Models\\User');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('5khX2VJbuKt2WqWS7XNJn25E22myjmdGFuRnamXB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoia2tEaU5EcXRyT1FiSFU0cVN6VDdWYlRveUlGTThLdFV5cThzT1JGVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1701032677);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL DEFAULT '$2y$12$p9.9./PiyEIuYhG4seUTOeKg3l9F0Pc2leC9BK/ZGOFKrzLsW3jMu',
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `user_category` int(11) NOT NULL DEFAULT 0,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `sequence` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uuid`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `user_category`, `current_team_id`, `profile_photo_path`, `status`, `sequence`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, '9a45fb09-4a7c-48fa-a0df-7d3199e129b8', 'Cronus', 'cronus@cronus.com', NULL, '$2y$12$wtoRxNefOhjz.SPcpt3mYe7QIlQO1UORCvPeGduZdlwY8WSOvhGqG', NULL, NULL, NULL, NULL, 100, NULL, NULL, 2, NULL, 'cronus@cronus.com', 'cronus@cronus.com', '2023-11-18 12:11:56', NULL),
(2, '3a186bfb-0f3e-4a1a-90d4-dfca64d577c7', 'Wenla Systems', 'admin@wenlasystems.com', NULL, '$2y$12$OzyY.f3g9MyeN/RHWmtZY.nEtwAEptVWJW9MxdZoUTtA1rXnL7LpG', NULL, NULL, NULL, NULL, 100, NULL, NULL, 2, NULL, 'admin@wenlasystems.com', 'admin@wenlasystems.com', '2023-11-18 14:12:06', NULL),
(8, '8be311ca-8011-4236-81a1-131cac8f5c03', 'Student', 'student@gmail.com', NULL, '$2y$12$p9.9./PiyEIuYhG4seUTOeKg3l9F0Pc2leC9BK/ZGOFKrzLsW3jMu', NULL, NULL, NULL, NULL, 100, NULL, NULL, 2, NULL, NULL, NULL, '2023-11-18 17:49:51', '2023-11-18 17:49:51'),
(10, 'ef9990c5-ce3a-48e1-b15e-ccaf96783643', 'Insstructor', 'instructor@gmail.com', NULL, '$2y$12$p9.9./PiyEIuYhG4seUTOeKg3l9F0Pc2leC9BK/ZGOFKrzLsW3jMu', NULL, NULL, NULL, NULL, 100, NULL, NULL, 2, NULL, NULL, NULL, '2023-11-22 01:03:01', '2023-11-22 01:03:01'),
(11, 'dc51ebe9-a0dc-4422-9f69-9129fdcf9638', 'Coordinator', 'coordinator@gmail.com', NULL, '$2y$12$p9.9./PiyEIuYhG4seUTOeKg3l9F0Pc2leC9BK/ZGOFKrzLsW3jMu', NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, NULL, '2023-11-22 01:03:48', '2023-11-22 01:03:48'),
(13, '4bdec677-1121-4867-b297-acb2870259b9', 'Cleo', 'cleoctech@gmail.com', NULL, '$2y$12$d.w0kKqFT7YLZ3MthRRAJuVZnQPciRFz83dwacjqU/iVfp4YBDUNe', NULL, NULL, NULL, 'T11utosE9SU731zRHdLspPEbQ02QDo5BzAIyhZG5tdjG9syZ6coCI0AHinjW', 0, NULL, NULL, 2, NULL, NULL, NULL, '2023-11-23 16:15:15', '2023-11-23 16:17:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `admin_users_email_unique` (`email`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attachments_uuid_unique` (`uuid`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `courses_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `courses_code_unique` (`code`),
  ADD KEY `courses_program_id_foreign` (`program_id`);

--
-- Indexes for table `course_materials`
--
ALTER TABLE `course_materials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `course_materials_uuid_unique` (`uuid`),
  ADD KEY `course_materials_course_id_foreign` (`course_id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `exams_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `exams_code_unique` (`code`),
  ADD KEY `exams_course_id_foreign` (`course_id`);

--
-- Indexes for table `exam_submissions`
--
ALTER TABLE `exam_submissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `exam_submissions_uuid_unique` (`uuid`),
  ADD KEY `exam_submissions_exam_id_foreign` (`exam_id`),
  ADD KEY `exam_submissions_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `grades_uuid_unique` (`uuid`),
  ADD KEY `grades_user_id_foreign` (`user_id`),
  ADD KEY `grades_course_id_foreign` (`course_id`),
  ADD KEY `grades_exam_id_foreign` (`exam_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `permission_user_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `programs_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `programs_code_unique` (`code`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `course_materials`
--
ALTER TABLE `course_materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exam_submissions`
--
ALTER TABLE `exam_submissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`);

--
-- Constraints for table `course_materials`
--
ALTER TABLE `course_materials`
  ADD CONSTRAINT `course_materials_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `exam_submissions`
--
ALTER TABLE `exam_submissions`
  ADD CONSTRAINT `exam_submissions_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`),
  ADD CONSTRAINT `exam_submissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `grades_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`),
  ADD CONSTRAINT `grades_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
