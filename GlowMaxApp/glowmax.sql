-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 06, 2025 at 07:45 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `glowmax`
--

-- --------------------------------------------------------

--
-- Table structure for table `daily_tasks`
--

CREATE TABLE `daily_tasks` (
  `id` bigint NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daily_tasks`
--

INSERT INTO `daily_tasks` (`id`, `title`, `description`) VALUES
(1, '10,000 Steps', 'Jalani minimal 10.000 langkah hari ini untuk menjaga kebugaran tubuh'),
(2, 'Drink 3 Liters of Water', 'Minum minimal 3 liter air untuk hidrasi optimal'),
(3, 'Meditation 15 Minutes', 'Meditasi untuk merilekskan pikiran dan mengurangi stres'),
(4, 'Sleep 8 Hours', 'Tidur minimal 8 jam untuk kualitas hidup yang lebih baik'),
(5, 'Stretching 10 Minutes', 'Lakukan stretching ringan selama 10 menit'),
(6, 'Read a Book 20 Minutes', 'Membaca buku untuk menambah wawasan dan melatih fokus'),
(7, 'No Sugar Day', 'Hindari makanan dan minuman yang mengandung gula tambahan'),
(8, 'Eat Fruits 2 Servings', 'Konsumsi minimal dua porsi buah'),
(9, 'Cold Shower', 'Mandi air dingin untuk meningkatkan stamina dan daya tahan tubuh'),
(10, 'Journal Your Day', 'Catat kegiatan dan hal yang disyukuri?dalam?jurnal');

-- --------------------------------------------------------

--
-- Table structure for table `food_categories`
--

CREATE TABLE `food_categories` (
  `id` bigint NOT NULL,
  `bmi_category` enum('underweight','normal','overweight','obese') COLLATE utf8mb4_general_ci NOT NULL,
  `meal_type` enum('breakfast','lunch','snack','dinner') COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food_categories`
--

INSERT INTO `food_categories` (`id`, `bmi_category`, `meal_type`) VALUES
(1, 'underweight', 'breakfast'),
(2, 'underweight', 'lunch'),
(3, 'underweight', 'snack'),
(4, 'underweight', 'dinner'),
(5, 'normal', 'breakfast'),
(6, 'normal', 'lunch'),
(7, 'normal', 'snack'),
(8, 'normal', 'dinner'),
(9, 'overweight', 'breakfast'),
(10, 'overweight', 'lunch'),
(11, 'overweight', 'snack'),
(12, 'overweight', 'dinner'),
(13, 'obese', 'breakfast'),
(14, 'obese', 'lunch'),
(15, 'obese', 'snack'),
(16, 'obese', 'dinner');

-- --------------------------------------------------------

--
-- Table structure for table `food_items`
--

CREATE TABLE `food_items` (
  `id` bigint NOT NULL,
  `food_category_id` bigint NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `calories` int DEFAULT NULL,
  `image_url` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food_items`
--

INSERT INTO `food_items` (`id`, `food_category_id`, `name`, `description`, `calories`, `image_url`) VALUES
(1, 1, 'Roti gandum + selai kacang', 'Dengan jus alpukat dan pisang', NULL, NULL),
(2, 2, 'Ikan salmon/tongkol', 'Dengan nasi merah/nasi uduk sedikit minyak dan sayur', NULL, NULL),
(3, 3, 'Roti tawar dan kacang-kacangan', 'Snack penambah kalori sehat', NULL, NULL),
(4, 4, 'Oatmeal + potongan buah', 'Pisang/mangga atau telur dadar + tumis sayur', NULL, NULL),
(5, 5, 'Bubur gandum + buah', 'Pepaya, apel, melon, kopi hitam/teh tawar', NULL, NULL),
(6, 6, 'Ayam/tempe goreng kering', 'Nasi merah, sayur bayam dan wortel', NULL, NULL),
(7, 7, 'Buah-buahan dan kacang-kacangan', 'Snack sehat harian', NULL, NULL),
(8, 8, 'Sup tahu/sayur brokoli', 'Dengan roti gandum', NULL, NULL),
(9, 9, 'Telur rebus 1-2 butir', 'Roti gandum, tumis bayam/capcay tanpa minyak banyak', NULL, NULL),
(10, 10, 'Ikan putih kukus/panggang', 'Nila, kakap, dori; nasi merah porsi kecil dan lalapan', NULL, NULL),
(11, 11, 'Kacang-kacangan', 'Dengan teh tawar', NULL, NULL),
(12, 12, 'Tahu kukus/tempe rebus', 'Sayur sop/asem rendah minyak', NULL, NULL),
(13, 13, 'Oatmeal tanpa gula', 'Dengan apel dan air putih', NULL, NULL),
(14, 14, 'Ikan rendah lemak', 'Kakap/dori; nasi merah porsi kecil dan tumis sayur', NULL, NULL),
(15, 15, 'Kacang polong rebus', 'Atau kacang hijau kukus', NULL, NULL),
(16, 16, 'Sup sayur + tahu putih/tahu kukus', 'Atau tempe panggang', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `skincare_products`
--

CREATE TABLE `skincare_products` (
  `id` int NOT NULL,
  `step_id` int NOT NULL,
  `skin_type` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `budget_level` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `product_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skincare_products`
--

INSERT INTO `skincare_products` (`id`, `step_id`, `skin_type`, `budget_level`, `product_name`, `product_image`, `price`) VALUES
(1, 1, 'Oily', 'Low', 'Wardah Acnederm Foam', '/images/wash_oily_low.png', 25000),
(2, 1, 'Oily', 'High', 'La Roche-Posay Effaclar', '/images/wash_oily_high.png', 280000),
(3, 1, 'Dry', 'Low', 'Hada Labo Gokujyun', '/images/wash_dry_low.png', 40000),
(4, 1, 'Dry', 'High', 'CeraVe Hydrating Cleanser', '/images/wash_dry_high.png', 200000),
(5, 1, 'Combination', 'Low', 'Senka Perfect Whip', '/images/wash_combination_low.png', 50000),
(6, 1, 'Combination', 'High', 'Kiehl\'s Ultra Facial', '/images/wash_combination_high.png', 350000),
(7, 1, 'Sensitive', 'Low', 'Cetaphil Gentle Skin', '/images/wash_sensitive_low.png', 65000),
(8, 1, 'Sensitive', 'High', 'Bioderma Sensibio Gel', '/images/wash_sensitive_high.png', 240000),
(9, 2, 'Oily', 'Low', 'Emina Ms Pimple Toner', '/images/toner_oily_low.png', 20000),
(10, 2, 'Oily', 'High', 'COSRX AHA/BHA Toner', '/images/toner_oily_high.png', 180000),
(11, 2, 'Dry', 'Low', 'Hada Labo Ultimate Moist', '/images/toner_dry_low.png', 45000),
(12, 2, 'Dry', 'High', 'Laneige Cream Skin', '/images/toner_dry_high.png', 300000),
(13, 2, 'Combination', 'Low', 'N\'Pure Centella Asiatica', '/images/toner_combination_low.png', 90000),
(14, 2, 'Combination', 'High', 'Skintific 5X Ceramide', '/images/toner_combination_high.png', 140000),
(15, 2, 'Sensitive', 'Low', 'Simple Soothing Toner', '/images/toner_sensitive_low.png', 80000),
(16, 2, 'Sensitive', 'High', 'Av?ne Thermal Spring', '/images/toner_sensitive_high.png', 250000),
(17, 3, 'Oily', 'Low', 'Scarlett Acne Serum', '/images/serum_oily_low.png', 75000),
(18, 3, 'Oily', 'High', 'The Ordinary Niacinamide', '/images/serum_oily_high.png', 190000),
(19, 3, 'Dry', 'Low', 'Wardah Hydra Rose', '/images/serum_dry_low.png', 95000),
(20, 3, 'Dry', 'High', 'Innisfree Green Tea Seed', '/images/serum_dry_high.png', 320000),
(21, 3, 'Combination', 'Low', 'Somethinc Niacinamide', '/images/serum_combination_low.png', 115000),
(22, 3, 'Combination', 'High', 'Avoskin Miraculous', '/images/serum_combination_high.png', 220000),
(23, 3, 'Sensitive', 'Low', 'Implora Soothing Serum', '/images/serum_sensitive_low.png', 35000),
(24, 3, 'Sensitive', 'High', 'Kiehl\'s Cannabis Sativa', '/images/serum_sensitive_high.png', 800000);

-- --------------------------------------------------------

--
-- Table structure for table `skincare_steps`
--

CREATE TABLE `skincare_steps` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skincare_steps`
--

INSERT INTO `skincare_steps` (`id`, `name`) VALUES
(1, 'Face Wash'),
(2, 'Toner'),
(3, 'Serum');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint NOT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `age` enum('15-19 years','20-29 years','30+ years') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `height_cm` int DEFAULT NULL,
  `weight_kg` int DEFAULT NULL,
  `bmi_value` decimal(5,2) DEFAULT NULL,
  `bmi_category` enum('underweight','normal','overweight','obese') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `skin_type` enum('normal','oily','dry','combination','sensitive') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `budget_level` enum('low','high') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `exercise_type` enum('home','equipment','gym') COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_daily_tasks`
--

CREATE TABLE `user_daily_tasks` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `task_id` bigint NOT NULL,
  `task_date` date NOT NULL,
  `is_completed` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workout_categories`
--

CREATE TABLE `workout_categories` (
  `id` bigint NOT NULL,
  `bmi_category` enum('underweight','normal','overweight','obese') COLLATE utf8mb4_general_ci NOT NULL,
  `workout_preference` enum('gym','home_no_equipment','home_equipment') COLLATE utf8mb4_general_ci NOT NULL,
  `day` enum('MONDAY','TUESDAY','WEDNESDAY','THURSDAY','FRIDAY','SATURDAY','SUNDAY') COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workout_categories`
--

INSERT INTO `workout_categories` (`id`, `bmi_category`, `workout_preference`, `day`) VALUES
(1, 'underweight', 'gym', 'MONDAY'),
(2, 'underweight', 'gym', 'TUESDAY'),
(3, 'underweight', 'gym', 'WEDNESDAY'),
(4, 'underweight', 'gym', 'THURSDAY'),
(5, 'underweight', 'gym', 'FRIDAY'),
(6, 'underweight', 'gym', 'SATURDAY'),
(7, 'underweight', 'gym', 'SUNDAY'),
(29, 'underweight', 'home_no_equipment', 'MONDAY'),
(30, 'underweight', 'home_no_equipment', 'TUESDAY'),
(31, 'underweight', 'home_no_equipment', 'WEDNESDAY'),
(32, 'underweight', 'home_no_equipment', 'THURSDAY'),
(33, 'underweight', 'home_no_equipment', 'FRIDAY'),
(34, 'underweight', 'home_no_equipment', 'SATURDAY'),
(35, 'underweight', 'home_no_equipment', 'SUNDAY'),
(57, 'underweight', 'home_equipment', 'MONDAY'),
(58, 'underweight', 'home_equipment', 'TUESDAY'),
(59, 'underweight', 'home_equipment', 'WEDNESDAY'),
(60, 'underweight', 'home_equipment', 'THURSDAY'),
(61, 'underweight', 'home_equipment', 'FRIDAY'),
(62, 'underweight', 'home_equipment', 'SATURDAY'),
(63, 'underweight', 'home_equipment', 'SUNDAY'),
(8, 'normal', 'gym', 'MONDAY'),
(9, 'normal', 'gym', 'TUESDAY'),
(10, 'normal', 'gym', 'WEDNESDAY'),
(11, 'normal', 'gym', 'THURSDAY'),
(12, 'normal', 'gym', 'FRIDAY'),
(13, 'normal', 'gym', 'SATURDAY'),
(14, 'normal', 'gym', 'SUNDAY'),
(36, 'normal', 'home_no_equipment', 'MONDAY'),
(37, 'normal', 'home_no_equipment', 'TUESDAY'),
(38, 'normal', 'home_no_equipment', 'WEDNESDAY'),
(39, 'normal', 'home_no_equipment', 'THURSDAY'),
(40, 'normal', 'home_no_equipment', 'FRIDAY'),
(41, 'normal', 'home_no_equipment', 'SATURDAY'),
(42, 'normal', 'home_no_equipment', 'SUNDAY'),
(64, 'normal', 'home_equipment', 'MONDAY'),
(65, 'normal', 'home_equipment', 'TUESDAY'),
(66, 'normal', 'home_equipment', 'WEDNESDAY'),
(67, 'normal', 'home_equipment', 'THURSDAY'),
(68, 'normal', 'home_equipment', 'FRIDAY'),
(69, 'normal', 'home_equipment', 'SATURDAY'),
(70, 'normal', 'home_equipment', 'SUNDAY'),
(15, 'overweight', 'gym', 'MONDAY'),
(16, 'overweight', 'gym', 'TUESDAY'),
(17, 'overweight', 'gym', 'WEDNESDAY'),
(18, 'overweight', 'gym', 'THURSDAY'),
(19, 'overweight', 'gym', 'FRIDAY'),
(20, 'overweight', 'gym', 'SATURDAY'),
(21, 'overweight', 'gym', 'SUNDAY'),
(43, 'overweight', 'home_no_equipment', 'MONDAY'),
(44, 'overweight', 'home_no_equipment', 'TUESDAY'),
(45, 'overweight', 'home_no_equipment', 'WEDNESDAY'),
(46, 'overweight', 'home_no_equipment', 'THURSDAY'),
(47, 'overweight', 'home_no_equipment', 'FRIDAY'),
(48, 'overweight', 'home_no_equipment', 'SATURDAY'),
(49, 'overweight', 'home_no_equipment', 'SUNDAY'),
(71, 'overweight', 'home_equipment', 'MONDAY'),
(72, 'overweight', 'home_equipment', 'TUESDAY'),
(73, 'overweight', 'home_equipment', 'WEDNESDAY'),
(74, 'overweight', 'home_equipment', 'THURSDAY'),
(75, 'overweight', 'home_equipment', 'FRIDAY'),
(76, 'overweight', 'home_equipment', 'SATURDAY'),
(77, 'overweight', 'home_equipment', 'SUNDAY'),
(22, 'obese', 'gym', 'MONDAY'),
(23, 'obese', 'gym', 'TUESDAY'),
(24, 'obese', 'gym', 'WEDNESDAY'),
(25, 'obese', 'gym', 'THURSDAY'),
(26, 'obese', 'gym', 'FRIDAY'),
(27, 'obese', 'gym', 'SATURDAY'),
(28, 'obese', 'gym', 'SUNDAY'),
(50, 'obese', 'home_no_equipment', 'MONDAY'),
(51, 'obese', 'home_no_equipment', 'TUESDAY'),
(52, 'obese', 'home_no_equipment', 'WEDNESDAY'),
(53, 'obese', 'home_no_equipment', 'THURSDAY'),
(54, 'obese', 'home_no_equipment', 'FRIDAY'),
(55, 'obese', 'home_no_equipment', 'SATURDAY'),
(56, 'obese', 'home_no_equipment', 'SUNDAY'),
(78, 'obese', 'home_equipment', 'MONDAY'),
(79, 'obese', 'home_equipment', 'TUESDAY'),
(80, 'obese', 'home_equipment', 'WEDNESDAY'),
(81, 'obese', 'home_equipment', 'THURSDAY'),
(82, 'obese', 'home_equipment', 'FRIDAY'),
(83, 'obese', 'home_equipment', 'SATURDAY'),
(84, 'obese', 'home_equipment', 'SUNDAY');

-- --------------------------------------------------------

--
-- Table structure for table `workout_items`
--

CREATE TABLE `workout_items` (
  `id` bigint NOT NULL,
  `workout_category_id` bigint NOT NULL,
  `day` enum('MONDAY','TUESDAY','WEDNESDAY','THURSDAY','FRIDAY','SATURDAY','SUNDAY') COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `detail` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workout_items`
--

INSERT INTO `workout_items` (`id`, `workout_category_id`, `day`, `name`, `detail`) VALUES
(1, 1, 'MONDAY', 'Push-up / Dumbbell Press', '4x10 reps'),
(2, 1, 'MONDAY', 'DB Shoulder Press', '4x8-10 reps'),
(3, 1, 'MONDAY', 'DB Row / Band Row', '4x12 reps'),
(4, 1, 'MONDAY', 'Lateral Raise', '3x12 reps'),
(5, 1, 'MONDAY', 'Bicep Curl', '3x10 reps'),
(6, 1, 'MONDAY', 'Tricep Pushdown', '3x12-15 reps'),
(7, 1, 'MONDAY', 'Chest Fly', '3x10 reps'),
(8, 2, 'TUESDAY', 'Squat', '4x10 reps'),
(9, 2, 'TUESDAY', 'Goblet Squat', '4x10 reps'),
(10, 2, 'TUESDAY', 'Shoulder Press', '3x10 reps'),
(11, 2, 'TUESDAY', 'Deadlift (light)', '3x8 reps'),
(12, 2, 'TUESDAY', 'Glute Bridge', '4x12 reps'),
(13, 2, 'TUESDAY', 'Hip Thrust', '4x10-12 reps'),
(14, 2, 'TUESDAY', 'Calf Raise', '3x15 reps'),
(15, 2, 'TUESDAY', 'Romanian Deadlift', '3x10 reps'),
(16, 2, 'TUESDAY', 'Hamstring Curl', '3x12 reps'),
(17, 3, 'WEDNESDAY', 'Rest', NULL),
(18, 4, 'THURSDAY', 'Goblet Squat', '4x10 reps'),
(19, 4, 'THURSDAY', 'Bench Press', '4x8-10 reps'),
(20, 4, 'THURSDAY', 'DB Row / Band Row', '4x12 reps'),
(21, 4, 'THURSDAY', 'Lat Pulldown / RB Row', '4x10 reps'),
(22, 4, 'THURSDAY', 'Hip Thrust', '4x10-12 reps'),
(23, 4, 'THURSDAY', 'Tricep Extension', '3x12 reps'),
(24, 4, 'THURSDAY', 'Farmer Carry', '3x30 sec'),
(25, 5, 'FRIDAY', 'Bench Press', '4x8-10 reps'),
(26, 5, 'FRIDAY', 'DB Shoulder Press', '4x8-10 reps'),
(27, 5, 'FRIDAY', 'Lateral Raise', '3x12 reps'),
(28, 5, 'FRIDAY', 'Tricep Pushdown', '3x12-15 reps'),
(29, 5, 'FRIDAY', 'Chest Fly', '3x10 reps'),
(30, 6, 'SATURDAY', 'Leg Press', '4x12 reps'),
(31, 6, 'SATURDAY', 'Bulgarian Split Squat', '3x10 reps'),
(32, 6, 'SATURDAY', 'Glute Bridge', '4x12 reps'),
(33, 6, 'SATURDAY', 'Hamstring Curl', '3x12 reps'),
(34, 6, 'SATURDAY', 'Plank', '3x40 sec'),
(35, 6, 'SATURDAY', 'Side Plank', '3x30 sec'),
(36, 7, 'SUNDAY', 'Rest', NULL),
(37, 8, 'MONDAY', 'Bench Press', '4x8-10 reps'),
(38, 8, 'MONDAY', 'Pull-up / Lat Pulldown', '4x8-10 reps'),
(39, 8, 'MONDAY', 'Shoulder Press', '4x8-10 reps'),
(40, 8, 'MONDAY', 'Seated Row', '4x10 reps'),
(41, 8, 'MONDAY', 'Lateral Raise', '3x12 reps'),
(42, 8, 'MONDAY', 'Tricep Pushdown', '3x12-15 reps'),
(43, 8, 'MONDAY', 'Bicep Curl', '3x12 reps'),
(44, 9, 'TUESDAY', 'Squat', '4x8-10 reps'),
(45, 9, 'TUESDAY', 'Deadlift (moderate)', '4x6-8 reps'),
(46, 9, 'TUESDAY', 'Leg Press', '4x10-12 reps'),
(47, 9, 'TUESDAY', 'Hip Thrust', '4x10 reps'),
(48, 9, 'TUESDAY', 'Hamstring Curl', '3x12 reps'),
(49, 9, 'TUESDAY', 'Calf Raise', '3x15 reps'),
(50, 10, 'WEDNESDAY', 'Light Jog / Cycling', '20-30 min'),
(51, 10, 'WEDNESDAY', 'Stretching Routine', '10-15 min'),
(52, 10, 'WEDNESDAY', 'Rest', NULL),
(53, 11, 'THURSDAY', 'Bench Press', '4x8-10 reps'),
(54, 11, 'THURSDAY', 'Incline Dumbbell Press', '4x8-10 reps'),
(55, 11, 'THURSDAY', 'Shoulder Press', '4x8 reps'),
(56, 11, 'THURSDAY', 'Lateral Raise', '3x12 reps'),
(57, 11, 'THURSDAY', 'Tricep Dips', '3x12 reps'),
(58, 11, 'THURSDAY', 'Chest Fly', '3x10 reps'),
(59, 12, 'FRIDAY', 'Deadlift', '4x6 reps'),
(60, 12, 'FRIDAY', 'Lat Pulldown / Pull-up', '4x8-10 reps'),
(61, 12, 'FRIDAY', 'Seated Row', '4x10 reps'),
(62, 12, 'FRIDAY', 'Face Pull', '3x12 reps'),
(63, 12, 'FRIDAY', 'Bicep Curl', '3x12-15 reps'),
(64, 12, 'FRIDAY', 'Hammer Curl', '3x10 reps'),
(65, 13, 'SATURDAY', 'Leg Press', '4x12 reps'),
(66, 13, 'SATURDAY', 'Bulgarian Split Squat', '3x10 reps'),
(67, 13, 'SATURDAY', 'Romanian Deadlift', '3x10 reps'),
(68, 13, 'SATURDAY', 'Hamstring Curl', '3x12 reps'),
(69, 13, 'SATURDAY', 'Plank', '3x45 sec'),
(70, 13, 'SATURDAY', 'Side Plank', '3x30 sec'),
(71, 14, 'SUNDAY', 'Rest', NULL),
(72, 15, 'MONDAY', 'Leg Press', '4x12 reps'),
(73, 15, 'MONDAY', 'Chest Press Machine', '4x10 reps'),
(74, 15, 'MONDAY', 'Lat Pulldown', '4x10 reps'),
(75, 15, 'MONDAY', 'Seated Row', '4x10 reps'),
(76, 15, 'MONDAY', 'DB Shoulder Press', '3x12 reps'),
(77, 15, 'MONDAY', 'Treadmill Walk (incline)', '10-15 min'),
(78, 16, 'TUESDAY', 'Cycling (low intensity)', '20-30 min'),
(79, 16, 'TUESDAY', 'Chest Fly Machine', '3x12 reps'),
(80, 16, 'TUESDAY', 'Bicep Curl', '3x12 reps'),
(81, 16, 'TUESDAY', 'Tricep Pushdown', '3x12 reps'),
(82, 16, 'TUESDAY', 'DB Row', '3x10 reps'),
(83, 16, 'TUESDAY', 'Face Pull', '3x15 reps'),
(84, 17, 'WEDNESDAY', 'Light Walk', '15-20 min'),
(85, 17, 'WEDNESDAY', 'Stretching Routine', '10-15 min'),
(86, 17, 'WEDNESDAY', 'Rest', NULL),
(87, 18, 'THURSDAY', 'Leg Press', '4x12 reps'),
(88, 18, 'THURSDAY', 'Goblet Squat', '3x12 reps'),
(89, 18, 'THURSDAY', 'Hip Thrust', '4x10 reps'),
(90, 18, 'THURSDAY', 'Hamstring Curl', '3x12 reps'),
(91, 18, 'THURSDAY', 'Walking on Treadmill (incline)', '10-15 min'),
(92, 19, 'FRIDAY', 'Chest Press Machine', '4x10 reps'),
(93, 19, 'FRIDAY', 'Lat Pulldown', '4x10 reps'),
(94, 19, 'FRIDAY', 'Shoulder Press', '3x10 reps'),
(95, 19, 'FRIDAY', 'Seated Row', '3x10 reps'),
(96, 19, 'FRIDAY', 'Bicep Curl', '3x12 reps'),
(97, 19, 'FRIDAY', 'Treadmill (1 min fast / 1 min slow)', '10 min'),
(98, 20, 'SATURDAY', 'Plank', '3x30 sec'),
(99, 20, 'SATURDAY', 'Side Plank', '3x20 sec'),
(100, 20, 'SATURDAY', 'Cable Woodchopper', '3x12 reps'),
(101, 20, 'SATURDAY', 'Leg Raise', '3x12 reps'),
(102, 20, 'SATURDAY', 'Cycling (steady pace)', '15-20 min'),
(103, 21, 'SUNDAY', 'Rest', NULL),
(104, 22, 'MONDAY', 'Leg Press (light)', '3x12 reps'),
(105, 22, 'MONDAY', 'Chest Press Machine', '3x10 reps'),
(106, 22, 'MONDAY', 'Lat Pulldown (light)', '3x10 reps'),
(107, 22, 'MONDAY', 'Seated Row', '3x10 reps'),
(108, 22, 'MONDAY', 'DB Shoulder Press (light)', '3x8 reps'),
(109, 22, 'MONDAY', 'Treadmill Walk (flat)', '10-12 min'),
(110, 23, 'TUESDAY', 'Cycling (low intensity)', '15-20 min'),
(111, 23, 'TUESDAY', 'Elliptical', '10 min'),
(112, 23, 'TUESDAY', 'Stretching Routine', '10 min'),
(113, 24, 'WEDNESDAY', 'Light Walk', '10-15 min'),
(114, 24, 'WEDNESDAY', 'Mobility & Stretching', '10 min'),
(115, 24, 'WEDNESDAY', 'Rest', NULL),
(116, 25, 'THURSDAY', 'Chest Press Machine', '3x10 reps'),
(117, 25, 'THURSDAY', 'Seated Row', '3x10 reps'),
(118, 25, 'THURSDAY', 'Lat Pulldown', '3x10 reps'),
(119, 25, 'THURSDAY', 'Shoulder Press Machine (light)', '3x8 reps'),
(120, 25, 'THURSDAY', 'Bicep Curl (light DB)', '3x10 reps'),
(121, 25, 'THURSDAY', 'Treadmill Walk (flat)', '10 min'),
(122, 26, 'FRIDAY', 'Leg Press (light-moderate)', '3x12 reps'),
(123, 26, 'FRIDAY', 'Bodyweight Box Squat', '3x10 reps'),
(124, 26, 'FRIDAY', 'Hamstring Curl Machine', '3x12 reps'),
(125, 26, 'FRIDAY', 'Glute Bridge', '3x12 reps'),
(126, 26, 'FRIDAY', 'Calf Raise (machine)', '3x15 reps'),
(127, 26, 'FRIDAY', 'Cycling (slow pace)', '10-12 min'),
(128, 27, 'SATURDAY', 'Standing Ab Crunch (cable)', '3x12 reps'),
(129, 27, 'SATURDAY', 'Seated Knee Lift', '3x10 reps'),
(130, 27, 'SATURDAY', 'Plank (modified on knees)', '3x20 sec'),
(131, 27, 'SATURDAY', 'Cycling (light)', '10-15 min'),
(132, 28, 'SUNDAY', 'Rest', NULL),
(133, 29, 'MONDAY', 'Push-up', '4x12 reps'),
(134, 29, 'MONDAY', 'Incline Push-up', '4x10 reps'),
(135, 29, 'MONDAY', 'Pike Push-up', '3x10 reps'),
(136, 29, 'MONDAY', 'Tricep Dips (chair)', '3x12 reps'),
(137, 29, 'MONDAY', 'Diamond Push-up', '3x8 reps'),
(138, 29, 'MONDAY', 'Decline Push-up', '3x8 reps'),
(139, 30, 'TUESDAY', 'Squat', '4x12 reps'),
(140, 30, 'TUESDAY', 'Lunge', '3x10 reps'),
(141, 30, 'TUESDAY', 'Glute Bridge', '4x12 reps'),
(142, 30, 'TUESDAY', 'Bulgarian Split Squat (chair)', '3x10 reps'),
(143, 30, 'TUESDAY', 'Calf Raise', '4x12 reps'),
(144, 30, 'TUESDAY', 'Single Leg RDL (no weight)', '3x10 reps'),
(145, 31, 'WEDNESDAY', 'Rest', NULL),
(146, 32, 'THURSDAY', 'Push-up', '4x10 reps'),
(147, 32, 'THURSDAY', 'Squat Jump', '3x12 reps'),
(148, 32, 'THURSDAY', 'Glute Bridge', '4x12 reps'),
(149, 32, 'THURSDAY', 'Reverse Snow Angel', '3x12 reps'),
(150, 32, 'THURSDAY', 'Superman Hold', '3x20 sec'),
(151, 33, 'FRIDAY', 'Push-up', '4x12 reps'),
(152, 33, 'FRIDAY', 'Decline Push-up', '3x10 reps'),
(153, 33, 'FRIDAY', 'Tricep Dips (chair)', '3x12 reps'),
(154, 33, 'FRIDAY', 'Pike Push-up', '3x8 reps'),
(155, 33, 'FRIDAY', 'Diamond Push-up', '3x8 reps'),
(156, 34, 'SATURDAY', 'Squat', '4x12 reps'),
(157, 34, 'SATURDAY', 'Lunge', '3x12 reps'),
(158, 34, 'SATURDAY', 'Glute Bridge', '4x12 reps'),
(159, 34, 'SATURDAY', 'Leg Raise', '3x12 reps'),
(160, 34, 'SATURDAY', 'Plank', '3x40 sec'),
(161, 34, 'SATURDAY', 'Side Plank', '3x30 sec'),
(162, 35, 'SUNDAY', 'Rest', NULL),
(163, 36, 'MONDAY', 'Push-up', '4x12 reps'),
(164, 36, 'MONDAY', 'Decline Push-up', '3x10 reps'),
(165, 36, 'MONDAY', 'Pike Push-up', '3x10 reps'),
(166, 36, 'MONDAY', 'Tricep Dips (chair)', '3x12 reps'),
(167, 36, 'MONDAY', 'Diamond Push-up', '3x8 reps'),
(168, 36, 'MONDAY', 'Wide Push-up', '3x12 reps'),
(169, 37, 'TUESDAY', 'Squat', '4x15 reps'),
(170, 37, 'TUESDAY', 'Lunge', '3x12 reps'),
(171, 37, 'TUESDAY', 'Glute Bridge', '4x15 reps'),
(172, 37, 'TUESDAY', 'Bulgarian Split Squat', '3x10 reps'),
(173, 37, 'TUESDAY', 'Calf Raise', '4x15 reps'),
(174, 37, 'TUESDAY', 'Wall Sit', '3x40 sec'),
(175, 38, 'WEDNESDAY', 'Light Walk', '15-20 min'),
(176, 38, 'WEDNESDAY', 'Stretching Routine', '10-15 min'),
(177, 38, 'WEDNESDAY', 'Rest', NULL),
(178, 39, 'THURSDAY', 'Squat', '3x15 reps'),
(179, 39, 'THURSDAY', 'Push-up', '3x12 reps'),
(180, 39, 'THURSDAY', 'Burpees', '3x10 reps'),
(181, 39, 'THURSDAY', 'Mountain Climber', '3x40 sec'),
(182, 39, 'THURSDAY', 'Plank', '3x40 sec'),
(183, 40, 'FRIDAY', 'Push-up', '4x12 reps'),
(184, 40, 'FRIDAY', 'Incline Push-up', '3x12 reps'),
(185, 40, 'FRIDAY', 'Tricep Dips (chair)', '3x12 reps'),
(186, 40, 'FRIDAY', 'Pike Push-up', '3x8 reps'),
(187, 40, 'FRIDAY', 'Diamond Push-up', '3x8 reps'),
(188, 41, 'SATURDAY', 'Squat', '4x15 reps'),
(189, 41, 'SATURDAY', 'Reverse Lunge', '3x12 reps'),
(190, 41, 'SATURDAY', 'Glute Bridge', '4x15 reps'),
(191, 41, 'SATURDAY', 'Leg Raise', '3x12 reps'),
(192, 41, 'SATURDAY', 'Plank', '3x45 sec'),
(193, 41, 'SATURDAY', 'Side Plank', '3x30 sec'),
(194, 42, 'SUNDAY', 'Rest', NULL),
(195, 43, 'MONDAY', 'Bodyweight Squat', '3x12 reps'),
(196, 43, 'MONDAY', 'Wall Push-up', '3x10 reps'),
(197, 43, 'MONDAY', 'Glute Bridge', '3x12 reps'),
(198, 43, 'MONDAY', 'Step-up (chair)', '3x10 reps'),
(199, 43, 'MONDAY', 'March in Place', '2x1 min'),
(200, 44, 'TUESDAY', 'Walking in Place', '10-15 min'),
(201, 44, 'TUESDAY', 'Arm Circles', '3x30 sec'),
(202, 44, 'TUESDAY', 'Side Steps', '3x30 sec'),
(203, 44, 'TUESDAY', 'Toe Taps (low impact)', '3x30 sec'),
(204, 45, 'WEDNESDAY', 'Light Walk', '10-15 min'),
(205, 45, 'WEDNESDAY', 'Stretching Routine', '10 min'),
(206, 45, 'WEDNESDAY', 'Rest', NULL),
(207, 46, 'THURSDAY', 'Bodyweight Squat', '3x12 reps'),
(208, 46, 'THURSDAY', 'Reverse Lunge (assisted)', '3x10 reps'),
(209, 46, 'THURSDAY', 'Glute Bridge', '3x12 reps'),
(210, 46, 'THURSDAY', 'Calf Raise', '3x12 reps'),
(211, 46, 'THURSDAY', 'Standing Knee Raise', '3x12 reps'),
(212, 47, 'FRIDAY', 'Wall Push-up', '3x12 reps'),
(213, 47, 'FRIDAY', 'Incline Push-up (table)', '3x10 reps'),
(214, 47, 'FRIDAY', 'Arm Circles', '3x40 sec'),
(215, 47, 'FRIDAY', 'Shoulder Tap (slow)', '3x20 reps'),
(216, 47, 'FRIDAY', 'Tricep Dips (chair)', '3x10 reps'),
(217, 48, 'SATURDAY', 'March in Place', '3x1 min'),
(218, 48, 'SATURDAY', 'Side Steps (slow)', '3x30 sec'),
(219, 48, 'SATURDAY', 'Standing Crunch', '3x12 reps'),
(220, 48, 'SATURDAY', 'Plank (modified)', '3x20 sec'),
(221, 49, 'SUNDAY', 'Rest', NULL),
(222, 50, 'MONDAY', 'Chair Squat (assisted)', '3x10 reps'),
(223, 50, 'MONDAY', 'Wall Push-up', '3x10 reps'),
(224, 50, 'MONDAY', 'Glute Bridge', '3x12 reps'),
(225, 50, 'MONDAY', 'Step-up (low height)', '3x8 reps'),
(226, 50, 'MONDAY', 'March in Place (slow)', '2x1 min'),
(227, 51, 'TUESDAY', 'Walking in Place', '8-12 min'),
(228, 51, 'TUESDAY', 'Side Steps (slow)', '3x30 sec'),
(229, 51, 'TUESDAY', 'Arm Swings', '3x30 sec'),
(230, 51, 'TUESDAY', 'Breathing Exercise', '2x1 min'),
(231, 52, 'WEDNESDAY', 'Light Walk', '10 min'),
(232, 52, 'WEDNESDAY', 'Stretching Routine', '10 min'),
(233, 52, 'WEDNESDAY', 'Rest', NULL),
(234, 53, 'THURSDAY', 'Chair Squat', '3x10 reps'),
(235, 53, 'THURSDAY', 'Glute Bridge', '3x12 reps'),
(236, 53, 'THURSDAY', 'Standing Knee Raise', '3x12 reps'),
(237, 53, 'THURSDAY', 'Calf Raise', '3x12 reps'),
(238, 53, 'THURSDAY', 'March in Place', '1x1 min'),
(239, 54, 'FRIDAY', 'Wall Push-up', '3x10 reps'),
(240, 54, 'FRIDAY', 'Incline Push-up (table)', '3x8 reps'),
(241, 54, 'FRIDAY', 'Arm Circles', '3x40 sec'),
(242, 54, 'FRIDAY', 'Shoulder Tap (slow)', '3x10 reps'),
(243, 54, 'FRIDAY', 'Tricep Dips (chair)', '3x8 reps'),
(244, 55, 'SATURDAY', 'March in Place (slow)', '3x1 min'),
(245, 55, 'SATURDAY', 'Side Steps (slow)', '3x30 sec'),
(246, 55, 'SATURDAY', 'Standing Crunch', '3x10 reps'),
(247, 55, 'SATURDAY', 'Plank (modified/knees)', '3x15-20 sec'),
(248, 56, 'SUNDAY', 'Rest', NULL),
(249, 57, 'MONDAY', 'Dumbbell Bench Press (floor press)', '4x10 reps'),
(250, 57, 'MONDAY', 'Dumbbell Shoulder Press', '4x8-10 reps'),
(251, 57, 'MONDAY', 'One-arm Dumbbell Row', '4x12 reps'),
(252, 57, 'MONDAY', 'Dumbbell Curl', '3x10 reps'),
(253, 57, 'MONDAY', 'Dumbbell Tricep Extension', '3x12 reps'),
(254, 57, 'MONDAY', 'Lateral Raise (DB)', '3x12 reps'),
(255, 58, 'TUESDAY', 'Goblet Squat', '4x10 reps'),
(256, 58, 'TUESDAY', 'Dumbbell Romanian Deadlift', '4x10 reps'),
(257, 58, 'TUESDAY', 'Dumbbell Lunge', '3x10 reps'),
(258, 58, 'TUESDAY', 'Dumbbell Glute Bridge', '4x12 reps'),
(259, 58, 'TUESDAY', 'Calf Raise (hold dumbbells)', '3x15 reps'),
(260, 58, 'TUESDAY', 'DB Step-up (chair)', '3x10 reps'),
(261, 59, 'WEDNESDAY', 'Rest', NULL),
(262, 60, 'THURSDAY', 'Goblet Squat', '3x12 reps'),
(263, 60, 'THURSDAY', 'Dumbbell Bench Press (floor)', '3x10 reps'),
(264, 60, 'THURSDAY', 'Dumbbell Bent-over Row', '3x12 reps'),
(265, 60, 'THURSDAY', 'Dumbbell Shoulder Press', '3x10 reps'),
(266, 60, 'THURSDAY', 'Dumbbell Curl', '3x12 reps'),
(267, 60, 'THURSDAY', 'Dumbbell Tricep Extension', '3x12 reps'),
(268, 61, 'FRIDAY', 'Dumbbell Shoulder Press', '4x10 reps'),
(269, 61, 'FRIDAY', 'Dumbbell Floor Press', '4x10 reps'),
(270, 61, 'FRIDAY', 'Dumbbell Lateral Raise', '3x12 reps'),
(271, 61, 'FRIDAY', 'Dumbbell Front Raise', '3x12 reps'),
(272, 61, 'FRIDAY', 'Dumbbell Tricep Kickback', '3x12 reps'),
(273, 62, 'SATURDAY', 'Dumbbell Goblet Squat', '4x12 reps'),
(274, 62, 'SATURDAY', 'Dumbbell Romanian Deadlift', '3x12 reps'),
(275, 62, 'SATURDAY', 'Dumbbell Step-up', '3x10 reps'),
(276, 62, 'SATURDAY', 'Dumbbell Suitcase Carry', '3x30 sec'),
(277, 62, 'SATURDAY', 'Plank', '3x40 sec'),
(278, 62, 'SATURDAY', 'Side Plank', '3x30 sec'),
(279, 63, 'SUNDAY', 'Rest', NULL),
(280, 64, 'MONDAY', 'Dumbbell Floor Press', '4x10 reps'),
(281, 64, 'MONDAY', 'Dumbbell Shoulder Press', '4x10 reps'),
(282, 64, 'MONDAY', 'One-arm Dumbbell Row', '4x12 reps'),
(283, 64, 'MONDAY', 'Dumbbell Curl', '3x12 reps'),
(284, 64, 'MONDAY', 'Dumbbell Tricep Extension', '3x12 reps'),
(285, 64, 'MONDAY', 'Dumbbell Lateral Raise', '3x12 reps'),
(286, 65, 'TUESDAY', 'Dumbbell Goblet Squat', '4x12 reps'),
(287, 65, 'TUESDAY', 'Dumbbell Romanian Deadlift', '4x10 reps'),
(288, 65, 'TUESDAY', 'Dumbbell Lunge', '3x12 reps'),
(289, 65, 'TUESDAY', 'Dumbbell Glute Bridge', '4x12 reps'),
(290, 65, 'TUESDAY', 'Calf Raise (DB)', '3x15 reps'),
(291, 66, 'WEDNESDAY', 'Light Walk', '10-15 min'),
(292, 66, 'WEDNESDAY', 'Stretching Routine', '10 min'),
(293, 66, 'WEDNESDAY', 'Rest', NULL),
(294, 67, 'THURSDAY', 'Dumbbell Goblet Squat', '3x12 reps'),
(295, 67, 'THURSDAY', 'Dumbbell Floor Press', '3x12 reps'),
(296, 67, 'THURSDAY', 'Dumbbell Bent-over Row', '3x12 reps'),
(297, 67, 'THURSDAY', 'Dumbbell Shoulder Press', '3x10 reps'),
(298, 67, 'THURSDAY', 'Dumbbell Curl', '3x12 reps'),
(299, 67, 'THURSDAY', 'Dumbbell Tricep Kickback', '3x12 reps'),
(300, 68, 'FRIDAY', 'Dumbbell Shoulder Press', '4x10 reps'),
(301, 68, 'FRIDAY', 'Dumbbell Floor Press', '4x10 reps'),
(302, 68, 'FRIDAY', 'Dumbbell Lateral Raise', '3x12 reps'),
(303, 68, 'FRIDAY', 'Dumbbell Front Raise', '3x12 reps'),
(304, 68, 'FRIDAY', 'Dumbbell Tricep Extension', '3x12 reps'),
(305, 69, 'SATURDAY', 'Dumbbell Goblet Squat', '4x12 reps'),
(306, 69, 'SATURDAY', 'Dumbbell Romanian Deadlift', '3x12 reps'),
(307, 69, 'SATURDAY', 'Dumbbell Step-up', '3x10 reps'),
(308, 69, 'SATURDAY', 'Dumbbell Suitcase Carry', '3x30 sec'),
(309, 69, 'SATURDAY', 'Plank', '3x45 sec'),
(310, 69, 'SATURDAY', 'Side Plank', '3x30 sec'),
(311, 70, 'SUNDAY', 'Rest', NULL),
(312, 71, 'MONDAY', 'Dumbbell Goblet Squat (light)', '3x12 reps'),
(313, 71, 'MONDAY', 'Dumbbell Floor Press', '3x10 reps'),
(314, 71, 'MONDAY', 'One-arm Dumbbell Row', '3x12 reps'),
(315, 71, 'MONDAY', 'Dumbbell Shoulder Press (light)', '3x8 reps'),
(316, 71, 'MONDAY', 'Dumbbell Curl (light)', '3x12 reps'),
(317, 72, 'TUESDAY', 'March in Place (light)', '2x1 min'),
(318, 72, 'TUESDAY', 'Side Steps (slow)', '3x30 sec'),
(319, 72, 'TUESDAY', 'Dumbbell Deadlift (light)', '3x12 reps'),
(320, 72, 'TUESDAY', 'Dumbbell Lateral Raise (light)', '3x12 reps'),
(321, 72, 'TUESDAY', 'Walking in Place', '6-10 min'),
(322, 73, 'WEDNESDAY', 'Light Walk', '10-15 min'),
(323, 73, 'WEDNESDAY', 'Stretching Routine', '10 min'),
(324, 73, 'WEDNESDAY', 'Rest', NULL),
(325, 74, 'THURSDAY', 'Dumbbell Goblet Squat (light-moderate)', '3x12 reps'),
(326, 74, 'THURSDAY', 'Dumbbell Romanian Deadlift', '3x10 reps'),
(327, 74, 'THURSDAY', 'Dumbbell Glute Bridge', '3x12 reps'),
(328, 74, 'THURSDAY', 'Calf Raise (hold dumbbells)', '3x12 reps'),
(329, 74, 'THURSDAY', 'March in Place', '1x1 min'),
(330, 75, 'FRIDAY', 'Dumbbell Floor Press', '3x10 reps'),
(331, 75, 'FRIDAY', 'Dumbbell Shoulder Press (light)', '3x8 reps'),
(332, 75, 'FRIDAY', 'Dumbbell Bent-over Row', '3x12 reps'),
(333, 75, 'FRIDAY', 'Dumbbell Curl', '3x12 reps'),
(334, 75, 'FRIDAY', 'Dumbbell Tricep Kickback', '3x12 reps'),
(335, 76, 'SATURDAY', 'Standing Dumbbell Side Bend', '3x12 reps'),
(336, 76, 'SATURDAY', 'Plank (modified)', '3x20 sec'),
(337, 76, 'SATURDAY', 'Side Plank (modified)', '3x15-20 sec'),
(338, 76, 'SATURDAY', 'March in Place', '2x1 min'),
(339, 77, 'SUNDAY', 'Rest', NULL),
(340, 78, 'MONDAY', 'Seated Dumbbell Shoulder Press (light)', '3x10 reps'),
(341, 78, 'MONDAY', 'Seated Dumbbell Curl', '3x12 reps'),
(342, 78, 'MONDAY', 'Seated Dumbbell Row (one-arm)', '3x10 reps'),
(343, 78, 'MONDAY', 'Chair Squat (assisted)', '3x10 reps'),
(344, 78, 'MONDAY', 'March in Place (slow)', '1x1 min'),
(345, 79, 'TUESDAY', 'March in Place', '2x1 min'),
(346, 79, 'TUESDAY', 'Side Step Touch', '3x30 sec'),
(347, 79, 'TUESDAY', 'Dumbbell Front Raise (light)', '3x10 reps'),
(348, 79, 'TUESDAY', 'Seated Dumbbell Curl', '3x12 reps'),
(349, 79, 'TUESDAY', 'Walking in Place', '6-10 min'),
(350, 80, 'WEDNESDAY', 'Light Walk', '10-12 min'),
(351, 80, 'WEDNESDAY', 'Stretching Routine', '10 min'),
(352, 80, 'WEDNESDAY', 'Rest', NULL),
(353, 81, 'THURSDAY', 'Dumbbell Deadlift (light)', '3x10 reps'),
(354, 81, 'THURSDAY', 'Dumbbell Step-up (low height)', '3x8 reps'),
(355, 81, 'THURSDAY', 'Dumbbell Glute Bridge', '3x12 reps'),
(356, 81, 'THURSDAY', 'Calf Raise (support)', '3x12 reps'),
(357, 81, 'THURSDAY', 'March in Place (slow)', '1x1 min'),
(358, 82, 'FRIDAY', 'Seated Dumbbell Shoulder Press', '3x10 reps'),
(359, 82, 'FRIDAY', 'Seated Dumbbell Row', '3x12 reps'),
(360, 82, 'FRIDAY', 'Dumbbell Chest Press (floor)', '3x10 reps'),
(361, 82, 'FRIDAY', 'Dumbbell Curl', '3x12 reps'),
(362, 82, 'FRIDAY', 'Dumbbell Tricep Extension', '3x12 reps'),
(363, 83, 'SATURDAY', 'Standing Dumbbell Side Bend', '3x12 reps'),
(364, 83, 'SATURDAY', 'Seated Knee Lift', '3x10 reps'),
(365, 83, 'SATURDAY', 'Modified Plank (knees)', '3x15-20 sec'),
(366, 83, 'SATURDAY', 'March in Place', '1x1 min'),
(367, 84, 'SUNDAY', 'Rest', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daily_tasks`
--
ALTER TABLE `daily_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_categories`
--
ALTER TABLE `food_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_food_category_bmi_meal` (`bmi_category`,`meal_type`);

--
-- Indexes for table `food_items`
--
ALTER TABLE `food_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_category_id` (`food_category_id`);

--
-- Indexes for table `skincare_products`
--
ALTER TABLE `skincare_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `step_id` (`step_id`);

--
-- Indexes for table `skincare_steps`
--
ALTER TABLE `skincare_steps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_daily_tasks`
--
ALTER TABLE `user_daily_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_id` (`task_id`),
  ADD KEY `idx_user_daily_tasks_user_date` (`user_id`,`task_date`);

--
-- Indexes for table `workout_categories`
--
ALTER TABLE `workout_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_workout_category` (`bmi_category`,`workout_preference`,`day`);

--
-- Indexes for table `workout_items`
--
ALTER TABLE `workout_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_workout_items_category` (`workout_category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daily_tasks`
--
ALTER TABLE `daily_tasks`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `food_categories`
--
ALTER TABLE `food_categories`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `food_items`
--
ALTER TABLE `food_items`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `skincare_products`
--
ALTER TABLE `skincare_products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `skincare_steps`
--
ALTER TABLE `skincare_steps`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_daily_tasks`
--
ALTER TABLE `user_daily_tasks`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `workout_categories`
--
ALTER TABLE `workout_categories`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `workout_items`
--
ALTER TABLE `workout_items`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=368;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `food_items`
--
ALTER TABLE `food_items`
  ADD CONSTRAINT `food_items_ibfk_1` FOREIGN KEY (`food_category_id`) REFERENCES `food_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `skincare_products`
--
ALTER TABLE `skincare_products`
  ADD CONSTRAINT `skincare_products_ibfk_1` FOREIGN KEY (`step_id`) REFERENCES `skincare_steps` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_daily_tasks`
--
ALTER TABLE `user_daily_tasks`
  ADD CONSTRAINT `user_daily_tasks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_daily_tasks_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `daily_tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `workout_items`
--
ALTER TABLE `workout_items`
  ADD CONSTRAINT `workout_items_ibfk_1` FOREIGN KEY (`workout_category_id`) REFERENCES `workout_categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
