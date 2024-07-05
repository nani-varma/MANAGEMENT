-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2024 at 11:11 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university_library`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookrequests`
--

CREATE TABLE `bookrequests` (
  `request_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `request_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('Pending','Approved','Rejected') DEFAULT NULL,
  `feedback` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookrequests`
--

INSERT INTO `bookrequests` (`request_id`, `user_id`, `book_id`, `request_date`, `status`, `feedback`) VALUES
(1, 1, 1, '2024-06-29 06:49:53', 'Approved', 'Good choice'),
(2, 2, 2, '2024-06-29 06:49:53', 'Approved', ''),
(3, 3, 3, '2024-06-29 06:49:53', 'Rejected', 'Out of stock'),
(4, 4, 4, '2024-06-29 06:49:53', 'Approved', 'Available for pickup'),
(5, 5, 5, '2024-06-29 06:49:53', 'Pending', ''),
(6, 6, 6, '2024-06-29 06:49:53', 'Approved', 'Available for pickup'),
(7, 7, 7, '2024-06-29 06:49:53', 'Rejected', 'Out of stock'),
(8, 8, 8, '2024-06-29 06:49:53', 'Pending', ''),
(9, 9, 9, '2024-06-29 06:49:53', 'Approved', 'Available for pickup'),
(10, 10, 10, '2024-06-29 06:49:53', 'Rejected', 'Out of stock');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `authors` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `is_digital` tinyint(1) DEFAULT NULL,
  `available_copies` int(11) DEFAULT NULL,
  `total_copies` int(11) DEFAULT NULL,
  `average_rating` decimal(2,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `authors`, `description`, `publisher`, `category`, `is_digital`, `available_copies`, `total_copies`, `average_rating`) VALUES
(1, 'Book Title 1', 'Author 1', 'Description 1', 'Publisher 1', 'Category 1', 1, 5, 10, 4.5),
(2, 'Book Title 2', 'Author 2', 'Description 2', 'Publisher 2', 'Category 2', 0, 3, 5, 3.8),
(3, 'Book Title 3', 'Author 3', 'Description 3', 'Publisher 3', 'Category 3', 1, 7, 7, 4.0),
(4, 'Book Title 4', 'Author 4', 'Description 4', 'Publisher 4', 'Category 4', 0, 2, 4, 3.2),
(5, 'Book Title 5', 'Author 5', 'Description 5', 'Publisher 5', 'Category 5', 1, 6, 6, 4.7),
(6, 'Book Title 6', 'Author 6', 'Description 6', 'Publisher 6', 'Category 6', 0, 4, 5, 3.9),
(7, 'Book Title 7', 'Author 7', 'Description 7', 'Publisher 7', 'Category 7', 1, 8, 8, 4.3),
(8, 'Book Title 8', 'Author 8', 'Description 8', 'Publisher 8', 'Category 8', 0, 1, 2, 2.8),
(9, 'Book Title 9', 'Author 9', 'Description 9', 'Publisher 9', 'Category 9', 1, 9, 9, 4.9),
(10, 'Book Title 10', 'Author 10', 'Description 10', 'Publisher 10', 'Category 10', 0, 0, 1, 3.5);

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `loan_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `loan_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `due_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `overdue_fee` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`loan_id`, `user_id`, `book_id`, `loan_date`, `due_date`, `return_date`, `overdue_fee`) VALUES
(1, 1, 1, '2024-06-29 06:49:53', '2024-07-07', NULL, 0.00),
(2, 2, 2, '2024-06-29 06:49:53', '2024-07-07', '2024-07-05', 0.00),
(3, 3, 3, '2024-06-29 06:49:53', '2024-07-07', NULL, 0.00),
(4, 4, 4, '2024-06-29 06:49:53', '2024-07-07', NULL, 0.00),
(5, 5, 5, '2024-06-29 06:49:53', '2024-07-07', '2024-07-06', 0.00),
(6, 6, 6, '2024-06-29 06:49:53', '2024-07-07', NULL, 0.00),
(7, 7, 7, '2024-06-29 06:49:53', '2024-07-07', NULL, 0.00),
(8, 8, 8, '2024-06-29 06:49:53', '2024-07-07', '2024-07-04', 0.00),
(9, 9, 9, '2024-06-29 06:49:53', '2024-07-07', NULL, 0.00),
(10, 10, 10, '2024-06-29 06:49:53', '2024-07-07', NULL, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`rating_id`, `book_id`, `user_id`, `rating`, `comments`) VALUES
(1, 1, 1, 5, 'Excellent book!'),
(2, 2, 2, 4, 'Good read.'),
(3, 3, 3, 3, 'Average.'),
(4, 4, 4, 2, 'Not my type.'),
(5, 5, 5, 5, 'Loved it!'),
(6, 6, 6, 4, 'Quite good.'),
(7, 7, 7, 3, 'Okay.'),
(8, 8, 8, 2, 'Could be better.'),
(9, 9, 9, 5, 'Fantastic!'),
(10, 10, 10, 4, 'Pretty good.');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'Student'),
(2, 'Staff'),
(3, 'Librarian'),
(4, 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sale_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `price` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sale_id`, `book_id`, `user_id`, `sale_date`, `price`) VALUES
(1, 1, 1, '2024-06-29 06:49:53', 10.00),
(2, 2, 2, '2024-06-29 06:49:53', 8.50),
(3, 3, 3, '2024-06-29 06:49:53', 12.00),
(4, 4, 4, '2024-06-29 06:49:53', 7.75),
(5, 5, 5, '2024-06-29 06:49:53', 9.50),
(6, 6, 6, '2024-06-29 06:49:53', 11.00),
(7, 7, 7, '2024-06-29 06:49:53', 8.00),
(8, 8, 8, '2024-06-29 06:49:53', 6.50),
(9, 9, 9, '2024-06-29 06:49:53', 14.00),
(10, 10, 10, '2024-06-29 06:49:53', 10.50);

-- --------------------------------------------------------

--
-- Table structure for table `userroles`
--

CREATE TABLE `userroles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userroles`
--

INSERT INTO `userroles` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 1),
(7, 1),
(8, 2),
(9, 3),
(10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(15) DEFAULT NULL,
  `contact_address_street` varchar(255) DEFAULT NULL,
  `contact_address_city` varchar(100) DEFAULT NULL,
  `contact_address_postal_code` varchar(10) DEFAULT NULL,
  `contact_address_country` varchar(100) DEFAULT NULL,
  `date_registered` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `password`, `profile_picture`, `contact_phone`, `contact_address_street`, `contact_address_city`, `contact_address_postal_code`, `contact_address_country`, `date_registered`) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 'password123', NULL, '1234567890', '123 Main St', 'Anytown', '12345', 'Country1', '2024-06-29 06:49:53'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 'password123', NULL, '1234567891', '124 Main St', 'Anytown', '12345', 'Country1', '2024-06-29 06:49:53'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', 'password123', NULL, '1234567892', '125 Main St', 'Anytown', '12345', 'Country1', '2024-06-29 06:49:53'),
(4, 'Bob', 'Brown', 'bob.brown@example.com', 'password123', NULL, '1234567893', '126 Main St', 'Anytown', '12345', 'Country1', '2024-06-29 06:49:53'),
(5, 'Charlie', 'Davis', 'charlie.davis@example.com', 'password123', NULL, '1234567894', '127 Main St', 'Anytown', '12345', 'Country1', '2024-06-29 06:49:53'),
(6, 'David', 'Wilson', 'david.wilson@example.com', 'password123', NULL, '1234567895', '128 Main St', 'Anytown', '12345', 'Country1', '2024-06-29 06:49:53'),
(7, 'Eve', 'Miller', 'eve.miller@example.com', 'password123', NULL, '1234567896', '129 Main St', 'Anytown', '12345', 'Country1', '2024-06-29 06:49:53'),
(8, 'Frank', 'Moore', 'frank.moore@example.com', 'password123', NULL, '1234567897', '130 Main St', 'Anytown', '12345', 'Country1', '2024-06-29 06:49:53'),
(9, 'Grace', 'Taylor', 'grace.taylor@example.com', 'password123', NULL, '1234567898', '131 Main St', 'Anytown', '12345', 'Country1', '2024-06-29 06:49:53'),
(10, 'Henry', 'Anderson', 'henry.anderson@example.com', 'password123', NULL, '1234567899', '132 Main St', 'Anytown', '12345', 'Country1', '2024-06-29 06:49:53'),
(12, 'abc', 'def', 'abc@gmail.com', 'AbCDeF123', NULL, '5874589652', 'asdfg', 'nbhgy', '784523', 'iuythf', '2024-06-29 09:07:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookrequests`
--
ALTER TABLE `bookrequests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`loan_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `userroles`
--
ALTER TABLE `userroles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookrequests`
--
ALTER TABLE `bookrequests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookrequests`
--
ALTER TABLE `bookrequests`
  ADD CONSTRAINT `bookrequests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookrequests_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE;

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `userroles`
--
ALTER TABLE `userroles`
  ADD CONSTRAINT `userroles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userroles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
