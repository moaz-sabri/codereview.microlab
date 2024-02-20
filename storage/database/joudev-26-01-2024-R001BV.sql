-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Jan 26, 2024 at 06:11 PM
-- Server version: 5.7.44
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `joudev`
--

-- --------------------------------------------------------

--
-- Table structure for table `authentication`
--

CREATE TABLE `authentication` (
  `uid` int(11) NOT NULL,
  `guide` char(14) NOT NULL,
  `owner` int(11) NOT NULL,
  `token` char(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authentication`
--

INSERT INTO `authentication` (`uid`, `guide`, `owner`, `token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'T-07b1b64515b0', 1, '2657a7df0bb36d11f180ebb2ca5bd7573e5a82fcd61faa444ed48f0012b023c50e2b691914010e8699466df8c77da37ac7aa1e603076b200dac3709ec12210ce', '2023-12-14 05:10:57', '2023-12-14 06:57:00', NULL),
(2, 'T-8a5b3b4962aa', 1, '8cebfab4f3e704bc9426f8c80ec3cda41007c156800e76f7f3dfecebc1972c4db89f6eb0c77ad4d1c1244403bd6ab700da0cbaf28eb1ff57ee63fcf635cfe495', '2023-12-22 02:41:12', '2023-12-22 03:12:00', NULL),
(4, 'T-df8bce9d3f43', 1, '0c208daf0fe75f13b61b3bf001f9b629c5b6ba828f0cbf7498a8b60a50f0fbd52b577ad885e3c9b61b6a98182b957da4d4fdf359be373e72592cdd2c1a6be7c9', '2023-12-22 23:14:22', '2023-12-23 12:22:00', '2023-12-24 02:59:23'),
(5, 'T-6e97147eede2', 5, 'b04fa47af9015da8452cc6d0c5370393dab26a0054a303b0dadf5a311843bad2da9310aebe744a0e6f600c6bd2646b3a67dd27d8918db759e5115ddb97cfab4a', '2023-12-23 04:53:37', '2023-12-23 05:37:00', NULL),
(6, 'T-25a012677f51', 1, 'c5bb66a9e7d060a545d8e2d8cf8b73f070353d5605527b9fe60ec988eceb374a9a22a29ecdba03356d3305ef0439e0f13a80d677e6e5a1709c4a8b54a743387f', '2023-12-24 02:59:38', '2023-12-24 03:38:00', '2023-12-30 10:22:27'),
(7, 'T-e80296794b23', 1, 'af3a81b2b0066e141c5e21023a5d555ee1635e8255a4a0a0534ae96b836349b266f59030cf1d083cd3077b94bf21457176192b7698cbd3fb3fa2186be6385867', '2024-01-25 01:56:28', '2024-01-25 02:28:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `filestorage`
--

CREATE TABLE `filestorage` (
  `uid` int(11) NOT NULL,
  `guide` char(14) NOT NULL,
  `owner` int(11) NOT NULL,
  `type` char(33) NOT NULL,
  `status` char(33) DEFAULT 'ENABLE',
  `allow` char(33) DEFAULT '1',
  `path` char(255) DEFAULT NULL,
  `name` char(33) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `extension` char(33) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `filestorage`
--

INSERT INTO `filestorage` (`uid`, `guide`, `owner`, `type`, `status`, `allow`, `path`, `name`, `size`, `extension`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'F-35083036f9fb', 1, '-', 'ENABLE', '1', '/uploads/U-DEVELOPER001/media/file_657a8e6ae17c7.png', 'screenshot2023-08-15043636.png', 41084, 'png', '2023-12-14 05:11:06', '2023-12-14 06:06:00', NULL),
(2, 'F-f69390d7e801', 1, '-', 'ENABLE', '1', '/uploads/U-DEVELOPER001/media/file_65b1c756317d4.png', 'screenshot2023-08-15044822.png', 13132, 'png', '2024-01-25 02:28:38', '2024-01-25 03:38:00', NULL),
(3, 'F-5a05ef621625', 1, '-', 'ENABLE', '1', '/uploads/U-DEVELOPER001/media/file_65b1c76d242e7.png', 'screenshot2023-11-09200818.png', 24450, 'png', '2024-01-25 02:29:01', '2024-01-25 03:01:00', NULL),
(4, 'F-cb6031af960c', 1, '-', 'ENABLE', '1', '/uploads/U-DEVELOPER001/media/file_65b1c76d2f2dd.png', 'screenshot2023-11-09200834.png', 5633, 'png', '2024-01-25 02:29:01', '2024-01-25 03:01:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mailbox`
--

CREATE TABLE `mailbox` (
  `uid` int(11) NOT NULL,
  `guide` char(14) NOT NULL,
  `type` char(33) DEFAULT 'OTHER',
  `status` char(33) DEFAULT 'NEW',
  `name` char(255) DEFAULT NULL,
  `telnumber` char(255) DEFAULT NULL,
  `subject` char(255) DEFAULT NULL,
  `email` char(255) DEFAULT NULL,
  `message` char(255) DEFAULT NULL,
  `source` char(33) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mailbox`
--

INSERT INTO `mailbox` (`uid`, `guide`, `type`, `status`, `name`, `telnumber`, `subject`, `email`, `message`, `source`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'E-1bd20546vccc', 'OTHER', 'NEW', 'dgdgf', 'dfgbdfgb', 'dfgbdfgbd', 'fgbdfgbd', 'fgbdfgdbdfgb', NULL, '2023-12-22 03:18:57', NULL, NULL),
(2, 'E-9a082273adfc', 'CONTACT', 'NEW', 'fghdfghdfgh', NULL, 'dfghdfghdyvfyvfdydfv', 'gy.sabri@hotmail.com', 'fghdfghdfghydfvydfyfvyfdvydfvyydfvydvfyvydfv', NULL, '2023-12-22 04:57:17', '2023-12-22 05:17:00', NULL),
(3, 'E-7fefac551e1d', 'CONTACT', 'NEW', 'fghdfghdfgh', NULL, 'dfghdfghdyvfyvfdydfv', 'gy.sabri@hotmail.com', 'fghdfghdfghydfvydfyfvyfdvydfvyydfvydvfyvydfv', NULL, '2023-12-22 04:58:00', '2023-12-22 05:00:00', NULL),
(4, 'E-d88a85150584', 'CONTACT', 'NEW', 'dfghdfghd', NULL, 'gfhdfghdfghdfghdfghd', 'gy.sabri@outlook.com', 'fghdfghdghdgfhdghdfh', NULL, '2023-12-22 05:00:22', '2023-12-22 06:22:00', NULL),
(5, 'E-67fcab8b97a0', 'CONTACT', 'NEW', 'Dev Test', NULL, 'sdfasdfdghdgfhdghd', 'gy.sabri@test.com', 'dfghdfghdfghdfghdhdhfghdfghdfghdfg', NULL, '2023-12-22 23:14:02', '2023-12-23 12:02:00', NULL),
(6, 'E-83e11f9c4ef0', 'CONTACT', 'NEW', 'Moaz Sabri', NULL, 'dgfhdfghdfghd', 'gy.sabri@test1.com', 'fghdfghdfghdfghdfghdhgfhdfgh', NULL, '2023-12-22 23:48:17', '2023-12-23 12:17:00', NULL),
(7, 'E-4a31e68f29bf', 'CONTACT', 'NEW', 'Moaz Sabri', NULL, 'fgdhdghdfghmfgh', 'gy.sabri@test2.com', 'fghdfghdfghdfghvmgnmfgvhmmmfghmfghm', NULL, '2023-12-22 23:50:00', '2023-12-23 12:00:00', NULL),
(8, 'E-d34c7d908f2a', 'CONTACT', 'NEW', 'Moaz Sabri', NULL, 'Get in Touch and Ignite Your Digital Transformation!', 'gy.sabri@hotmail.com', 'http://localhost:8090/home', NULL, '2023-12-23 03:01:18', '2023-12-23 04:18:00', NULL),
(9, 'E-1c9585649eab', 'CONTACT', 'NEW', 'Moaz Sabri', NULL, 'Get in Touch and Ignite Your Digital Transformation!', 'gy.sabri@hotmail.com', '  $saWQDwqdWQDqwdQWDqwdQWDqwdWQwqd', NULL, '2023-12-23 03:02:48', '2023-12-23 04:48:00', NULL),
(10, 'E-a54c34433ddb', 'CONTACT', 'NEW', 'Moaz Sabri', NULL, 'Get in Touch and Ignite Your Digital Transformation!', 'gy.sabri@hotmail.com', '  $saWQDwqdWQDqwdQWDqwdQWDqwdWQwqd', NULL, '2023-12-23 03:06:24', '2023-12-23 04:24:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mailshistory`
--

CREATE TABLE `mailshistory` (
  `uid` int(11) NOT NULL,
  `guide` char(14) NOT NULL,
  `owner` int(11) DEFAULT '-1',
  `type` char(33) DEFAULT NULL,
  `status` char(33) DEFAULT NULL,
  `response` char(255) DEFAULT NULL,
  `template` varchar(1500) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `uid` int(11) NOT NULL,
  `guide` char(14) NOT NULL,
  `owner` int(11) NOT NULL,
  `status` char(33) DEFAULT 'READ',
  `header` char(255) DEFAULT NULL,
  `resource` char(255) DEFAULT NULL,
  `content` char(255) DEFAULT NULL,
  `type` char(33) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`uid`, `guide`, `owner`, `status`, `header`, `resource`, `content`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'N-2daa701d2f27', 1, 'READ', 'created new project', '/websites/preview/A-a226ffebf256-testproject', NULL, 'PRODUCT', '2023-12-14 15:11:45', '2023-12-14 04:45:00', NULL),
(2, 'N-ebc95cb565a9', 1, 'READ', 'created new project', '/websites/preview/A-28f81469ba3c-wtwertwert', NULL, 'PRODUCT', '2023-12-22 02:42:17', '2023-12-22 03:17:00', NULL),
(3, 'N-94801dfc3b45', 1, 'READ', 'created new project', '/products/preview/A-dbbf684b22fd-ddddddddddd', NULL, 'PRODUCT', '2023-12-22 02:43:16', '2023-12-22 03:16:00', NULL),
(4, 'N-a37bd13e3990', 1, 'READ', 'created new project', '/products/preview/A-168cc11c9246-ddddddddddd', NULL, 'PRODUCT', '2023-12-22 02:45:12', '2023-12-22 03:12:00', NULL),
(5, 'N-2a4c1fbc8202', 1, 'READ', 'created new project', '/products/preview/A-eba03cc8213e-ddddddddddd', NULL, 'PRODUCT', '2023-12-22 02:46:47', '2023-12-22 03:47:00', NULL),
(6, 'N-d66ead75fdfe', 1, 'READ', 'created new project', '/websites/preview/A-75cc395b5f62-ghdghdf', NULL, 'PRODUCT', '2023-12-22 02:47:59', '2023-12-22 03:59:00', NULL),
(7, 'N-3444f2c9c26b', 1, 'READ', 'created new project', '/websites/preview/A-d659ca6f17eb-testproject', NULL, 'PRODUCT', '2023-12-22 23:34:29', '2023-12-23 12:29:00', NULL),
(8, 'N-3776ee1ac638', 1, 'READ', 'created new project', '/websites/preview/A-5ed4ddd1a8f0-testproject', NULL, 'PRODUCT', '2023-12-22 23:34:31', '2023-12-23 12:31:00', NULL),
(9, 'N-f7f009445c30', 1, 'READ', 'created new project', '/websites/preview/A-6a934d222792-testproject', NULL, 'PRODUCT', '2023-12-22 23:37:12', '2023-12-23 12:12:00', NULL),
(10, 'N-d7e503de0710', 1, 'READ', 'created new project', '/websites/preview/A-e2c0d210dd1d-testproject', NULL, 'PRODUCT', '2023-12-22 23:37:28', '2023-12-23 12:28:00', NULL),
(11, 'N-1e50306a54cb', 1, 'READ', 'created new project', '/products/preview/A-0bad582c3c0f-fghjfghjfghjfgh', NULL, 'PRODUCT', '2023-12-23 03:17:23', '2023-12-23 04:23:00', NULL),
(12, 'N-d351e0e63f8f', 1, 'READ', 'created new project', '/blog/preview/A-3373af10d144-ggggggggggggggg', NULL, 'PRODUCT', '2023-12-23 03:17:49', '2023-12-23 04:49:00', NULL),
(13, 'N-bf366c6503f2', 1, 'READ', 'created new project', '/blog/preview/A-5feb3aad8f5f-ggggggggggggggg', NULL, 'PRODUCT', '2023-12-23 03:21:43', '2023-12-23 04:43:00', NULL),
(14, 'N-a6c7946086e6', 1, 'READ', 'created new project', '/products/preview/A-590a3697bbd0-asdfasdf', NULL, 'PRODUCT', '2023-12-23 03:48:08', '2023-12-23 04:08:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `uid` int(11) NOT NULL,
  `guide` char(14) NOT NULL,
  `type` char(33) DEFAULT 'OTHER',
  `start` char(33) DEFAULT 'asap',
  `speed` char(255) DEFAULT 'normal',
  `budget` char(255) DEFAULT '0',
  `message` char(255) DEFAULT NULL,
  `name` char(255) DEFAULT NULL,
  `email` char(255) DEFAULT NULL,
  `phone` char(33) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`uid`, `guide`, `type`, `start`, `speed`, `budget`, `message`, `name`, `email`, `phone`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'O-ef090225c5de', 'PORTFOLIO', 'WEEK', 'EXPRESS', '456', 'ghdgh', 'Moaz Sabri', 'gy.sabri@ggggg.com', '+4368184500300', '2023-12-22 03:20:25', '2023-12-22 04:25:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `passwordreset`
--

CREATE TABLE `passwordreset` (
  `uid` int(11) NOT NULL,
  `guide` char(14) NOT NULL,
  `owner` int(11) NOT NULL,
  `verifiedcode` char(9) NOT NULL,
  `status` char(33) DEFAULT 'PENNING',
  `mail_status` char(33) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passwordreset`
--

INSERT INTO `passwordreset` (`uid`, `guide`, `owner`, `verifiedcode`, `status`, `mail_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'R-07146cbb3e5c', 3, '7a0a-3c35', 'PENNING', NULL, '2023-12-22 03:29:27', '2023-12-22 04:27:00', NULL),
(2, 'R-6e30a4677c2b', 3, 'f66e-bc74', 'PENNING', NULL, '2023-12-22 03:51:34', '2023-12-22 04:34:00', NULL),
(3, 'R-c5916886b835', 3, '8a2d-b58b', 'PENNING', NULL, '2023-12-22 04:06:16', '2023-12-22 05:16:00', NULL),
(4, 'R-f936bcf17cba', 3, '09db-41ed', 'PENNING', NULL, '2023-12-22 04:09:17', '2023-12-22 05:17:00', NULL),
(5, 'R-f6e93915adb8', 3, 'ba24-1413', 'PENNING', NULL, '2023-12-22 04:09:30', '2023-12-22 05:30:00', NULL),
(6, 'R-5397bc137dd4', 3, 'ee52-5ee9', 'PENNING', NULL, '2023-12-22 04:11:15', '2023-12-22 05:15:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissiongroups`
--

CREATE TABLE `permissiongroups` (
  `uid` int(11) NOT NULL,
  `guide` char(14) NOT NULL,
  `status` char(11) NOT NULL DEFAULT 'ENABLE',
  `name` char(33) NOT NULL,
  `description` char(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permissiongroups`
--

INSERT INTO `permissiongroups` (`uid`, `guide`, `status`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'G-DEFAULTGROUP', 'ENABLE', 'master', NULL, '2023-12-14 05:10:23', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `uid` int(11) NOT NULL,
  `guide` char(14) NOT NULL,
  `group_id` int(11) NOT NULL,
  `action` char(255) DEFAULT NULL,
  `module` char(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`uid`, `guide`, `group_id`, `action`, `module`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'P-PERMISSIN001', 1, 'all', 'user', '2023-12-14 05:10:25', NULL, NULL),
(2, 'P-PERMISSIN002', 1, 'all', 'api', '2023-12-14 05:10:25', NULL, NULL),
(3, 'P-PERMISSIN003', 1, 'all', 'history', '2023-12-14 05:10:25', NULL, NULL),
(4, 'P-PERMISSIN004', 1, 'all', 'permission', '2023-12-14 05:10:25', NULL, NULL),
(5, 'P-PERMISSIN005', 1, 'all', 'languageloader', '2023-12-14 05:10:25', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projectcategories`
--

CREATE TABLE `projectcategories` (
  `uid` int(11) NOT NULL,
  `guide` char(14) NOT NULL,
  `project_id` int(11) NOT NULL,
  `name` char(33) NOT NULL DEFAULT 'unkonown',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projectcategories`
--

INSERT INTO `projectcategories` (`uid`, `guide`, `project_id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'C-33bd2c8a97fa', 1, 'wertwert', '2023-12-22 02:42:17', '2023-12-22 03:17:00', NULL),
(2, 'C-e3d3e112b79d', 2, 'asdfasdfasdfasdfa', '2023-12-22 02:43:16', '2023-12-22 03:16:00', NULL),
(3, 'C-ed1d2f360f9b', 3, 'asdfasdfasdfasdfa', '2023-12-22 02:45:12', '2023-12-22 03:12:00', NULL),
(4, 'C-24b134ec2578', 4, 'asdfasdfasdfasdfa', '2023-12-22 02:46:47', '2023-12-22 03:47:00', NULL),
(5, 'C-b3e2d6054949', 5, 'dfghdfghdfgh', '2023-12-22 02:47:59', '2023-12-22 03:59:00', NULL),
(7, 'C-5d689eac05d4', 7, 'unkonown', '2023-12-22 23:34:30', '2023-12-23 12:30:00', NULL),
(10, 'C-9c31db2afc42', 10, 'fghjfghjf', '2023-12-23 03:17:23', '2023-12-23 04:23:00', NULL),
(11, 'C-236e050bc294', 11, 'ggggggggg', '2023-12-23 03:17:49', '2023-12-23 04:49:00', NULL),
(12, 'C-8e3cb8bd71ff', 12, 'ggggggggg', '2023-12-23 03:21:43', '2023-12-23 04:43:00', NULL),
(13, 'C-db4d86c624ec', 13, 'asdfasdfasdf', '2023-12-23 03:48:08', '2023-12-23 04:08:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projectfile`
--

CREATE TABLE `projectfile` (
  `uid` int(11) NOT NULL,
  `guide` char(14) NOT NULL,
  `project_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `location` char(33) NOT NULL,
  `allow` char(33) DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projectfile`
--

INSERT INTO `projectfile` (`uid`, `guide`, `project_id`, `file_id`, `location`, `allow`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 'M-2714a1f9be42', 5, 2, 'GALLERY', '1', '2024-01-25 02:50:34', '2024-01-25 03:34:00', NULL),
(5, 'M-3acb05c82a04', 5, 4, 'THUMBNAIL', '1', '2024-01-25 02:59:03', '2024-01-25 03:03:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projectmeta`
--

CREATE TABLE `projectmeta` (
  `uid` int(11) NOT NULL,
  `guide` char(14) NOT NULL,
  `project_id` int(11) NOT NULL,
  `thumbnail_id` char(255) DEFAULT NULL,
  `keywords` char(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projectmeta`
--

INSERT INTO `projectmeta` (`uid`, `guide`, `project_id`, `thumbnail_id`, `keywords`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'M-3d2aec6c11ac', 1, NULL, NULL, NULL, '2023-12-22 02:42:17', '2023-12-22 03:17:00', NULL),
(2, 'M-8757def7266b', 2, NULL, NULL, NULL, '2023-12-22 02:43:16', '2023-12-22 03:16:00', NULL),
(3, 'M-2dec7328ed36', 3, NULL, NULL, NULL, '2023-12-22 02:45:12', '2023-12-22 03:12:00', NULL),
(4, 'M-a12948916340', 4, NULL, NULL, NULL, '2023-12-22 02:46:47', '2023-12-22 03:47:00', NULL),
(5, 'M-91fe8d35254b', 5, '4', NULL, NULL, '2023-12-22 02:47:59', '2024-01-25 03:03:00', NULL),
(7, 'M-3f3259f91044', 7, NULL, 'testproject, testproject, testproject', 'testproject testproject', '2023-12-22 23:34:30', '2023-12-23 12:30:00', NULL),
(10, 'M-bad36b981b8a', 10, NULL, NULL, NULL, '2023-12-23 03:17:23', '2023-12-23 04:23:00', NULL),
(11, 'M-677a84bb42cb', 11, NULL, NULL, NULL, '2023-12-23 03:17:49', '2023-12-23 04:49:00', NULL),
(12, 'M-bd289e06cf90', 12, NULL, NULL, NULL, '2023-12-23 03:21:43', '2023-12-23 04:43:00', NULL),
(13, 'M-fa182255773c', 13, NULL, NULL, NULL, '2023-12-23 03:48:08', '2023-12-23 04:08:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `uid` int(11) NOT NULL,
  `guide` char(14) NOT NULL,
  `owner` int(11) NOT NULL,
  `status` char(33) DEFAULT 'ENABLE',
  `allow` char(33) DEFAULT '1',
  `friendlyurl` char(255) DEFAULT NULL,
  `title` char(255) DEFAULT NULL,
  `content` char(255) DEFAULT NULL,
  `type` char(33) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`uid`, `guide`, `owner`, `status`, `allow`, `friendlyurl`, `title`, `content`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'A-28f81469ba3c', 1, 'ENABLE', '1', 'A-28f81469ba3c-wtwertwert', 'wtwertwert', '/var/www/html/app/../storage/uploads/U-DEVELOPER001/contents/file_6584f7896255c.txt', 'WEBSITES', '2023-12-22 02:42:17', '2023-12-22 03:17:00', NULL),
(2, 'A-dbbf684b22fd', 1, 'ENABLE', '1', 'A-dbbf684b22fd-ddddddddddd', 'ddddddddddd', '/var/www/html/app/../storage/uploads/U-DEVELOPER001/contents/file_6584f7c41fca3.txt', 'PRODUCTS', '2023-12-22 02:43:16', '2023-12-22 03:16:00', NULL),
(3, 'A-168cc11c9246', 1, 'ENABLE', '1', 'A-168cc11c9246-ddddddddddd', 'ddddddddddd', '/var/www/html/app/../storage/uploads/U-DEVELOPER001/contents/file_6584f838cae1c.txt', 'PRODUCTS', '2023-12-22 02:45:12', '2023-12-22 03:12:00', NULL),
(4, 'A-eba03cc8213e', 1, 'DISABLED', '1', 'A-eba03cc8213e-ddddddddddd', 'ddddddddddd', '/var/www/html/app/../storage/uploads/U-DEVELOPER001/contents/file_6584f896f13df.txt', 'PRODUCTS', '2023-12-22 02:46:47', '2023-12-22 04:35:00', NULL),
(5, 'A-75cc395b5f62', 1, 'DISABLED', '1', 'A-75cc395b5f62-CodeCraftsmanship', 'Code Craftsmanship', '/var/www/html/app/../storage/uploads/U-DEVELOPER001/contents/file_6586587835c93.txt', 'WEBSITES', '2023-12-22 02:47:58', '2024-01-25 03:03:00', NULL),
(7, 'A-5ed4ddd1a8f0', 1, 'DISABLED', '1', 'A-5ed4ddd1a8f0-testproject', 'testproject', '/var/www/html/app/../storage/uploads/U-DEVELOPER001/contents/file_65861d069fb1d.txt', 'WEBSITES', '2023-12-22 23:34:30', '2023-12-25 04:17:00', NULL),
(10, 'A-0bad582c3c0f', 1, 'ENABLE', '1', 'A-0bad582c3c0f-fghjfghjfghjfgh', 'fghjfghjfghjfgh', '/var/www/html/app/../storage/uploads/U-DEVELOPER001/contents/file_658651439e4ba.txt', 'PRODUCTS', '2023-12-23 03:17:23', '2023-12-23 04:23:00', NULL),
(11, 'A-3373af10d144', 1, 'DISABLED', '1', 'A-3373af10d144-ggggggggggggggg', 'ggggggggggggggg', '/var/www/html/app/../storage/uploads/U-DEVELOPER001/contents/file_6586515db31b2.txt', 'BLOG', '2023-12-23 03:17:49', '2023-12-25 04:17:00', NULL),
(12, 'A-5feb3aad8f5f', 1, 'ENABLE', '1', 'A-5feb3aad8f5f-ggggggggggggggg', 'ggggggggggggggg', '../storage/{ uploads/U-DEVELOPER001/contents/}file_6586524721ea0.txt', 'BLOG', '2023-12-23 03:21:43', '2023-12-23 04:43:00', NULL),
(13, 'A-590a3697bbd0', 1, 'ENABLE', '1', 'A-590a3697bbd0-asdfasdf', 'asdfasdf', '../storage/uploads/U-DEVELOPER001/contents/file_6586587835c93.txt', 'PRODUCTS', '2023-12-23 03:48:08', '2023-12-23 04:08:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projecttags`
--

CREATE TABLE `projecttags` (
  `uid` int(11) NOT NULL,
  `guide` char(14) NOT NULL,
  `project_id` int(11) NOT NULL,
  `name` char(255) DEFAULT 'unkonown',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projecttags`
--

INSERT INTO `projecttags` (`uid`, `guide`, `project_id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'T-ac8ee6286066', 1, 'unkonown', '2023-12-22 02:42:17', '2023-12-22 03:17:00', NULL),
(2, 'T-f1e9a00a5bd3', 2, 'unkonown', '2023-12-22 02:43:16', '2023-12-22 03:16:00', NULL),
(5, 'T-df1680430ccb', 7, 'testproject', '2023-12-22 23:34:30', '2023-12-23 12:30:00', NULL),
(6, 'T-5d95d073b492', 7, 'testproject2', '2023-12-22 23:34:30', '2023-12-23 12:30:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE `records` (
  `uid` int(11) NOT NULL,
  `guide` char(14) NOT NULL,
  `owner` int(11) DEFAULT NULL,
  `type` char(33) NOT NULL,
  `status` char(33) NOT NULL,
  `message` longtext NOT NULL,
  `hash` char(33) DEFAULT NULL,
  `code` char(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `records`
--

INSERT INTO `records` (`uid`, `guide`, `owner`, `type`, `status`, `message`, `hash`, `code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'G-25d248bc07d1', 1, 'history', 'success', 'Welcome, developer! You are now logged in.', NULL, NULL, '2023-12-14 05:10:57', NULL, NULL),
(2, 'G-e60b58fdd130', 1, 'history', 'success', 'New traffic created successfully.T-e1523d228c36.', NULL, NULL, '2023-12-14 05:10:58', NULL, NULL),
(3, 'G-e10c1590895d', 1, 'history', 'success', 'New traffic created successfully.T-9b8ce97bd244.', NULL, NULL, '2023-12-14 05:11:00', NULL, NULL),
(4, 'G-169034ed35d9', 1, 'history', 'success', 'New image uploaded successfully.', NULL, NULL, '2023-12-14 05:11:06', NULL, NULL),
(5, 'G-e03053f62b76', 1, 'history', 'success', 'New filestorage created successfully.F-35083036f9fb.', NULL, NULL, '2023-12-14 05:11:06', NULL, NULL),
(6, 'G-c91fea1b3be5', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/filestorage.', NULL, NULL, '2023-12-14 05:11:08', NULL, NULL),
(7, 'G-d937190771b2', 1, 'history', 'success', 'New traffic created successfully.T-6d3f08b6295d.', NULL, NULL, '2023-12-14 05:11:13', NULL, NULL),
(8, 'G-59e937086e73', 1, 'history', 'success', 'New traffic created successfully.T-154d41c7949d.', NULL, NULL, '2023-12-14 05:11:17', NULL, NULL),
(9, 'G-e75590705cbd', 1, 'history', 'success', 'New traffic created successfully.T-0b7f8f8fc5a0.', NULL, NULL, '2023-12-14 05:11:46', NULL, NULL),
(10, 'G-32595f9c3560', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/logs.', NULL, NULL, '2023-12-14 05:11:49', NULL, NULL),
(11, 'G-b9c3024a4bbb', 1, 'history', 'success', 'New traffic created successfully.T-374f20ad6e1c.', NULL, NULL, '2023-12-14 05:11:52', NULL, NULL),
(12, 'G-4d8080b403aa', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/logs.', NULL, NULL, '2023-12-14 05:11:54', NULL, NULL),
(13, 'G-7c2019287433', 1, 'history', 'success', 'New traffic created successfully.T-b5af71e318e9.', NULL, NULL, '2023-12-14 05:11:56', NULL, NULL),
(14, 'G-db98dedc7609', 1, 'history', 'success', 'New traffic created successfully.T-ea1b17929f87.', NULL, NULL, '2023-12-14 05:11:59', NULL, NULL),
(15, 'L-d730d574cab3', 1, 'log', 'fails', 'Error: SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'1\' for key \'PRIMARY\'', '3IzcJzluUSV8o8', '500', '2023-12-14 05:13:38', NULL, NULL),
(16, 'L-e51c3104d3f8', 1, 'log', 'fails', 'Error: SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'1\' for key \'PRIMARY\'', '3IzcJzluUSV8o8', '500', '2023-12-14 05:13:39', NULL, NULL),
(17, 'G-14c8c8c30642', 1, 'history', 'success', 'New traffic created successfully.T-63d5a407bb93.', NULL, NULL, '2023-12-14 05:13:40', NULL, NULL),
(18, 'G-93688ff2af5d', 1, 'history', 'success', 'New traffic created successfully.T-582027e00edf.', NULL, NULL, '2023-12-14 05:13:59', NULL, NULL),
(19, 'G-6e06dc623602', 1, 'history', 'success', 'Updated traffic successfully.  /setup?hash=eFTFDFWemp$WIaJJ$ABJs60aXMxEnGLa.', NULL, NULL, '2023-12-14 05:14:03', NULL, NULL),
(20, 'G-46fb6426427f', 1, 'history', 'success', 'Updated traffic successfully.  /setup?hash=eFTFDFWemp$WIaJJ$ABJs60aXMxEnGLa.', NULL, NULL, '2023-12-14 05:15:27', NULL, NULL),
(21, 'G-2a77194e5b15', 1, 'history', 'success', 'Updated traffic successfully.  /setup?hash=eFTFDFWemp$WIaJJ$ABJs60aXMxEnGLa.', NULL, NULL, '2023-12-14 05:16:10', NULL, NULL),
(22, 'G-168ee7c5a856', 1, 'history', 'success', 'Updated traffic successfully.  /setup?hash=eFTFDFWemp$WIaJJ$ABJs60aXMxEnGLa.', NULL, NULL, '2023-12-14 05:16:45', NULL, NULL),
(23, 'G-6bffc133b654', 1, 'history', 'success', 'Updated traffic successfully.  /setup?hash=eFTFDFWemp$WIaJJ$ABJs60aXMxEnGLa.', NULL, NULL, '2023-12-14 05:17:07', NULL, NULL),
(24, 'G-52f66c531b9f', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-14 05:19:45', NULL, NULL),
(25, 'G-0eb3bb61e19c', 1, 'history', 'success', 'Updated traffic successfully.  /setup?hash=eFTFDFWemp$WIaJJ$ABJs60aXMxEnGLa.', NULL, NULL, '2023-12-14 05:19:53', NULL, NULL),
(26, 'G-87da715a3024', 1, 'history', 'success', 'Updated traffic successfully.  /setup?hash=eFTFDFWemp$WIaJJ$ABJs60aXMxEnGLa.', NULL, NULL, '2023-12-14 05:20:25', NULL, NULL),
(27, 'G-834fc815acb5', 1, 'history', 'success', 'Updated traffic successfully.  /setup?hash=eFTFDFWemp$WIaJJ$ABJs60aXMxEnGLa.', NULL, NULL, '2023-12-14 05:20:42', NULL, NULL),
(28, 'G-8efb2fab82cd', 1, 'history', 'success', 'Updated traffic successfully.  /setup?hash=eFTFDFWemp$WIaJJ$ABJs60aXMxEnGLa.', NULL, NULL, '2023-12-14 05:22:53', NULL, NULL),
(29, 'G-fc95896d6723', 1, 'history', 'success', 'Updated traffic successfully.  /setup?hash=eFTFDFWemp$WIaJJ$ABJs60aXMxEnGLa.', NULL, NULL, '2023-12-14 05:28:45', NULL, NULL),
(30, 'G-d8a5bf59a26c', 1, 'history', 'success', 'Updated traffic successfully.  /setup?hash=eFTFDFWemp$WIaJJ$ABJs60aXMxEnGLa.', NULL, NULL, '2023-12-14 05:29:01', NULL, NULL),
(31, 'G-940da884ba7f', 1, 'history', 'success', 'Updated traffic successfully.  /setup?hash=eFTFDFWemp$WIaJJ$ABJs60aXMxEnGLa.', NULL, NULL, '2023-12-14 05:30:38', NULL, NULL),
(32, 'G-c3a909347ed7', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/traffic.', NULL, NULL, '2023-12-14 06:18:15', NULL, NULL),
(33, 'G-c5f6c1b8e296', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-14 15:11:28', NULL, NULL),
(34, 'G-13b1d4088b8f', 1, 'history', 'success', 'New traffic created successfully.T-772082002106.', NULL, NULL, '2023-12-14 15:11:33', NULL, NULL),
(35, 'G-9fe046407832', 1, 'history', 'success', 'New projects created successfully.A-a226ffebf256.', NULL, NULL, '2023-12-14 15:11:45', NULL, NULL),
(36, 'G-14924dc28741', 1, 'history', 'success', 'New projectcategories created successfully.C-7122f162013e.', NULL, NULL, '2023-12-14 15:11:45', NULL, NULL),
(37, 'G-ad7db3056158', 1, 'history', 'success', 'New projecttags created successfully.T-6318ebd67d0a.', NULL, NULL, '2023-12-14 15:11:45', NULL, NULL),
(38, 'G-f2ca7c14077f', 1, 'history', 'success', 'New projecttags created successfully.T-9db0b51a1b92.', NULL, NULL, '2023-12-14 15:11:45', NULL, NULL),
(39, 'G-f25222e14ad6', 1, 'history', 'success', 'New projectmeta created successfully.M-14e34be23c6f.', NULL, NULL, '2023-12-14 15:11:45', NULL, NULL),
(40, 'G-0c98d37c5881', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-14 15:11:45', NULL, NULL),
(41, 'G-3fe913698a05', 1, 'history', 'success', 'New notifications created successfully.N-2daa701d2f27.', NULL, NULL, '2023-12-14 15:11:45', NULL, NULL),
(42, 'G-a6970b5438b8', 1, 'history', 'success', 'Updated projects successfully.  A-a226ffebf256.', NULL, NULL, '2023-12-14 15:11:46', NULL, NULL),
(43, 'G-8bcd97f59734', 1, 'history', 'success', 'Updated projectcategories successfully.  1.', NULL, NULL, '2023-12-14 15:11:46', NULL, NULL),
(44, 'G-764b46d3284c', 1, 'history', 'success', 'Updated projectmeta successfully.  1.', NULL, NULL, '2023-12-14 15:11:46', NULL, NULL),
(45, 'G-753a230fdb6b', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-14 15:11:46', NULL, NULL),
(46, 'G-7a708e4a0689', 1, 'history', 'success', 'Updated projects successfully.  A-a226ffebf256.', NULL, NULL, '2023-12-14 15:11:48', NULL, NULL),
(47, 'G-f44eebffacb7', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-14 15:11:48', NULL, NULL),
(48, 'G-b7b27dd3f2d8', 1, 'history', 'success', 'File A-a226ffebf256 has been deleted successfully.', NULL, NULL, '2023-12-14 15:11:50', NULL, NULL),
(49, 'G-60fefc7a7016', 1, 'history', 'success', 'File A-a226ffebf256 has been deleted successfully.', NULL, NULL, '2023-12-14 15:11:50', NULL, NULL),
(50, 'G-d2c8ef23c066', 1, 'history', 'success', 'New traffic created successfully.T-99fd17ac193d.', NULL, NULL, '2023-12-14 15:11:51', NULL, NULL),
(51, 'G-016489d3138b', 1, 'history', 'success', 'New traffic created successfully.T-cf356b8f1275.', NULL, NULL, '2023-12-14 15:12:02', NULL, NULL),
(52, 'G-2e0fb6cec89d', 1, 'history', 'success', 'New traffic created successfully.T-10827a4c3d4a.', NULL, NULL, '2023-12-14 15:12:16', NULL, NULL),
(53, 'G-f264b81ccae8', 1, 'history', 'success', 'New traffic created successfully.T-27ba6e8228cc.', NULL, NULL, '2023-12-14 15:12:20', NULL, NULL),
(54, 'G-6b5c5c276f2a', 1, 'history', 'success', 'New traffic created successfully.T-19f4a6b654f2.', NULL, NULL, '2023-12-14 15:12:22', NULL, NULL),
(55, 'G-e02e1ca4c8dc', 1, 'history', 'success', 'New traffic created successfully.T-20368953242e.', NULL, NULL, '2023-12-14 15:12:24', NULL, NULL),
(56, 'G-64e91dcb4d9e', 1, 'history', 'success', 'Welcome, developer! You are now logged in.', NULL, NULL, '2023-12-22 02:41:12', NULL, NULL),
(57, 'G-bac8fa72f5f1', 1, 'history', 'success', 'New visitors created successfully.V-edce4d67a9eb.', NULL, NULL, '2023-12-22 02:41:12', NULL, NULL),
(58, 'G-eed5fe393f92', 1, 'history', 'success', 'New traffic created successfully.T-867e0b30fbad.', NULL, NULL, '2023-12-22 02:41:12', NULL, NULL),
(59, 'G-30c5dd677dcd', 1, 'history', 'success', 'Updated traffic successfully.  /profile.', NULL, NULL, '2023-12-22 02:41:18', NULL, NULL),
(60, 'G-e620142ff2a8', 1, 'history', 'success', 'New traffic created successfully.T-7d0cce0fe204.', NULL, NULL, '2023-12-22 02:42:06', NULL, NULL),
(61, 'G-1567c9113c87', 1, 'history', 'success', 'New traffic created successfully.T-94885611e796.', NULL, NULL, '2023-12-22 02:42:08', NULL, NULL),
(62, 'G-f0191585544f', 1, 'history', 'success', 'New projects created successfully.A-28f81469ba3c.', NULL, NULL, '2023-12-22 02:42:17', NULL, NULL),
(63, 'G-7d249a1cc370', 1, 'history', 'success', 'New projectcategories created successfully.C-33bd2c8a97fa.', NULL, NULL, '2023-12-22 02:42:17', NULL, NULL),
(64, 'G-933c5b38f721', 1, 'history', 'success', 'New projecttags created successfully.T-ac8ee6286066.', NULL, NULL, '2023-12-22 02:42:17', NULL, NULL),
(65, 'G-ad7228210916', 1, 'history', 'success', 'New projectmeta created successfully.M-3d2aec6c11ac.', NULL, NULL, '2023-12-22 02:42:17', NULL, NULL),
(66, 'G-1051787c673b', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-22 02:42:17', NULL, NULL),
(67, 'G-5ca335697fb4', 1, 'history', 'success', 'New notifications created successfully.N-ebc95cb565a9.', NULL, NULL, '2023-12-22 02:42:17', NULL, NULL),
(68, 'G-731bc1279045', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-22 02:42:29', NULL, NULL),
(69, 'G-74d14ae6f4c3', 1, 'history', 'success', 'New traffic created successfully.T-33a25cd0f2c9.', NULL, NULL, '2023-12-22 02:42:32', NULL, NULL),
(70, 'G-ded7411f91a9', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-22 02:42:36', NULL, NULL),
(71, 'G-5d0370167ab4', 1, 'history', 'success', 'Updated traffic successfully.  /project/editor.', NULL, NULL, '2023-12-22 02:42:38', NULL, NULL),
(72, 'G-5ea89748b02d', 5, 'history', 'success', 'Welcome, admin! You are now logged in.', NULL, NULL, '2023-12-22 02:42:52', NULL, NULL),
(73, 'L-8cf1816621d8', 5, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'group_id \'=\'  AND `permissions` . `action` LIKE \'%dashboard%\'  AND `permissions`\' at line 1', 'x3TOpGyxVbrd3A', '500', '2023-12-22 02:42:52', NULL, NULL),
(74, 'G-4f941ee86ddc', 5, 'history', 'success', 'New traffic created successfully.T-d1472d7a899d.', NULL, NULL, '2023-12-22 02:42:52', NULL, NULL),
(75, 'L-bc00efa81976', 5, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'group_id \'=\'  AND `permissions` . `action` LIKE \'%dashboard%\'  AND `permissions`\' at line 1', 'x3TOpGyxVbrd3A', '500', '2023-12-22 02:42:54', NULL, NULL),
(76, 'G-05123999b092', 5, 'history', 'success', 'New traffic created successfully.T-1a02aca9f049.', NULL, NULL, '2023-12-22 02:42:54', NULL, NULL),
(77, 'L-81bb5bff2e32', 5, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'group_id \'=\'  AND `permissions` . `action` LIKE \'%update%\'  AND `permissions`.`d\' at line 1', 'x3TOpGyxVbrd3A', '500', '2023-12-22 02:42:56', NULL, NULL),
(78, 'L-34e132cd75e2', 5, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'group_id \'=\'  AND `permissions` . `action` LIKE \'%dashboard%\'  AND `permissions`\' at line 1', 'x3TOpGyxVbrd3A', '500', '2023-12-22 02:42:57', NULL, NULL),
(79, 'G-a71c723ddbeb', 5, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-22 02:42:57', NULL, NULL),
(80, 'G-f7ac79418552', 1, 'history', 'success', 'New projects created successfully.A-dbbf684b22fd.', NULL, NULL, '2023-12-22 02:43:16', NULL, NULL),
(81, 'G-50047cf35c84', 1, 'history', 'success', 'New projectcategories created successfully.C-e3d3e112b79d.', NULL, NULL, '2023-12-22 02:43:16', NULL, NULL),
(82, 'G-c427a8495591', 1, 'history', 'success', 'New projecttags created successfully.T-f1e9a00a5bd3.', NULL, NULL, '2023-12-22 02:43:16', NULL, NULL),
(83, 'G-bf6cf3dd9780', 1, 'history', 'success', 'New projectmeta created successfully.M-8757def7266b.', NULL, NULL, '2023-12-22 02:43:16', NULL, NULL),
(84, 'G-092fd22676dc', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-22 02:43:16', NULL, NULL),
(85, 'G-98c85a9ef346', 1, 'history', 'success', 'New notifications created successfully.N-94801dfc3b45.', NULL, NULL, '2023-12-22 02:43:16', NULL, NULL),
(86, 'G-a03b03db3ed4', 1, 'history', 'success', 'New projects created successfully.A-168cc11c9246.', NULL, NULL, '2023-12-22 02:45:12', NULL, NULL),
(87, 'G-eb7db22aa0cb', 1, 'history', 'success', 'New projectcategories created successfully.C-ed1d2f360f9b.', NULL, NULL, '2023-12-22 02:45:12', NULL, NULL),
(88, 'G-d7b9b16ddaef', 1, 'history', 'success', 'New projectmeta created successfully.M-2dec7328ed36.', NULL, NULL, '2023-12-22 02:45:12', NULL, NULL),
(89, 'G-8b875a461bc7', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-22 02:45:12', NULL, NULL),
(90, 'G-f93e95fb5072', 1, 'history', 'success', 'New notifications created successfully.N-a37bd13e3990.', NULL, NULL, '2023-12-22 02:45:12', NULL, NULL),
(91, 'G-95711d882451', 1, 'history', 'success', 'New projects created successfully.A-eba03cc8213e.', NULL, NULL, '2023-12-22 02:46:47', NULL, NULL),
(92, 'G-2f9f9de6a576', 1, 'history', 'success', 'New projectcategories created successfully.C-24b134ec2578.', NULL, NULL, '2023-12-22 02:46:47', NULL, NULL),
(93, 'G-18119ad5ebcb', 1, 'history', 'success', 'New projectmeta created successfully.M-a12948916340.', NULL, NULL, '2023-12-22 02:46:47', NULL, NULL),
(94, 'G-70a958bc32f0', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-22 02:46:47', NULL, NULL),
(95, 'G-981727923786', 1, 'history', 'success', 'New notifications created successfully.N-2a4c1fbc8202.', NULL, NULL, '2023-12-22 02:46:47', NULL, NULL),
(96, 'G-32226c1db603', 1, 'history', 'success', 'Updated traffic successfully.  /project/editor.', NULL, NULL, '2023-12-22 02:47:51', NULL, NULL),
(97, 'G-68972c171540', 1, 'history', 'success', 'New projects created successfully.A-75cc395b5f62.', NULL, NULL, '2023-12-22 02:47:58', NULL, NULL),
(98, 'G-3c49b00e5eda', 1, 'history', 'success', 'New projectcategories created successfully.C-b3e2d6054949.', NULL, NULL, '2023-12-22 02:47:59', NULL, NULL),
(99, 'G-e7c4c2f5460a', 1, 'history', 'success', 'New projectmeta created successfully.M-91fe8d35254b.', NULL, NULL, '2023-12-22 02:47:59', NULL, NULL),
(100, 'G-7b5e686dfe7e', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-22 02:47:59', NULL, NULL),
(101, 'G-bfb9b7010917', 1, 'history', 'success', 'New notifications created successfully.N-d66ead75fdfe.', NULL, NULL, '2023-12-22 02:47:59', NULL, NULL),
(102, 'G-ac773097f173', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-22 02:47:59', NULL, NULL),
(103, 'G-0567b36bde4a', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-22 02:51:50', NULL, NULL),
(104, 'G-d949ba68aeaf', 1, 'history', 'success', 'New traffic created successfully.T-57cfb2cbc39c.', NULL, NULL, '2023-12-22 02:51:54', NULL, NULL),
(105, 'L-82c7800dd750', 5, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'group_id \'=\'  AND `permissions` . `action` LIKE \'%dashboard%\'  AND `permissions`\' at line 1', 'x3TOpGyxVbrd3A', '500', '2023-12-22 03:06:04', NULL, NULL),
(106, 'G-c6a2c6217e16', 5, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-22 03:06:04', NULL, NULL),
(107, 'G-568d72500d98', 5, 'history', 'success', 'New traffic created successfully.T-ba7a1cab6cf3.', NULL, NULL, '2023-12-22 03:06:08', NULL, NULL),
(108, 'L-89c72df9d312', 5, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'group_id \'=\'  AND `permissions` . `action` LIKE \'%dashboard%\'  AND `permissions`\' at line 1', 'x3TOpGyxVbrd3A', '500', '2023-12-22 03:06:10', NULL, NULL),
(109, 'G-389b8774b239', 5, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-22 03:06:10', NULL, NULL),
(110, 'L-a311d2533ee5', 5, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'group_id \'=\'  AND `permissions` . `action` LIKE \'%dashboard%\'  AND `permissions`\' at line 1', 'x3TOpGyxVbrd3A', '500', '2023-12-22 03:06:15', NULL, NULL),
(111, 'G-2c8aca567c01', 5, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-22 03:06:15', NULL, NULL),
(112, 'L-1017eda796ea', 5, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'group_id \'=\'  AND `permissions` . `action` LIKE \'%switch%\'  AND `permissions`.`d\' at line 1', 'x3TOpGyxVbrd3A', '500', '2023-12-22 03:06:24', NULL, NULL),
(113, 'L-78e9c5b70ed1', 5, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'group_id \'=\'  AND `permissions` . `action` LIKE \'%dashboard%\'  AND `permissions`\' at line 1', 'x3TOpGyxVbrd3A', '500', '2023-12-22 03:06:25', NULL, NULL),
(114, 'G-91130dbc32e0', 5, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-22 03:06:25', NULL, NULL),
(115, 'L-07da8d0bfede', 5, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'group_id \'=\'  AND `permissions` . `action` LIKE \'%switch%\'  AND `permissions`.`d\' at line 1', 'x3TOpGyxVbrd3A', '500', '2023-12-22 03:06:36', NULL, NULL),
(116, 'L-0e24181629e1', 5, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'group_id \'=\'  AND `permissions` . `action` LIKE \'%dashboard%\'  AND `permissions`\' at line 1', 'x3TOpGyxVbrd3A', '500', '2023-12-22 03:06:37', NULL, NULL),
(117, 'G-8b661e0efe68', 5, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-22 03:06:37', NULL, NULL),
(118, 'L-3d9c2af729c5', 5, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'group_id \'=\'  AND `permissions` . `action` LIKE \'%dashboard%\'  AND `permissions`\' at line 1', 'x3TOpGyxVbrd3A', '500', '2023-12-22 03:07:15', NULL, NULL),
(119, 'G-b6fdd504d0ad', 5, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-22 03:07:15', NULL, NULL),
(120, 'L-4c492b493c6b', 5, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'group_id \'=\'  AND `permissions` . `action` LIKE \'%switch%\'  AND `permissions`.`d\' at line 1', 'x3TOpGyxVbrd3A', '500', '2023-12-22 03:07:18', NULL, NULL),
(121, 'L-1cbb420d1511', 5, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'group_id \'=\'  AND `permissions` . `action` LIKE \'%dashboard%\'  AND `permissions`\' at line 1', 'x3TOpGyxVbrd3A', '500', '2023-12-22 03:07:19', NULL, NULL),
(122, 'G-602f56c86adf', 5, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-22 03:07:19', NULL, NULL),
(123, 'L-3a852d13bde4', 5, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'group_id \'=\'  AND `permissions` . `action` LIKE \'%dashboard%\'  AND `permissions`\' at line 1', 'x3TOpGyxVbrd3A', '500', '2023-12-22 03:07:23', NULL, NULL),
(124, 'G-3dc1602506ef', 5, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-22 03:07:23', NULL, NULL),
(125, 'G-5abd5e4bae98', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-22 03:07:31', NULL, NULL),
(126, 'G-3e7cfbe3382e', 1, 'history', 'success', 'Updated projects successfully.  A-eba03cc8213e.', NULL, NULL, '2023-12-22 03:07:35', NULL, NULL),
(127, 'G-5f5111b41e07', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-22 03:07:35', NULL, NULL),
(128, 'G-c5598c12c1f7', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-22 03:07:38', NULL, NULL),
(129, 'G-754db2450282', 1, 'history', 'success', 'New traffic created successfully.T-b1b0ce9c67e7.', NULL, NULL, '2023-12-22 03:07:58', NULL, NULL),
(130, 'G-d5f7a188933a', 1, 'history', 'success', 'New traffic created successfully.T-9e4c4c77538f.', NULL, NULL, '2023-12-22 03:08:05', NULL, NULL),
(131, 'G-bf22ba0c65c9', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mails.', NULL, NULL, '2023-12-22 03:08:34', NULL, NULL),
(132, 'G-36ef6a1afac1', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mailbox.', NULL, NULL, '2023-12-22 03:08:36', NULL, NULL),
(133, 'G-0cb66608f644', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mailbox.', NULL, NULL, '2023-12-22 03:17:07', NULL, NULL),
(134, 'G-4905befddbad', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mailbox.', NULL, NULL, '2023-12-22 03:17:10', NULL, NULL),
(135, 'G-f591b1f825e7', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mails.', NULL, NULL, '2023-12-22 03:17:12', NULL, NULL),
(136, 'G-ad1a9ba45424', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mailbox.', NULL, NULL, '2023-12-22 03:17:17', NULL, NULL),
(137, 'G-92672e201cb1', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mailbox.', NULL, NULL, '2023-12-22 03:19:03', NULL, NULL),
(138, 'G-d9f52ca5cdc3', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mailbox.', NULL, NULL, '2023-12-22 03:19:05', NULL, NULL),
(139, 'G-60be96212398', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mails.', NULL, NULL, '2023-12-22 03:19:08', NULL, NULL),
(140, 'G-24df99d87568', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mailbox.', NULL, NULL, '2023-12-22 03:19:16', NULL, NULL),
(141, 'G-e8b69161a4dd', 1, 'history', 'success', 'New traffic created successfully.T-9327a581eebe.', NULL, NULL, '2023-12-22 03:19:36', NULL, NULL),
(142, 'G-e740af6b8840', 1, 'history', 'success', 'New traffic created successfully.T-a517ac880370.', NULL, NULL, '2023-12-22 03:19:42', NULL, NULL),
(143, 'G-1df40d7f2e18', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-22 03:19:56', NULL, NULL),
(144, 'G-f82f1f5354e2', 1, 'history', 'success', 'New traffic created successfully.T-603d80647ddd.', NULL, NULL, '2023-12-22 03:19:57', NULL, NULL),
(145, 'G-c48a66e682e1', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/permission.', NULL, NULL, '2023-12-22 03:19:58', NULL, NULL),
(146, 'G-1d743ece1981', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/offers.', NULL, NULL, '2023-12-22 03:19:59', NULL, NULL),
(147, 'L-a606d9d688cc', 5, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'group_id \'=\'  AND `permissions` . `action` LIKE \'%dashboard%\'  AND `permissions`\' at line 1', 'x3TOpGyxVbrd3A', '500', '2023-12-22 03:20:07', NULL, NULL),
(148, 'L-96754342222d', 5, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'group_id \'=\'  AND `permissions` . `action` LIKE \'%dashboard%\'  AND `permissions`\' at line 1', 'x3TOpGyxVbrd3A', '500', '2023-12-22 03:20:07', NULL, NULL),
(149, 'G-bac519586c98', 5, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-22 03:20:08', NULL, NULL),
(150, 'G-f0fd204c7c15', 5, 'history', 'success', 'New traffic created successfully.T-32d77d67a073.', NULL, NULL, '2023-12-22 03:20:10', NULL, NULL),
(151, 'G-e8e13e94b530', 5, 'history', 'success', 'New offers created successfully.O-ef090225c5de.', NULL, NULL, '2023-12-22 03:20:25', NULL, NULL),
(152, 'G-09c0a50c3fdc', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/offers.', NULL, NULL, '2023-12-22 03:20:29', NULL, NULL),
(153, 'G-559db0b4440e', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mailbox.', NULL, NULL, '2023-12-22 03:20:37', NULL, NULL),
(154, 'G-73d29d41a9d1', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mails.', NULL, NULL, '2023-12-22 03:20:42', NULL, NULL),
(155, 'L-211a12d92416', 5, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'group_id \'=\'  AND `permissions` . `action` LIKE \'%dashboard%\'  AND `permissions`\' at line 1', 'x3TOpGyxVbrd3A', '500', '2023-12-22 03:28:49', NULL, NULL),
(156, 'G-6714d3f34485', 5, 'history', 'success', 'Updated traffic successfully.  /.', NULL, NULL, '2023-12-22 03:28:50', NULL, NULL),
(157, 'L-a0a84920113f', 5, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'group_id \'=\'  AND `permissions` . `action` LIKE \'%dashboard%\'  AND `permissions`\' at line 1', 'x3TOpGyxVbrd3A', '500', '2023-12-22 03:28:52', NULL, NULL),
(158, 'G-5f826a7b9370', 5, 'history', 'success', 'Updated traffic successfully.  /.', NULL, NULL, '2023-12-22 03:28:53', NULL, NULL),
(159, 'G-7f3cf608b034', 5, 'history', 'success', 'You have been successfully logged out. Thank you for using our service', NULL, NULL, '2023-12-22 03:29:00', NULL, NULL),
(160, 'G-5e06b0e09e87', 1, 'history', 'success', 'Welcome, developer! You are now logged in.', NULL, NULL, '2023-12-22 23:14:22', NULL, NULL),
(161, 'G-e8615e8f8b4d', 1, 'history', 'success', 'Updated traffic successfully.  /profile.', NULL, NULL, '2023-12-22 23:14:23', NULL, NULL),
(162, 'G-0a2c03afff0e', 1, 'history', 'success', 'New traffic created successfully.T-e41035f204ce.', NULL, NULL, '2023-12-22 23:14:28', NULL, NULL),
(163, 'G-f12e2c3ee134', 1, 'history', 'success', 'New traffic created successfully.T-4b599ef4f6e4.', NULL, NULL, '2023-12-22 23:14:33', NULL, NULL),
(164, 'G-67cd38889438', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mailbox.', NULL, NULL, '2023-12-22 23:19:17', NULL, NULL),
(165, 'G-27be676b17e5', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mailbox.', NULL, NULL, '2023-12-22 23:19:22', NULL, NULL),
(166, 'G-b54ff7bbf6f8', 1, 'history', 'success', 'New traffic created successfully.T-5431066c89f6.', NULL, NULL, '2023-12-22 23:19:25', NULL, NULL),
(167, 'G-3ef72740fdc6', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/history.', NULL, NULL, '2023-12-22 23:21:42', NULL, NULL),
(168, 'G-152fd394ed5f', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/history.', NULL, NULL, '2023-12-22 23:22:40', NULL, NULL),
(169, 'G-5910787477cb', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mailbox.', NULL, NULL, '2023-12-22 23:22:42', NULL, NULL),
(170, 'G-bb556867d4b6', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mailbox.', NULL, NULL, '2023-12-22 23:23:05', NULL, NULL),
(171, 'G-777b1824672c', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mailbox.', NULL, NULL, '2023-12-22 23:23:07', NULL, NULL),
(172, 'G-31c22ec48c51', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/history.', NULL, NULL, '2023-12-22 23:23:10', NULL, NULL),
(173, 'G-d6afdcf0bb95', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/history.', NULL, NULL, '2023-12-22 23:23:39', NULL, NULL),
(174, 'G-f0df42dd9f69', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/history.', NULL, NULL, '2023-12-22 23:23:44', NULL, NULL),
(175, 'G-fa3e82207dba', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/history.', NULL, NULL, '2023-12-22 23:24:22', NULL, NULL),
(176, 'G-9cdf5cdb4f07', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/history.', NULL, NULL, '2023-12-22 23:24:35', NULL, NULL),
(177, 'G-1f6c8def2afc', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/history.', NULL, NULL, '2023-12-22 23:25:07', NULL, NULL),
(178, 'G-52da50e4b4f1', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/history.', NULL, NULL, '2023-12-22 23:27:03', NULL, NULL),
(179, 'G-b9482e013579', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/history.', NULL, NULL, '2023-12-22 23:27:39', NULL, NULL),
(180, 'G-fb6dbb356ead', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/history.', NULL, NULL, '2023-12-22 23:28:12', NULL, NULL),
(181, 'G-2ba6c169ab03', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/history.', NULL, NULL, '2023-12-22 23:29:21', NULL, NULL),
(182, 'G-510ec0f04d69', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/history.', NULL, NULL, '2023-12-22 23:29:40', NULL, NULL),
(183, 'G-dfe6709e4da2', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/history.', NULL, NULL, '2023-12-22 23:31:06', NULL, NULL),
(184, 'G-52eaaccd3b61', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/history.', NULL, NULL, '2023-12-22 23:31:16', NULL, NULL),
(185, 'G-b78699ef6cac', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mailbox.', NULL, NULL, '2023-12-22 23:31:20', NULL, NULL),
(186, 'G-6955130c50fc', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mailbox.', NULL, NULL, '2023-12-22 23:32:58', NULL, NULL),
(187, 'G-d1c2b78a9d3a', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mailbox.', NULL, NULL, '2023-12-22 23:33:46', NULL, NULL),
(188, 'G-b114a013f911', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mailbox.', NULL, NULL, '2023-12-22 23:34:06', NULL, NULL),
(189, 'G-4968633bc49c', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mailbox.', NULL, NULL, '2023-12-22 23:34:20', NULL, NULL),
(190, 'G-3883db234192', 1, 'history', 'success', 'New traffic created successfully.T-a6c41d377774.', NULL, NULL, '2023-12-22 23:34:24', NULL, NULL),
(191, 'G-51782740775b', 1, 'history', 'success', 'New projects created successfully.A-d659ca6f17eb.', NULL, NULL, '2023-12-22 23:34:28', NULL, NULL),
(192, 'G-32e000c41338', 1, 'history', 'success', 'New projectcategories created successfully.C-8dbdd4640126.', NULL, NULL, '2023-12-22 23:34:28', NULL, NULL),
(193, 'G-eff4b1b147f7', 1, 'history', 'success', 'New projecttags created successfully.T-2d5cdd84ab0c.', NULL, NULL, '2023-12-22 23:34:28', NULL, NULL),
(194, 'G-3cec693fd7ba', 1, 'history', 'success', 'New projecttags created successfully.T-e79f6a3ff10a.', NULL, NULL, '2023-12-22 23:34:28', NULL, NULL),
(195, 'G-afe217768dce', 1, 'history', 'success', 'New projectmeta created successfully.M-1afab6f9e856.', NULL, NULL, '2023-12-22 23:34:28', NULL, NULL),
(196, 'G-0bd5dab1e230', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-22 23:34:29', NULL, NULL),
(197, 'G-f879f906f8b1', 1, 'history', 'success', 'New notifications created successfully.N-3444f2c9c26b.', NULL, NULL, '2023-12-22 23:34:29', NULL, NULL),
(198, 'G-d870266af68c', 1, 'history', 'success', 'New projects created successfully.A-5ed4ddd1a8f0.', NULL, NULL, '2023-12-22 23:34:30', NULL, NULL),
(199, 'G-b28bc06117e4', 1, 'history', 'success', 'New projectcategories created successfully.C-5d689eac05d4.', NULL, NULL, '2023-12-22 23:34:30', NULL, NULL),
(200, 'G-0858f05a4104', 1, 'history', 'success', 'New projecttags created successfully.T-df1680430ccb.', NULL, NULL, '2023-12-22 23:34:30', NULL, NULL),
(201, 'G-9c13d2507baf', 1, 'history', 'success', 'New projecttags created successfully.T-5d95d073b492.', NULL, NULL, '2023-12-22 23:34:30', NULL, NULL),
(202, 'G-0b8aad123619', 1, 'history', 'success', 'New projectmeta created successfully.M-3f3259f91044.', NULL, NULL, '2023-12-22 23:34:30', NULL, NULL),
(203, 'G-83ae2d975e89', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-22 23:34:30', NULL, NULL),
(204, 'G-79f9d9f0162b', 1, 'history', 'success', 'New notifications created successfully.N-3776ee1ac638.', NULL, NULL, '2023-12-22 23:34:31', NULL, NULL),
(205, 'G-ced41c502716', 1, 'history', 'success', 'Updated projects successfully.  A-d659ca6f17eb.', NULL, NULL, '2023-12-22 23:34:32', NULL, NULL),
(206, 'G-fe889c21cd57', 1, 'history', 'success', 'Updated projectcategories successfully.  6.', NULL, NULL, '2023-12-22 23:34:33', NULL, NULL),
(207, 'G-80cf2959d9d5', 1, 'history', 'success', 'Updated projectmeta successfully.  6.', NULL, NULL, '2023-12-22 23:34:33', NULL, NULL),
(208, 'G-983eeefc02ac', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-22 23:34:33', NULL, NULL),
(209, 'G-5da7f408d4d5', 1, 'history', 'success', 'Updated projects successfully.  A-d659ca6f17eb.', NULL, NULL, '2023-12-22 23:34:35', NULL, NULL),
(210, 'G-67e6b5cc7c06', 1, 'history', 'success', 'Updated projectcategories successfully.  6.', NULL, NULL, '2023-12-22 23:34:35', NULL, NULL),
(211, 'G-5b416620ffc2', 1, 'history', 'success', 'Updated projectmeta successfully.  6.', NULL, NULL, '2023-12-22 23:34:35', NULL, NULL),
(212, 'G-7d6016018bda', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-22 23:34:35', NULL, NULL),
(213, 'G-9a4fd42377f3', 1, 'history', 'success', 'Updated projects successfully.  A-d659ca6f17eb.', NULL, NULL, '2023-12-22 23:34:37', NULL, NULL),
(214, 'G-de1d69e7b859', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-22 23:34:37', NULL, NULL),
(215, 'G-154768ea5cb3', 1, 'history', 'fails', 'An error occurred the projects. Please review the data provided and try again.', NULL, NULL, '2023-12-22 23:34:38', NULL, NULL),
(216, 'G-cb372a71b15c', 1, 'history', 'fails', 'Some wourn whan update A-d659ca6f17ebx!', NULL, NULL, '2023-12-22 23:34:38', NULL, NULL),
(217, 'L-a696b1939a00', 1, 'log', 'fails', 'Some wourn whan update A-d659ca6f17ebx!', 's7f6sa7f6', '500', '2023-12-22 23:34:38', NULL, NULL),
(218, 'G-c7411554220c', 1, 'history', 'fails', 'Oops, we\'ve encountered a server error while updating the item. Our team has been alerted and is actively addressing the issue. Please try your update again later.', NULL, NULL, '2023-12-22 23:34:39', NULL, NULL),
(219, 'L-7d9dd3e38558', 1, 'log', 'fails', 'Error: SQLSTATE[HY093]: Invalid parameter number: number of bound variables does not match number of tokens', 'FTgWffZOchTgZp', '500', '2023-12-22 23:34:40', NULL, NULL),
(220, 'G-e85e18acb997', 1, 'history', 'fails', 'An error occurred the projects. Please review the data provided and try again.', NULL, NULL, '2023-12-22 23:34:40', NULL, NULL),
(221, 'G-ba1d7fcbbdb3', 1, 'history', 'fails', 'Some wourn whan update A-d659ca6f17eb!', NULL, NULL, '2023-12-22 23:34:40', NULL, NULL),
(222, 'L-a2cb40bdad71', 1, 'log', 'fails', 'Some wourn whan update A-d659ca6f17eb!', 's7f6sa7f6', '500', '2023-12-22 23:34:40', NULL, NULL),
(223, 'G-ace19ea0722b', 1, 'history', 'success', 'File A-d659ca6f17eb has been deleted successfully.', NULL, NULL, '2023-12-22 23:34:40', NULL, NULL),
(224, 'G-b3ef4604329f', 1, 'history', 'success', 'File A-d659ca6f17eb has been deleted successfully.', NULL, NULL, '2023-12-22 23:34:42', NULL, NULL),
(225, 'G-7257ca98bd0c', 1, 'history', 'success', 'New traffic created successfully.T-c0ff32cccbef.', NULL, NULL, '2023-12-22 23:34:43', NULL, NULL),
(226, 'G-43169ef0cef7', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/unittest.', NULL, NULL, '2023-12-22 23:37:08', NULL, NULL),
(227, 'G-6c4f1c0e5b78', 1, 'history', 'success', 'New projects created successfully.A-6a934d222792.', NULL, NULL, '2023-12-22 23:37:12', NULL, NULL),
(228, 'G-572c074a11a0', 1, 'history', 'success', 'New projectcategories created successfully.C-86446956d29c.', NULL, NULL, '2023-12-22 23:37:12', NULL, NULL),
(229, 'G-81b3bcf18341', 1, 'history', 'success', 'New projecttags created successfully.T-23f0cc8588bc.', NULL, NULL, '2023-12-22 23:37:12', NULL, NULL),
(230, 'G-4655e713f47b', 1, 'history', 'success', 'New projecttags created successfully.T-b3ce61b00769.', NULL, NULL, '2023-12-22 23:37:12', NULL, NULL),
(231, 'G-f7727bdd36c8', 1, 'history', 'success', 'New projectmeta created successfully.M-918d5011c34b.', NULL, NULL, '2023-12-22 23:37:12', NULL, NULL),
(232, 'G-ab02f4edce3e', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-22 23:37:12', NULL, NULL),
(233, 'G-64afc7a5d185', 1, 'history', 'success', 'New notifications created successfully.N-f7f009445c30.', NULL, NULL, '2023-12-22 23:37:12', NULL, NULL),
(234, 'G-ba8c55ca0bee', 1, 'history', 'success', 'Updated projects successfully.  A-6a934d222792.', NULL, NULL, '2023-12-22 23:37:16', NULL, NULL),
(235, 'G-6db56a0f49b5', 1, 'history', 'success', 'Updated projectcategories successfully.  8.', NULL, NULL, '2023-12-22 23:37:16', NULL, NULL),
(236, 'G-1c023a5622a8', 1, 'history', 'success', 'Updated projectmeta successfully.  8.', NULL, NULL, '2023-12-22 23:37:16', NULL, NULL),
(237, 'G-58f8695d0e5b', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-22 23:37:16', NULL, NULL),
(238, 'G-62228d2c4dd2', 1, 'history', 'success', 'Updated projects successfully.  A-6a934d222792.', NULL, NULL, '2023-12-22 23:37:20', NULL, NULL),
(239, 'G-69c7f27bda02', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-22 23:37:20', NULL, NULL),
(240, 'G-ef892b95674d', 1, 'history', 'success', 'File A-6a934d222792 has been deleted successfully.', NULL, NULL, '2023-12-22 23:37:24', NULL, NULL),
(241, 'G-53fdd10830e2', 1, 'history', 'success', 'File A-6a934d222792 has been deleted successfully.', NULL, NULL, '2023-12-22 23:37:25', NULL, NULL),
(242, 'G-eb27fc50931b', 1, 'history', 'success', 'Updated traffic successfully.  /unit/project/checkups.', NULL, NULL, '2023-12-22 23:37:26', NULL, NULL),
(243, 'G-fe7656a80b62', 1, 'history', 'success', 'New projects created successfully.A-e2c0d210dd1d.', NULL, NULL, '2023-12-22 23:37:28', NULL, NULL),
(244, 'G-847924eae349', 1, 'history', 'success', 'New projectcategories created successfully.C-1c2391a9a4db.', NULL, NULL, '2023-12-22 23:37:28', NULL, NULL),
(245, 'G-ecca17c74988', 1, 'history', 'success', 'New projecttags created successfully.T-671dcec1caf1.', NULL, NULL, '2023-12-22 23:37:28', NULL, NULL),
(246, 'G-2cf0c37bc795', 1, 'history', 'success', 'New projecttags created successfully.T-c6903f5c893f.', NULL, NULL, '2023-12-22 23:37:28', NULL, NULL),
(247, 'G-489083bbbe89', 1, 'history', 'success', 'New projectmeta created successfully.M-20ba740361dc.', NULL, NULL, '2023-12-22 23:37:28', NULL, NULL),
(248, 'G-51168805fe12', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-22 23:37:28', NULL, NULL),
(249, 'G-45df9a0d4a2c', 1, 'history', 'success', 'New notifications created successfully.N-d7e503de0710.', NULL, NULL, '2023-12-22 23:37:28', NULL, NULL),
(250, 'G-f496baa34146', 1, 'history', 'success', 'Updated projects successfully.  A-e2c0d210dd1d.', NULL, NULL, '2023-12-22 23:37:30', NULL, NULL),
(251, 'G-1f08ea5011f8', 1, 'history', 'success', 'Updated projectcategories successfully.  9.', NULL, NULL, '2023-12-22 23:37:30', NULL, NULL),
(252, 'G-0bb178904471', 1, 'history', 'success', 'Updated projectmeta successfully.  9.', NULL, NULL, '2023-12-22 23:37:30', NULL, NULL),
(253, 'G-67006b63245c', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-22 23:37:30', NULL, NULL),
(254, 'G-a387aa78e9b1', 1, 'history', 'success', 'Updated projects successfully.  A-e2c0d210dd1d.', NULL, NULL, '2023-12-22 23:37:34', NULL, NULL),
(255, 'G-09d76f39bb3c', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-22 23:37:34', NULL, NULL),
(256, 'G-c027dbc76237', 1, 'history', 'success', 'File A-e2c0d210dd1d has been deleted successfully.', NULL, NULL, '2023-12-22 23:37:36', NULL, NULL),
(257, 'G-6d91eb527259', 1, 'history', 'success', 'File A-e2c0d210dd1d has been deleted successfully.', NULL, NULL, '2023-12-22 23:37:37', NULL, NULL),
(258, 'G-b759696e3e41', 1, 'history', 'success', 'Updated traffic successfully.  /unit/project/checkups.', NULL, NULL, '2023-12-22 23:37:38', NULL, NULL),
(259, 'G-968f2a6c5af4', 1, 'history', 'success', 'New traffic created successfully.T-7ee4ee958076.', NULL, NULL, '2023-12-22 23:40:33', NULL, NULL),
(260, 'G-0eb3362ed030', 1, 'history', 'success', 'Updated traffic successfully.  /home.', NULL, NULL, '2023-12-22 23:41:13', NULL, NULL),
(261, 'G-d908061d0c9c', 1, 'history', 'success', 'Updated traffic successfully.  /home.', NULL, NULL, '2023-12-22 23:43:18', NULL, NULL),
(262, 'G-7d3da33f9429', 1, 'history', 'success', 'Updated traffic successfully.  /home.', NULL, NULL, '2023-12-22 23:44:56', NULL, NULL),
(263, 'G-58eae8f94614', 1, 'history', 'success', 'New mailbox created successfully.E-83e11f9c4ef0.', NULL, NULL, '2023-12-22 23:48:17', NULL, NULL),
(264, 'G-4792a4a7fc18', 1, 'history', 'success', 'Updated traffic successfully.  /home.', NULL, NULL, '2023-12-22 23:48:20', NULL, NULL),
(265, 'G-323f66d70dfa', 1, 'history', 'success', 'New traffic created successfully.T-fc9769f24052.', NULL, NULL, '2023-12-22 23:48:24', NULL, NULL),
(266, 'G-f2dece975207', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mailbox.', NULL, NULL, '2023-12-22 23:49:18', NULL, NULL),
(267, 'G-2db33354c696', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-22 23:49:37', NULL, NULL),
(268, 'G-11b2b3075320', 1, 'history', 'success', 'Updated traffic successfully.  /home.', NULL, NULL, '2023-12-22 23:49:41', NULL, NULL),
(269, 'G-ec0d178129ae', 1, 'history', 'success', 'New mailbox created successfully.E-4a31e68f29bf.', NULL, NULL, '2023-12-22 23:50:00', NULL, NULL),
(270, 'G-e5dedff411e6', 1, 'history', 'success', 'Updated traffic successfully.  /home.', NULL, NULL, '2023-12-22 23:50:03', NULL, NULL),
(271, 'G-209e151629ca', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mailbox.', NULL, NULL, '2023-12-22 23:50:10', NULL, NULL),
(272, 'G-0e70ac8523f3', 1, 'history', 'success', 'New traffic created successfully.T-7840dea08be0.', NULL, NULL, '2023-12-22 23:50:19', NULL, NULL),
(273, 'G-cef20b3ec761', 1, 'history', 'success', 'New traffic created successfully.T-25146b7a776a.', NULL, NULL, '2023-12-22 23:50:24', NULL, NULL),
(274, 'G-fa3dfd69b7c5', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/mailbox.', NULL, NULL, '2023-12-22 23:51:37', NULL, NULL),
(275, 'G-9e36f54aa223', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/history.', NULL, NULL, '2023-12-22 23:51:39', NULL, NULL),
(276, 'G-050da705f3a3', 1, 'history', 'success', 'Updated traffic successfully.  /home.', NULL, NULL, '2023-12-23 00:11:06', NULL, NULL),
(277, 'G-7e56ff0dcb1d', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 00:11:08', NULL, NULL),
(278, 'G-b406569923ba', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 00:11:10', NULL, NULL),
(279, 'G-89727c1d8586', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 00:11:14', NULL, NULL),
(280, 'L-29549d73cab6', 1, 'log', 'fails', 'Sorry, the (/modules/history/models/model.php) requested module is not defined or does not exist. Please check the module name and try again', 'nrmpmqAUhTyrYj', '404', '2023-12-23 00:11:19', NULL, NULL),
(281, 'G-246ed0a3d93e', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 00:11:20', NULL, NULL),
(282, 'L-085d89174ccf', 1, 'log', 'fails', 'Sorry, the (/modules/history/models/model.php) requested module is not defined or does not exist. Please check the module name and try again', 'nrmpmqAUhTyrYj', '404', '2023-12-23 00:11:29', NULL, NULL),
(283, 'G-a565f0a0068c', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 00:11:30', NULL, NULL),
(284, 'L-3588cf6d2ee3', 1, 'log', 'fails', 'Sorry, the (/modules/history/models/model.php) requested module is not defined or does not exist. Please check the module name and try again', 'nrmpmqAUhTyrYj', '404', '2023-12-23 00:11:33', NULL, NULL),
(285, 'G-ad9d05038232', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 00:11:34', NULL, NULL),
(286, 'L-1ddd650def10', 1, 'log', 'fails', 'Sorry, the (/modules/history/models/model.php) requested module is not defined or does not exist. Please check the module name and try again', 'nrmpmqAUhTyrYj', '404', '2023-12-23 00:11:50', NULL, NULL),
(287, 'G-eec5b968fa2c', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 00:11:51', NULL, NULL),
(288, 'G-06e2b2554710', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 00:13:16', NULL, NULL),
(289, 'L-81381b3b8c3b', 1, 'log', 'fails', 'Sorry, the (/modules/history/models/model.php) requested module is not defined or does not exist. Please check the module name and try again', 'nrmpmqAUhTyrYj', '404', '2023-12-23 00:14:49', NULL, NULL),
(290, 'G-552cccf14e16', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 00:14:51', NULL, NULL),
(291, 'G-9f8473b9c02c', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 00:15:22', NULL, NULL),
(292, 'L-708a82941fe4', 1, 'log', 'fails', 'Sorry, the (/modules/emails/models/model.php) requested module is not defined or does not exist. Please check the module name and try again', 'nrmpmqAUhTyrYj', '404', '2023-12-23 00:15:26', NULL, NULL),
(293, 'G-3c4fca36df6e', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 00:15:28', NULL, NULL),
(294, 'G-3f5a7ded8714', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 00:32:39', NULL, NULL),
(295, 'G-5774596cc439', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 00:32:46', NULL, NULL),
(296, 'G-62af4dc6255e', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 00:33:29', NULL, NULL),
(297, 'G-7a94e2bec8ca', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 00:35:16', NULL, NULL),
(298, 'G-d36696c83363', 1, 'history', 'success', 'Great news! We\'ve just added a mailshistory new module to the app. Explore the exciting features and functionality it brings to enhance your experience.', NULL, NULL, '2023-12-23 00:35:20', NULL, NULL),
(299, 'L-866328033f02', 1, 'log', 'success', 'added mailshistory table', 'Aow3OtlEDqArEM', '200', '2023-12-23 00:35:20', NULL, NULL),
(300, 'G-65e953f56bd5', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 00:35:21', NULL, NULL);
INSERT INTO `records` (`uid`, `guide`, `owner`, `type`, `status`, `message`, `hash`, `code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(301, 'G-9744f6014604', 1, 'history', 'success', 'Great news! We\'ve just added a mailshistory new module to the app. Explore the exciting features and functionality it brings to enhance your experience.', NULL, NULL, '2023-12-23 00:37:28', NULL, NULL),
(302, 'L-5de43631dd21', 1, 'log', 'success', 'added mailshistory table', 'Aow3OtlEDqArEM', '200', '2023-12-23 00:37:28', NULL, NULL),
(303, 'G-691908f17ee7', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 00:37:29', NULL, NULL),
(304, 'G-5ee38dd0800f', 1, 'history', 'success', 'Great news! We\'ve just added a mailshistory new module to the app. Explore the exciting features and functionality it brings to enhance your experience.', NULL, NULL, '2023-12-23 00:39:22', NULL, NULL),
(305, 'L-9c5ff53a4f35', 1, 'log', 'success', 'added mailshistory table', 'Aow3OtlEDqArEM', '200', '2023-12-23 00:39:22', NULL, NULL),
(306, 'G-e090248fd97d', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 00:39:23', NULL, NULL),
(307, 'G-d55c290b5005', 1, 'history', 'success', 'Great news! We\'ve just added a mailshistory new module to the app. Explore the exciting features and functionality it brings to enhance your experience.', NULL, NULL, '2023-12-23 00:39:57', NULL, NULL),
(308, 'L-d9c40cf16673', 1, 'log', 'success', 'added mailshistory table', 'Aow3OtlEDqArEM', '200', '2023-12-23 00:39:57', NULL, NULL),
(309, 'G-9dfb8ca45411', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 00:39:58', NULL, NULL),
(310, 'G-c64fab6b43c8', 1, 'history', 'success', 'Updated traffic successfully.  /home.', NULL, NULL, '2023-12-23 03:00:54', NULL, NULL),
(311, 'G-ef742943a80d', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 03:17:11', NULL, NULL),
(312, 'G-0a94ea29ccc2', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-23 03:17:13', NULL, NULL),
(313, 'G-a4a5e3ddc9a8', 1, 'history', 'success', 'New traffic created successfully.T-60ee23720154.', NULL, NULL, '2023-12-23 03:17:14', NULL, NULL),
(314, 'G-350064c68127', 1, 'history', 'success', 'New projects created successfully.A-0bad582c3c0f.', NULL, NULL, '2023-12-23 03:17:23', NULL, NULL),
(315, 'G-f985d5feeb85', 1, 'history', 'success', 'New projectcategories created successfully.C-9c31db2afc42.', NULL, NULL, '2023-12-23 03:17:23', NULL, NULL),
(316, 'G-227b459814ff', 1, 'history', 'success', 'New projectmeta created successfully.M-bad36b981b8a.', NULL, NULL, '2023-12-23 03:17:23', NULL, NULL),
(317, 'G-79cfd393929a', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-23 03:17:23', NULL, NULL),
(318, 'G-cdea6d36ca1b', 1, 'history', 'success', 'New notifications created successfully.N-1e50306a54cb.', NULL, NULL, '2023-12-23 03:17:23', NULL, NULL),
(319, 'G-32680d48afab', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-23 03:17:24', NULL, NULL),
(320, 'G-abbcac5ef03c', 1, 'history', 'success', 'Updated traffic successfully.  /project/editor.', NULL, NULL, '2023-12-23 03:17:42', NULL, NULL),
(321, 'G-5b14c274042b', 1, 'history', 'success', 'New projects created successfully.A-3373af10d144.', NULL, NULL, '2023-12-23 03:17:49', NULL, NULL),
(322, 'G-4afafb54d181', 1, 'history', 'success', 'New projectcategories created successfully.C-236e050bc294.', NULL, NULL, '2023-12-23 03:17:49', NULL, NULL),
(323, 'G-2760fbfcac43', 1, 'history', 'success', 'New projectmeta created successfully.M-677a84bb42cb.', NULL, NULL, '2023-12-23 03:17:49', NULL, NULL),
(324, 'G-dcf2c3ac51d8', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-23 03:17:49', NULL, NULL),
(325, 'G-1df98f0a2942', 1, 'history', 'success', 'New notifications created successfully.N-d351e0e63f8f.', NULL, NULL, '2023-12-23 03:17:49', NULL, NULL),
(326, 'G-51ca99cd124d', 1, 'history', 'success', 'New projects created successfully.A-5feb3aad8f5f.', NULL, NULL, '2023-12-23 03:21:43', NULL, NULL),
(327, 'G-9a9d7a06ddb8', 1, 'history', 'success', 'New projectcategories created successfully.C-8e3cb8bd71ff.', NULL, NULL, '2023-12-23 03:21:43', NULL, NULL),
(328, 'G-db1388977d6b', 1, 'history', 'success', 'New projectmeta created successfully.M-bd289e06cf90.', NULL, NULL, '2023-12-23 03:21:43', NULL, NULL),
(329, 'G-d51f915ad713', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-23 03:21:43', NULL, NULL),
(330, 'G-1c5c6709a997', 1, 'history', 'success', 'New notifications created successfully.N-bf366c6503f2.', NULL, NULL, '2023-12-23 03:21:43', NULL, NULL),
(331, 'G-3b8b81bc97af', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-23 03:21:43', NULL, NULL),
(332, 'G-cfc4633ebeb4', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-23 03:47:56', NULL, NULL),
(333, 'G-ed9afd48f118', 1, 'history', 'success', 'Updated traffic successfully.  /project/editor.', NULL, NULL, '2023-12-23 03:47:57', NULL, NULL),
(334, 'G-e048dfc89cb0', 1, 'history', 'success', 'New projects created successfully.A-590a3697bbd0.', NULL, NULL, '2023-12-23 03:48:08', NULL, NULL),
(335, 'G-60e24369a89d', 1, 'history', 'success', 'New projectcategories created successfully.C-db4d86c624ec.', NULL, NULL, '2023-12-23 03:48:08', NULL, NULL),
(336, 'G-87a744bb3e9a', 1, 'history', 'success', 'New projectmeta created successfully.M-fa182255773c.', NULL, NULL, '2023-12-23 03:48:08', NULL, NULL),
(337, 'G-438529c51421', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-23 03:48:08', NULL, NULL),
(338, 'G-3f92bb43e217', 1, 'history', 'success', 'New notifications created successfully.N-a6c7946086e6.', NULL, NULL, '2023-12-23 03:48:08', NULL, NULL),
(339, 'G-912917475c55', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-23 03:48:09', NULL, NULL),
(340, 'G-10d2a90fe3bf', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard/projects.', NULL, NULL, '2023-12-23 03:48:13', NULL, NULL),
(341, 'G-a6df1117b0bf', 5, 'history', 'success', 'Welcome, admin! You are now logged in.', NULL, NULL, '2023-12-23 04:53:38', NULL, NULL),
(342, 'L-256c9a72cb39', 5, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'group_id \'=\'  AND `permissions` . `action` LIKE \'%dashboard%\'  AND `permissions`\' at line 1', 'x3TOpGyxVbrd3A', '500', '2023-12-23 04:53:39', NULL, NULL),
(343, 'G-9395941410eb', 5, 'history', 'success', 'Updated traffic successfully.  /profile.', NULL, NULL, '2023-12-23 04:53:39', NULL, NULL),
(344, 'G-b2cf99948574', 1, 'history', 'success', 'Updated traffic successfully.  /.', NULL, NULL, '2023-12-23 04:57:53', NULL, NULL),
(345, 'G-c2e2760eb943', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 04:57:57', NULL, NULL),
(346, 'G-4eb723144236', 1, 'history', 'success', 'New traffic created successfully.T-60d5babca480.', NULL, NULL, '2023-12-23 04:58:26', NULL, NULL),
(347, 'G-caf5753bf1e7', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2023-12-23 16:02:54', NULL, NULL),
(348, 'L-f53710aaae97', 1, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'FROM `` GROUP BY  ORDER BY\' at line 1', 'PTtkYxmbkn8FsJ', '500', '2023-12-23 16:02:54', NULL, NULL),
(349, 'G-e282bbaf207a', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2023-12-23 16:04:24', NULL, NULL),
(350, 'L-1423e72616fd', 1, 'log', 'fails', 'Error: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'id\' in \'field list\'', 'PTtkYxmbkn8FsJ', '500', '2023-12-23 16:04:24', NULL, NULL),
(351, 'G-1e6b892ac87d', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2023-12-23 16:07:20', NULL, NULL),
(352, 'L-2b63297214df', 1, 'log', 'fails', 'Query preparation failed: null', 'jjrUbFpPCKOmxg', '500', '2023-12-23 16:07:20', NULL, NULL),
(353, 'G-551525f42186', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2023-12-23 17:10:12', NULL, NULL),
(354, 'L-6587805aee81', 1, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `visitors`.`deleted_at` IS NULL\' at line 1', 'PTtkYxmbkn8FsJ', '500', '2023-12-23 17:10:12', NULL, NULL),
(355, 'G-f52d7d81b92a', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2023-12-23 17:12:52', NULL, NULL),
(356, 'L-ef47021f4033', 1, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `visitors`.`deleted_at` IS NULL\' at line 1', 'PTtkYxmbkn8FsJ', '500', '2023-12-23 17:12:52', NULL, NULL),
(357, 'G-75b8e4b2c6ec', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2023-12-23 17:13:25', NULL, NULL),
(358, 'L-54073ab50270', 1, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `visitors`.`deleted_at` IS NULL\' at line 1', 'PTtkYxmbkn8FsJ', '500', '2023-12-23 17:13:25', NULL, NULL),
(359, 'G-81c0eed8cd92', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2023-12-23 17:13:28', NULL, NULL),
(360, 'L-2446e61e927d', 1, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE `visitors`.`deleted_at` IS NULL\' at line 1', 'PTtkYxmbkn8FsJ', '500', '2023-12-23 17:13:28', NULL, NULL),
(361, 'G-d71346cee8a8', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2023-12-23 17:16:06', NULL, NULL),
(362, 'L-ad2b8be7e698', 1, 'log', 'fails', 'Error: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'id\' in \'field list\'', 'PTtkYxmbkn8FsJ', '500', '2023-12-23 17:16:06', NULL, NULL),
(363, 'G-2c61b286a427', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2023-12-23 17:22:26', NULL, NULL),
(364, 'L-58cd44858ce2', 1, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE   `visitors`.`created_at` > \'2023-12-18\'\' at line 1', 'PTtkYxmbkn8FsJ', '500', '2023-12-23 17:22:26', NULL, NULL),
(365, 'G-d13542fe0d6b', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2023-12-23 17:22:37', NULL, NULL),
(366, 'L-893020e62ea3', 1, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE   `visitors`.`created_at` = \'2023-12-18\'\' at line 1', 'PTtkYxmbkn8FsJ', '500', '2023-12-23 17:22:37', NULL, NULL),
(367, 'G-1c7cc0a8aa04', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2023-12-23 17:24:39', NULL, NULL),
(368, 'L-33d8d17b05a9', 1, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE   `visitors`.`created_at` = \'20-12-2023\'\' at line 1', 'PTtkYxmbkn8FsJ', '500', '2023-12-23 17:24:39', NULL, NULL),
(369, 'G-f180ee888d19', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2023-12-23 17:24:59', NULL, NULL),
(370, 'L-6060dceaa682', 1, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'WHERE   `visitors`.`uid` = \'23\'\' at line 1', 'PTtkYxmbkn8FsJ', '500', '2023-12-23 17:24:59', NULL, NULL),
(371, 'G-bd868df54adb', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2023-12-23 17:26:27', NULL, NULL),
(372, 'L-908edb3f2997', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, COUNT(uid) AS daily_visitors FROM `visitors` WHERE   `visitors`.`created_at` = :0_created_at   GROUP BY visit_date ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2023-12-23 17:26:27', NULL, NULL),
(373, 'G-b8cd0f818a40', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2023-12-23 17:26:40', NULL, NULL),
(374, 'L-ac107b630ccc', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, COUNT(uid) AS daily_visitors FROM `visitors` WHERE   `visitors`.`created_at` = :0_created_at   GROUP BY visit_date ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2023-12-23 17:26:40', NULL, NULL),
(375, 'G-ea41879e48e9', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2023-12-23 17:26:49', NULL, NULL),
(376, 'L-a35b0043ea6f', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, COUNT(uid) AS daily_visitors FROM `visitors` WHERE   `visitors`.`created_at` = :0_created_at   GROUP BY visit_date ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2023-12-23 17:26:49', NULL, NULL),
(377, 'G-8dc7bb258221', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2023-12-23 17:36:37', NULL, NULL),
(378, 'L-73eb6fed10bb', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, COUNT(uid) AS daily_visitors FROM `visitors` WHERE   `visitors`.`created_at` BETWEEN :0_created_at AND :to_0_created_at   GROUP BY visit_date ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2023-12-23 17:36:37', NULL, NULL),
(379, 'G-d995cbdaf2a7', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2023-12-23 17:39:05', NULL, NULL),
(380, 'L-dd31cad7c026', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, COUNT(uid) AS daily_visitors FROM `visitors` WHERE   `visitors`.`created_at` BETWEEN :0_created_at AND :to_0_created_at   GROUP BY visit_date ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2023-12-23 17:39:05', NULL, NULL),
(381, 'G-7401c194a485', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2023-12-23 17:41:11', NULL, NULL),
(382, 'L-dcef40c5266a', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, COUNT(uid) AS daily_visitors FROM `visitors` WHERE   `visitors`.`created_at` BETWEEN :0_created_at AND :to_0_created_at   GROUP BY visit_date ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2023-12-23 17:41:11', NULL, NULL),
(383, 'G-4c78f92c8e58', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2023-12-23 17:45:20', NULL, NULL),
(384, 'L-7621dce9dbf8', 1, 'log', 'fails', 'Error: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'type\' in \'field list\'', 'PTtkYxmbkn8FsJ', '500', '2023-12-23 17:45:20', NULL, NULL),
(385, 'G-9a20e8e19042', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2023-12-23 17:45:30', NULL, NULL),
(386, 'L-f89479c06046', 1, 'log', 'fails', 'Error: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'type\' in \'field list\'', 'PTtkYxmbkn8FsJ', '500', '2023-12-23 17:45:30', NULL, NULL),
(387, 'G-b5d33dc57d14', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2023-12-23 17:45:39', NULL, NULL),
(388, 'L-5e8cf038b701', 1, 'log', 'fails', 'Error: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'type\' in \'field list\'', 'PTtkYxmbkn8FsJ', '500', '2023-12-23 17:45:39', NULL, NULL),
(389, 'G-86170675df92', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2023-12-23 17:45:40', NULL, NULL),
(390, 'L-c1276efdf738', 1, 'log', 'fails', 'Error: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'type\' in \'field list\'', 'PTtkYxmbkn8FsJ', '500', '2023-12-23 17:45:40', NULL, NULL),
(391, 'G-cd6815af2656', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2023-12-23 17:46:17', NULL, NULL),
(392, 'L-1695a88c705c', 1, 'log', 'fails', 'Error: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'type_count\' in \'order clause\'', 'PTtkYxmbkn8FsJ', '500', '2023-12-23 17:46:17', NULL, NULL),
(393, 'G-135255fbab48', 1, 'history', 'success', 'New visitors created successfully.V-1760be159f39.', NULL, NULL, '2023-12-23 17:58:42', NULL, NULL),
(394, 'G-d0bb2b387ca5', 1, 'history', 'success', 'New traffic created successfully.T-a689297211d3.', NULL, NULL, '2023-12-23 17:58:42', NULL, NULL),
(395, 'G-e738c03c63b3', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 17:59:11', NULL, NULL),
(396, 'G-57214c6a81a8', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:00:28', NULL, NULL),
(397, 'G-932dee6b8760', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:00:49', NULL, NULL),
(398, 'G-8267fa7ed13c', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:01:31', NULL, NULL),
(399, 'G-760e9f01a142', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:03:07', NULL, NULL),
(400, 'G-d4030b225e03', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:03:59', NULL, NULL),
(401, 'G-3b9befaafbfe', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:04:40', NULL, NULL),
(402, 'G-e6a0b7e0bf6a', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:05:02', NULL, NULL),
(403, 'G-510259ce85ef', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:05:28', NULL, NULL),
(404, 'G-c087ad2fd07a', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:05:45', NULL, NULL),
(405, 'G-7e43a9b579be', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:06:02', NULL, NULL),
(406, 'G-3be4014b7408', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:06:07', NULL, NULL),
(407, 'G-86a3469bb5ae', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:06:19', NULL, NULL),
(408, 'G-04ce87069bb0', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:06:33', NULL, NULL),
(409, 'G-a57a59717343', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:07:21', NULL, NULL),
(410, 'G-7cfd3c1c59de', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:07:35', NULL, NULL),
(411, 'G-9b9c0d44533e', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:08:36', NULL, NULL),
(412, 'G-3aee95df2585', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:08:47', NULL, NULL),
(413, 'G-395f64a0aae0', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:08:56', NULL, NULL),
(414, 'G-30d86f9616be', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:09:13', NULL, NULL),
(415, 'G-07cb01643227', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:10:07', NULL, NULL),
(416, 'G-13aeab222207', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:10:29', NULL, NULL),
(417, 'G-ddd072b6b839', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:14:48', NULL, NULL),
(418, 'G-5cdee1b2d5a8', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:14:55', NULL, NULL),
(419, 'G-0be3fb55dae1', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:15:42', NULL, NULL),
(420, 'G-7955e69b3ef7', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:16:02', NULL, NULL),
(421, 'G-003bc94f64ed', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:16:06', NULL, NULL),
(422, 'G-46887db9d825', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:16:10', NULL, NULL),
(423, 'G-098b3d6caf89', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:17:42', NULL, NULL),
(424, 'G-6e29a29119f8', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:17:50', NULL, NULL),
(425, 'G-3917a7891b1f', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:27:07', NULL, NULL),
(426, 'G-ef5a54794d2e', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:28:38', NULL, NULL),
(427, 'G-20127af084ad', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:29:13', NULL, NULL),
(428, 'G-1d58fbf7cdf7', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:29:59', NULL, NULL),
(429, 'G-6bd3ff19824a', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:30:04', NULL, NULL),
(430, 'G-5a487853f26b', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:30:55', NULL, NULL),
(431, 'G-f671e70dfde6', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:31:19', NULL, NULL),
(432, 'G-6ffc33c3cd36', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:31:38', NULL, NULL),
(433, 'G-118dbf116971', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:32:18', NULL, NULL),
(434, 'G-9d8429ff9b64', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:32:33', NULL, NULL),
(435, 'G-c1d4935f1616', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:32:53', NULL, NULL),
(436, 'G-6949cd9b6fd9', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:33:08', NULL, NULL),
(437, 'G-a2bd279cedca', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:49:12', NULL, NULL),
(438, 'G-004816afe2de', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:50:29', NULL, NULL),
(439, 'G-660655a75930', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:51:08', NULL, NULL),
(440, 'G-0d80eb5dd8ab', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:51:37', NULL, NULL),
(441, 'G-f0d2bb8e8221', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:51:43', NULL, NULL),
(442, 'G-423ebba5d7b5', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:52:39', NULL, NULL),
(443, 'G-89ff52b44fda', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:52:47', NULL, NULL),
(444, 'G-c875b5d6ecc9', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:54:04', NULL, NULL),
(445, 'G-e6dcf4527e0d', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:54:42', NULL, NULL),
(446, 'G-e1c9ad056019', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:55:26', NULL, NULL),
(447, 'G-dd9d85bf9329', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:56:07', NULL, NULL),
(448, 'G-9f0e087ac8a6', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:56:30', NULL, NULL),
(449, 'G-d4b2532cc16c', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:58:48', NULL, NULL),
(450, 'G-4dc7e4dd58e4', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-23 18:59:23', NULL, NULL),
(451, 'G-250ec5e25833', 1, 'history', 'success', 'Welcome, developer! You are now logged in.', NULL, NULL, '2023-12-24 02:59:38', NULL, NULL),
(452, 'G-693a78f62700', 1, 'history', 'success', 'New traffic created successfully.T-072ba0253a31.', NULL, NULL, '2023-12-24 02:59:38', NULL, NULL),
(453, 'G-821cbecf26a6', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 02:59:43', NULL, NULL),
(454, 'G-b55621539fd4', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:05:15', NULL, NULL),
(455, 'G-98d10b6d7e48', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:06:53', NULL, NULL),
(456, 'G-0532e3742fc8', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:12:21', NULL, NULL),
(457, 'G-70c2782a47fe', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:17:06', NULL, NULL),
(458, 'G-853391bea743', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:20:55', NULL, NULL),
(459, 'G-56cd7e6e8f95', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:21:37', NULL, NULL),
(460, 'G-8d387a23fc55', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:22:06', NULL, NULL),
(461, 'G-5e29975309f7', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:23:03', NULL, NULL),
(462, 'G-9a0c60c8202e', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:27:25', NULL, NULL),
(463, 'G-ceefffd3bd72', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:27:43', NULL, NULL),
(464, 'G-23634601d12c', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:28:05', NULL, NULL),
(465, 'G-7635c3baef20', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:34:08', NULL, NULL),
(466, 'G-bc941ed73e10', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:34:27', NULL, NULL),
(467, 'G-167a641a695f', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:34:41', NULL, NULL),
(468, 'G-973a77e78d3c', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:37:12', NULL, NULL),
(469, 'G-4faede21967e', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:37:34', NULL, NULL),
(470, 'G-cd437e3bff06', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:40:36', NULL, NULL),
(471, 'G-9cdbdae15370', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:41:04', NULL, NULL),
(472, 'G-2b0b15ace7dd', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:41:21', NULL, NULL),
(473, 'G-8c806ec0726e', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:42:01', NULL, NULL),
(474, 'G-2775278dacaf', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:44:04', NULL, NULL),
(475, 'G-20501b141b4e', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:44:48', NULL, NULL),
(476, 'G-a570bf680d4d', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:45:04', NULL, NULL),
(477, 'G-3bea30b24317', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:45:05', NULL, NULL),
(478, 'G-74d3dfbb3cbc', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:45:23', NULL, NULL),
(479, 'G-83fe9c0d1d35', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:45:38', NULL, NULL),
(480, 'G-b177b3391714', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 03:46:13', NULL, NULL),
(481, 'G-97e585bdc7ae', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:10:11', NULL, NULL),
(482, 'G-95ce33f32dec', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2023-12-24 04:10:12', NULL, NULL),
(483, 'L-ec52d6b75ed6', 1, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'(ORDER BY page_load_time ASC) AS ascending_rank,\r\n                ROW_NUMBER() O\' at line 2', 'PTtkYxmbkn8FsJ', '500', '2023-12-24 04:10:12', NULL, NULL),
(484, 'G-f740ff67c583', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:11:03', NULL, NULL),
(485, 'G-085ea9cafd40', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:14:04', NULL, NULL),
(486, 'G-caa13cc52984', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:14:34', NULL, NULL),
(487, 'G-04d76e8b8b30', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:15:03', NULL, NULL),
(488, 'G-7f32c0906544', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2023-12-24 04:15:03', NULL, NULL),
(489, 'L-28cf1bee71c7', 1, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'(ORDER BY page_load_time ASC) AS ascending_rank,\n                ROW_NUMBER() O\' at line 2', 'PTtkYxmbkn8FsJ', '500', '2023-12-24 04:15:03', NULL, NULL),
(490, 'G-3ba6a77f0a74', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:15:40', NULL, NULL),
(491, 'G-079c998779d1', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:16:50', NULL, NULL),
(492, 'G-8aafe9d9d650', 1, 'history', 'success', 'New traffic created successfully.T-8e22a6b272d9.', NULL, NULL, '2023-12-24 04:17:21', NULL, NULL),
(493, 'G-1a57a4d72fa9', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:20:06', NULL, NULL),
(494, 'G-9848e3d0ce0d', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2023-12-24 04:20:07', NULL, NULL),
(495, 'L-f68c9d2f6e9a', 1, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'(ORDER BY page_load_time ASC) AS ascending_rank,\r\n                ROW_NUMBER() O\' at line 2', 'PTtkYxmbkn8FsJ', '500', '2023-12-24 04:20:07', NULL, NULL),
(496, 'G-9dd911ae3922', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:20:35', NULL, NULL),
(497, 'G-74a53ff4b215', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2023-12-24 04:20:36', NULL, NULL),
(498, 'L-1633c971ce3e', 1, 'log', 'fails', 'Error: SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'(ORDER BY page_load_time ASC) AS ascending_rank,\r\n                ROW_NUMBER() O\' at line 2', 'PTtkYxmbkn8FsJ', '500', '2023-12-24 04:20:36', NULL, NULL),
(499, 'G-cadec8dbab68', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:34:43', NULL, NULL),
(500, 'G-0f1f033f886f', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:36:00', NULL, NULL),
(501, 'G-f7a201fc6346', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:36:30', NULL, NULL),
(502, 'G-642b12fdf6da', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:38:03', NULL, NULL),
(503, 'G-4eb5f7ecb051', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:42:09', NULL, NULL),
(504, 'G-49769aa996a5', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:42:38', NULL, NULL),
(505, 'G-ca3b659dbaff', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:47:59', NULL, NULL),
(506, 'G-dcc451a992b7', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:49:21', NULL, NULL),
(507, 'G-4d7907e044cc', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:49:52', NULL, NULL),
(508, 'G-7d8e835da513', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2023-12-24 04:49:53', NULL, NULL),
(509, 'L-6700bd89e85d', 1, 'log', 'fails', 'Error: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'page_load_time\' in \'field list\'', 'PTtkYxmbkn8FsJ', '500', '2023-12-24 04:49:53', NULL, NULL),
(510, 'G-c43523b659e3', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:50:27', NULL, NULL),
(511, 'G-328d11a4a010', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:53:58', NULL, NULL),
(512, 'G-88544386e8b6', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:54:05', NULL, NULL),
(513, 'G-31bd5030d73d', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:54:32', NULL, NULL),
(514, 'G-28d9f52562f2', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:55:29', NULL, NULL),
(515, 'G-929ee5c8c907', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:55:46', NULL, NULL),
(516, 'G-606f8e721764', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:56:04', NULL, NULL),
(517, 'G-089389588c0b', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:56:23', NULL, NULL),
(518, 'G-c3aaa2ab015d', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:58:08', NULL, NULL),
(519, 'G-9b33b969f4ec', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:58:16', NULL, NULL),
(520, 'G-08c7edb556d3', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 04:58:46', NULL, NULL),
(521, 'G-9d7e7e03f9c9', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:03:01', NULL, NULL),
(522, 'G-56589d16f347', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:12:46', NULL, NULL),
(523, 'G-e01727315774', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:22:39', NULL, NULL),
(524, 'G-cc1d5a236fe3', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:23:34', NULL, NULL),
(525, 'G-7914c54a9e95', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:23:42', NULL, NULL),
(526, 'G-6b61cd4f75bb', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:24:28', NULL, NULL),
(527, 'G-1af582c03fce', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:24:34', NULL, NULL),
(528, 'G-155ed747ce74', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:25:16', NULL, NULL),
(529, 'G-17b4dd7ba920', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:25:58', NULL, NULL),
(530, 'G-3458492d143e', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:26:11', NULL, NULL),
(531, 'G-a40a24cc67f6', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2023-12-24 05:26:11', NULL, NULL),
(532, 'L-482914f4b391', 1, 'log', 'fails', 'Error: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'ip\' in \'field list\'', 'PTtkYxmbkn8FsJ', '500', '2023-12-24 05:26:11', NULL, NULL),
(533, 'G-bd998b0b18e8', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:26:50', NULL, NULL),
(534, 'G-f64ffda8b08a', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:27:45', NULL, NULL),
(535, 'G-4ddd40a34ac1', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:30:44', NULL, NULL),
(536, 'G-2c2181d5b50d', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:31:09', NULL, NULL),
(537, 'G-d6e50a5a5f97', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:33:21', NULL, NULL),
(538, 'G-b6cb92f96f60', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:36:20', NULL, NULL),
(539, 'G-52f07857d083', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:36:40', NULL, NULL),
(540, 'G-f3812649dba1', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:36:50', NULL, NULL),
(541, 'G-91aa7389186e', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:39:44', NULL, NULL),
(542, 'G-4da062a06584', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:39:51', NULL, NULL),
(543, 'G-c3db59e383a7', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:40:17', NULL, NULL),
(544, 'G-b4a43451aa9d', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:40:26', NULL, NULL),
(545, 'G-5228a14ca999', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:40:52', NULL, NULL),
(546, 'G-bd6266a673ce', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:40:58', NULL, NULL),
(547, 'G-5b01cbf35246', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:41:47', NULL, NULL),
(548, 'G-6cb1fd8a8c46', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:41:56', NULL, NULL),
(549, 'G-2a1f54403098', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:42:01', NULL, NULL),
(550, 'G-4d86c606d82a', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:42:34', NULL, NULL),
(551, 'G-d0f02ff80a54', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:43:30', NULL, NULL),
(552, 'G-ef8f872280b8', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:43:41', NULL, NULL),
(553, 'G-a77edc48f158', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:44:57', NULL, NULL),
(554, 'G-f7e568d4919c', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:45:30', NULL, NULL),
(555, 'G-1f7fb621d285', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:46:31', NULL, NULL),
(556, 'G-3ca5471e68ec', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:46:50', NULL, NULL),
(557, 'G-ace68006a574', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:47:29', NULL, NULL),
(558, 'G-d975d2574ba4', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:47:46', NULL, NULL),
(559, 'G-abfb1d4d28f2', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:48:01', NULL, NULL),
(560, 'G-2596baa9aefd', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:48:23', NULL, NULL),
(561, 'G-59e4fd788b9a', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:48:44', NULL, NULL),
(562, 'G-72e423b9ba5b', 1, 'history', 'success', 'Updated traffic successfully.  /dashboard.', NULL, NULL, '2023-12-24 05:52:10', NULL, NULL),
(563, 'G-a30fb79063bd', 1, 'history', 'success', 'Updated projects successfully.  A-3373af10d144.', NULL, NULL, '2023-12-25 03:15:59', NULL, NULL),
(564, 'G-0b1010f18016', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-25 03:15:59', NULL, NULL),
(565, 'G-ae91421212da', 1, 'history', 'success', 'Updated projects successfully.  A-3373af10d144.', NULL, NULL, '2023-12-25 03:16:38', NULL, NULL),
(566, 'G-1d352cb3b902', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-25 03:16:38', NULL, NULL),
(567, 'G-37171040614a', 1, 'history', 'success', 'Updated projects successfully.  A-3373af10d144.', NULL, NULL, '2023-12-25 03:19:17', NULL, NULL),
(568, 'G-b645810337a9', 1, 'history', 'success', 'Updated projects successfully.  A-5ed4ddd1a8f0.', NULL, NULL, '2023-12-25 03:19:17', NULL, NULL),
(569, 'G-cfe26e2833da', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2023-12-25 03:19:17', NULL, NULL),
(570, 'G-7d6d0f1aabc5', 1, 'history', 'success', 'New image uploaded successfully.', NULL, NULL, '2023-12-25 03:28:47', NULL, NULL),
(571, 'G-c99cbc580c17', 1, 'history', 'success', 'Updated users successfully.  1.', NULL, NULL, '2023-12-25 03:28:47', NULL, NULL),
(572, 'G-9748aacb880f', 1, 'history', 'success', 'Your profile has been successfully updated.', NULL, NULL, '2023-12-25 03:28:47', NULL, NULL),
(573, 'G-aac11bfba7a1', 1, 'history', 'success', 'Welcome, developer! You are now logged in.', NULL, NULL, '2024-01-25 01:56:28', NULL, NULL),
(574, 'G-451bb80d5bfb', 1, 'history', 'success', 'Updated projects successfully.  A-75cc395b5f62.', NULL, NULL, '2024-01-25 02:21:51', NULL, NULL),
(575, 'G-01a72e4c1af8', 1, 'history', 'success', 'Updated projectmeta successfully.  5.', NULL, NULL, '2024-01-25 02:21:51', NULL, NULL),
(576, 'G-9ed5ad7b641d', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2024-01-25 02:21:51', NULL, NULL),
(577, 'G-812b52c8cbdb', 1, 'history', 'success', 'New image uploaded successfully.', NULL, NULL, '2024-01-25 02:28:38', NULL, NULL);
INSERT INTO `records` (`uid`, `guide`, `owner`, `type`, `status`, `message`, `hash`, `code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(578, 'G-0116485fefb0', 1, 'history', 'success', 'New filestorage created successfully.F-f69390d7e801.', NULL, NULL, '2024-01-25 02:28:38', NULL, NULL),
(579, 'G-69870ecf7ac6', 1, 'history', 'success', 'Updated projects successfully.  A-75cc395b5f62.', NULL, NULL, '2024-01-25 02:28:41', NULL, NULL),
(580, 'G-ebd5b615c8e8', 1, 'history', 'success', 'New projectfile created successfully.M-897040aeb43e.', NULL, NULL, '2024-01-25 02:28:41', NULL, NULL),
(581, 'G-fb01ab6a45b9', 1, 'history', 'fails', 'Apologies, but we\'re currently experiencing technical difficulties on our server while creating the item. Our team has been notified, and we\'re working to resolve this issue. Please try again later.', NULL, NULL, '2024-01-25 02:28:41', NULL, NULL),
(582, 'L-becc3c9cd625', 1, 'log', 'fails', 'Error: SQLSTATE[HY000]: General error: 1364 Field \'file_id\' doesn\'t have a default value', 'BSrxZSqdFh6ry1', '500', '2024-01-25 02:28:41', NULL, NULL),
(583, 'G-a84fd9d00292', 1, 'history', 'fails', 'An error occurred the projectfile. Please review the data provided and try again.', NULL, NULL, '2024-01-25 02:28:41', NULL, NULL),
(584, 'G-106620f6abb0', 1, 'history', 'success', 'Updated projectmeta successfully.  5.', NULL, NULL, '2024-01-25 02:28:41', NULL, NULL),
(585, 'G-f0d030fdae33', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2024-01-25 02:28:41', NULL, NULL),
(586, 'G-614829aeda90', 1, 'history', 'success', 'New image uploaded successfully.', NULL, NULL, '2024-01-25 02:29:01', NULL, NULL),
(587, 'G-65f47ce855c2', 1, 'history', 'success', 'New filestorage created successfully.F-5a05ef621625.', NULL, NULL, '2024-01-25 02:29:01', NULL, NULL),
(588, 'G-5ac6dd955bd8', 1, 'history', 'success', 'New image uploaded successfully.', NULL, NULL, '2024-01-25 02:29:01', NULL, NULL),
(589, 'G-340a7408ef41', 1, 'history', 'success', 'New filestorage created successfully.F-cb6031af960c.', NULL, NULL, '2024-01-25 02:29:01', NULL, NULL),
(590, 'G-c16432c82ae6', 1, 'history', 'success', 'Updated projects successfully.  A-75cc395b5f62.', NULL, NULL, '2024-01-25 02:29:09', NULL, NULL),
(591, 'G-6635cf37183b', 1, 'history', 'success', 'New projectfile created successfully.M-0ec55b9604ab.', NULL, NULL, '2024-01-25 02:29:09', NULL, NULL),
(592, 'G-0671bd13b5da', 1, 'history', 'success', 'New projectfile created successfully.M-e7b8a005614f.', NULL, NULL, '2024-01-25 02:29:09', NULL, NULL),
(593, 'G-73cd409b5ae8', 1, 'history', 'success', 'Updated projectmeta successfully.  5.', NULL, NULL, '2024-01-25 02:29:09', NULL, NULL),
(594, 'G-d564d66951bb', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2024-01-25 02:29:09', NULL, NULL),
(595, 'G-fd316e4f8a07', 1, 'history', 'success', 'Updated projects successfully.  A-75cc395b5f62.', NULL, NULL, '2024-01-25 02:48:08', NULL, NULL),
(596, 'G-ecf6f251731c', 1, 'history', 'success', 'Updated projectmeta successfully.  5.', NULL, NULL, '2024-01-25 02:48:08', NULL, NULL),
(597, 'G-4a23faedd404', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2024-01-25 02:48:08', NULL, NULL),
(598, 'G-4287cc987fa1', 1, 'history', 'success', 'Updated projects successfully.  A-75cc395b5f62.', NULL, NULL, '2024-01-25 02:49:23', NULL, NULL),
(599, 'G-05c97ee7f383', 1, 'history', 'success', 'Updated projectmeta successfully.  5.', NULL, NULL, '2024-01-25 02:49:23', NULL, NULL),
(600, 'G-2f5898ef97e9', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2024-01-25 02:49:23', NULL, NULL),
(601, 'G-b8ff9b39e96d', 1, 'history', 'success', 'Updated projects successfully.  A-75cc395b5f62.', NULL, NULL, '2024-01-25 02:50:15', NULL, NULL),
(602, 'G-8d5f611f3106', 1, 'history', 'success', 'Updated projects successfully.  A-75cc395b5f62.', NULL, NULL, '2024-01-25 02:50:34', NULL, NULL),
(603, 'G-6556a2add35e', 1, 'history', 'success', 'New projectfile created successfully.M-2714a1f9be42.', NULL, NULL, '2024-01-25 02:50:34', NULL, NULL),
(604, 'G-d5f37d798de4', 1, 'history', 'success', 'Updated projectmeta successfully.  5.', NULL, NULL, '2024-01-25 02:50:34', NULL, NULL),
(605, 'G-893f2f690e67', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2024-01-25 02:50:34', NULL, NULL),
(606, 'G-064af2b2e42a', 1, 'history', 'success', 'Updated projects successfully.  A-75cc395b5f62.', NULL, NULL, '2024-01-25 02:52:52', NULL, NULL),
(607, 'G-be8a90f8b58d', 1, 'history', 'success', 'Updated projectmeta successfully.  5.', NULL, NULL, '2024-01-25 02:52:52', NULL, NULL),
(608, 'G-cafb18391d0a', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2024-01-25 02:52:52', NULL, NULL),
(609, 'G-5ee16d8e3ef6', 1, 'history', 'success', 'Updated projects successfully.  A-75cc395b5f62.', NULL, NULL, '2024-01-25 02:59:03', NULL, NULL),
(610, 'G-84f09cfd6770', 1, 'history', 'success', 'New projectfile created successfully.M-3acb05c82a04.', NULL, NULL, '2024-01-25 02:59:03', NULL, NULL),
(611, 'G-fd42d45818f5', 1, 'history', 'success', 'Updated projectmeta successfully.  5.', NULL, NULL, '2024-01-25 02:59:03', NULL, NULL),
(612, 'G-7aaa64a8217b', 1, 'history', 'success', 'Successfully completed!', NULL, NULL, '2024-01-25 02:59:03', NULL, NULL),
(613, 'G-3155b288a784', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2024-01-25 03:19:56', NULL, NULL),
(614, 'L-f80bb5fbbf71', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, AVG(page_load_time) AS avg_page_load_time FROM `traffic` WHERE created_at >= CURDATE() - INTERVAL 5 DAY AND created_at < CURDATE()  GROUP BY visit_date  ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2024-01-25 03:19:56', NULL, NULL),
(615, 'G-c64515b8abd3', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2024-01-25 03:19:56', NULL, NULL),
(616, 'L-26ca77f84fab', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, COUNT(uid) AS daily_visitors FROM `visitors` WHERE created_at >= CURDATE() - INTERVAL 5 DAY AND created_at < CURDATE()  GROUP BY visit_date  ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2024-01-25 03:19:56', NULL, NULL),
(617, 'G-6fdabfedeba1', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2024-01-25 03:20:14', NULL, NULL),
(618, 'L-fb97514ef085', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, AVG(page_load_time) AS avg_page_load_time FROM `traffic` WHERE created_at >= CURDATE() - INTERVAL 5 DAY AND created_at < CURDATE()  GROUP BY visit_date  ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2024-01-25 03:20:14', NULL, NULL),
(619, 'G-40aa17ddd787', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2024-01-25 03:20:14', NULL, NULL),
(620, 'L-6e4b78a22f5c', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, COUNT(uid) AS daily_visitors FROM `visitors` WHERE created_at >= CURDATE() - INTERVAL 5 DAY AND created_at < CURDATE()  GROUP BY visit_date  ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2024-01-25 03:20:14', NULL, NULL),
(621, 'G-943f3491344f', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2024-01-25 03:20:31', NULL, NULL),
(622, 'L-4900d44b5de4', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, AVG(page_load_time) AS avg_page_load_time FROM `traffic` WHERE created_at >= CURDATE() - INTERVAL 30 DAY AND created_at < CURDATE()  GROUP BY visit_date  ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2024-01-25 03:20:31', NULL, NULL),
(623, 'G-96983e8b20d3', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2024-01-25 03:20:31', NULL, NULL),
(624, 'L-1c40f1649d23', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, COUNT(uid) AS daily_visitors FROM `visitors` WHERE created_at >= CURDATE() - INTERVAL 30 DAY AND created_at < CURDATE()  GROUP BY visit_date  ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2024-01-25 03:20:31', NULL, NULL),
(625, 'G-f5d75d812931', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2024-01-25 03:22:07', NULL, NULL),
(626, 'L-1c42bc9e1ffd', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, AVG(page_load_time) AS avg_page_load_time FROM `traffic` WHERE created_at >=UNIX_TIMESTAMP(CURDATE() - INTERVAL 30 DAY) AND created_at < UNIX_TIMESTAMP(CURDATE())  GROUP BY visit_date  ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2024-01-25 03:22:07', NULL, NULL),
(627, 'G-e838863b9ce0', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2024-01-25 03:22:07', NULL, NULL),
(628, 'L-e1a37febf573', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, COUNT(uid) AS daily_visitors FROM `visitors` WHERE created_at >=UNIX_TIMESTAMP(CURDATE() - INTERVAL 30 DAY) AND created_at < UNIX_TIMESTAMP(CURDATE())  GROUP BY visit_date  ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2024-01-25 03:22:07', NULL, NULL),
(629, 'G-f8978819c79d', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2024-01-25 03:22:24', NULL, NULL),
(630, 'L-e4158c700d1d', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, AVG(page_load_time) AS avg_page_load_time FROM `traffic` WHERE created_at >= UNIX_TIMESTAMP(CURDATE() - INTERVAL 30 DAY) AND created_at < UNIX_TIMESTAMP(CURDATE())  GROUP BY visit_date  ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2024-01-25 03:22:24', NULL, NULL),
(631, 'G-ff6938384508', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2024-01-25 03:22:24', NULL, NULL),
(632, 'L-28959827d925', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, COUNT(uid) AS daily_visitors FROM `visitors` WHERE created_at >= UNIX_TIMESTAMP(CURDATE() - INTERVAL 30 DAY) AND created_at < UNIX_TIMESTAMP(CURDATE())  GROUP BY visit_date  ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2024-01-25 03:22:24', NULL, NULL),
(633, 'G-df8af7d22818', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2024-01-25 03:23:10', NULL, NULL),
(634, 'L-9eee0f1287d6', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, AVG(page_load_time) AS avg_page_load_time FROM `traffic` WHERE created_at >= UNIX_TIMESTAMP(CURDATE() - INTERVAL 30 DAY) AND created_at < UNIX_TIMESTAMP(CURDATE())  GROUP BY visit_date  ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2024-01-25 03:23:10', NULL, NULL),
(635, 'G-210073635089', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2024-01-25 03:23:10', NULL, NULL),
(636, 'L-2ad83b554b3c', 1, 'log', 'fails', 'Error: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'visit_date\' in \'where clause\'', 'PTtkYxmbkn8FsJ', '500', '2024-01-25 03:23:10', NULL, NULL),
(637, 'G-e35e7fe0a15a', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2024-01-25 03:23:50', NULL, NULL),
(638, 'L-df1c5f0cd850', 1, 'log', 'fails', 'Error: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'visit_date\' in \'where clause\'', 'PTtkYxmbkn8FsJ', '500', '2024-01-25 03:23:50', NULL, NULL),
(639, 'G-a85233a86a47', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2024-01-25 03:23:50', NULL, NULL),
(640, 'L-2236cb3d0254', 1, 'log', 'fails', 'Error: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'visit_date\' in \'where clause\'', 'PTtkYxmbkn8FsJ', '500', '2024-01-25 03:23:50', NULL, NULL),
(641, 'G-6a184863adc8', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2024-01-25 03:23:53', NULL, NULL),
(642, 'L-2dff355355df', 1, 'log', 'fails', 'Error: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'visit_date\' in \'where clause\'', 'PTtkYxmbkn8FsJ', '500', '2024-01-25 03:23:53', NULL, NULL),
(643, 'G-87dc61415700', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2024-01-25 03:23:53', NULL, NULL),
(644, 'L-7080be047418', 1, 'log', 'fails', 'Error: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'visit_date\' in \'where clause\'', 'PTtkYxmbkn8FsJ', '500', '2024-01-25 03:23:53', NULL, NULL),
(645, 'G-78fb2ce3468d', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2024-01-25 03:24:04', NULL, NULL),
(646, 'L-cc98cd918dc6', 1, 'log', 'fails', 'Error: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'visit_date\' in \'where clause\'', 'PTtkYxmbkn8FsJ', '500', '2024-01-25 03:24:04', NULL, NULL),
(647, 'G-6a7b117859f5', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2024-01-25 03:24:04', NULL, NULL),
(648, 'L-f0d15e3f44a9', 1, 'log', 'fails', 'Error: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'visit_date\' in \'where clause\'', 'PTtkYxmbkn8FsJ', '500', '2024-01-25 03:24:04', NULL, NULL),
(649, 'G-bae2ab14ff50', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2024-01-25 03:24:21', NULL, NULL),
(650, 'L-e3ce74781461', 1, 'log', 'fails', 'Error: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'visit_date\' in \'where clause\'', 'PTtkYxmbkn8FsJ', '500', '2024-01-25 03:24:21', NULL, NULL),
(651, 'G-651ecfef4620', 1, 'history', 'fails', 'We regret to inform you that we\'re currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.', NULL, NULL, '2024-01-25 03:24:21', NULL, NULL),
(652, 'L-f098e401c3ce', 1, 'log', 'fails', 'Error: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'visit_date\' in \'where clause\'', 'PTtkYxmbkn8FsJ', '500', '2024-01-25 03:24:21', NULL, NULL),
(653, 'G-658f56c98be4', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2024-01-25 03:26:02', NULL, NULL),
(654, 'L-e490eb144de0', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, AVG(page_load_time) AS avg_page_load_time FROM `traffic` WHERE created_at >= CURDATE() - INTERVAL 30 DAY AND created_at < CURDATE()  GROUP BY visit_date  ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2024-01-25 03:26:02', NULL, NULL),
(655, 'G-c8b33e5230e6', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2024-01-25 03:26:02', NULL, NULL),
(656, 'L-48145e54c881', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, COUNT(uid) AS daily_visitors FROM `visitors` WHERE created_at >= CURDATE() - INTERVAL 30 DAY AND created_at < CURDATE()  GROUP BY visit_date  ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2024-01-25 03:26:02', NULL, NULL),
(657, 'G-0e18ed63972e', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2024-01-25 03:26:44', NULL, NULL),
(658, 'L-d06ef3d6ad78', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, COUNT(uid) AS daily_visitors FROM `visitors` WHERE created_at >= CURDATE() - INTERVAL 30 DAY AND created_at < CURDATE()  GROUP BY visit_date  ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2024-01-25 03:26:44', NULL, NULL),
(659, 'G-12d55f7f87b7', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2024-01-25 03:27:03', NULL, NULL),
(660, 'L-a61a4ede9aa6', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, COUNT(uid) AS daily_visitors FROM `visitors` WHERE created_at >= CURDATE() - INTERVAL 30 DAY AND created_at < CURDATE()  GROUP BY visit_date  ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2024-01-25 03:27:03', NULL, NULL),
(661, 'G-5d22fcf47d51', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2024-01-25 03:27:40', NULL, NULL),
(662, 'L-e623046e599b', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, AVG(page_load_time) AS avg_page_load_time FROM `traffic` WHERE created_at >= UNIX_TIMESTAMP(CURDATE() - INTERVAL 30 DAY) AND created_at < UNIX_TIMESTAMP(CURDATE())  GROUP BY visit_date  ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2024-01-25 03:27:40', NULL, NULL),
(663, 'G-f9a2bd128ff1', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2024-01-25 03:27:40', NULL, NULL),
(664, 'L-c540a393faa3', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, COUNT(uid) AS daily_visitors FROM `visitors` WHERE created_at >= UNIX_TIMESTAMP(CURDATE() - INTERVAL 30 DAY) AND created_at < UNIX_TIMESTAMP(CURDATE())  GROUP BY visit_date  ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2024-01-25 03:27:40', NULL, NULL),
(665, 'G-54b4fc6b80ed', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2024-01-25 03:28:43', NULL, NULL),
(666, 'L-2ff0fa2ade75', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, AVG(page_load_time) AS avg_page_load_time FROM `traffic` WHERE created_at >= UNIX_TIMESTAMP(CURDATE() - INTERVAL 30 DAY) AND created_at < UNIX_TIMESTAMP(CURDATE())  GROUP BY visit_date  ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2024-01-25 03:28:43', NULL, NULL),
(667, 'G-7309352ff93b', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2024-01-25 03:28:43', NULL, NULL),
(668, 'L-52732982714e', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, COUNT(uid) AS daily_visitors FROM `visitors` WHERE created_at >= UNIX_TIMESTAMP(CURDATE() - INTERVAL 30 DAY) AND created_at < UNIX_TIMESTAMP(CURDATE())  GROUP BY visit_date  ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2024-01-25 03:28:43', NULL, NULL),
(669, 'G-1e2321a9c5ef', 1, 'history', 'fails', 'We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.', NULL, NULL, '2024-01-25 03:31:27', NULL, NULL),
(670, 'L-e68b8dde9041', 1, 'log', 'fails', 'Query preparation failed: {\"queryString\":\"SELECT DATE(created_at) AS visit_date, COUNT(uid) AS daily_visitors FROM `visitors` WHERE created_at >= CURDATE() - INTERVAL 30 DAY AND created_at < CURDATE()  GROUP BY visit_date  ORDER BY visit_date DESC\"}', 'jjrUbFpPCKOmxg', '500', '2024-01-25 03:31:27', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `traffic`
--

CREATE TABLE `traffic` (
  `uid` int(11) NOT NULL,
  `guide` char(14) NOT NULL,
  `visitor_id` int(11) NOT NULL,
  `registered_id` int(11) DEFAULT NULL,
  `page_url` char(255) DEFAULT NULL,
  `page_load_time` char(255) DEFAULT NULL,
  `queries` char(255) DEFAULT NULL,
  `response` char(255) DEFAULT '1',
  `reloaded` int(5) DEFAULT '0',
  `type` char(33) DEFAULT 'client',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `traffic`
--

INSERT INTO `traffic` (`uid`, `guide`, `visitor_id`, `registered_id`, `page_url`, `page_load_time`, `queries`, `response`, `reloaded`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'T-ffbfe48702b0', 1, 1, '/home', '66.46', NULL, '1', 0, 'client', '2023-12-06 03:12:51', '2023-12-06 04:51:00', NULL),
(2, 'T-badb5c1dcfc6', 2, 1, '/dashboard/logs?current=2&count=50', '20.92', '{\"current\":\"2\",\"count\":\"50\"}', '1', 0, 'client', '2023-12-06 03:12:53', '2023-12-06 04:53:00', NULL),
(3, 'T-bbcf52df8143', 3, 1, '/dashboard', '552.51', NULL, '1', 153, 'client', '2023-12-06 03:12:54', '2023-12-24 06:10:00', NULL),
(4, 'T-b6c59a013b9a', 4, 1, '/dashboard/users', '24.67', NULL, '1', 0, 'client', '2024-01-17 03:12:55', '2023-12-06 04:55:00', NULL),
(5, 'T-02d264c8e589', 5, 1, '/dashboard/traffic', '18.61', NULL, '1', 7, 'client', '2023-12-06 03:12:56', '2023-12-06 06:52:00', NULL),
(6, 'T-a3095a640476', 7, 1, '/dashboard/offers', '26.56', NULL, '1', 1, 'client', '2023-12-06 03:14:04', '2023-12-06 04:04:00', NULL),
(7, 'T-abc3b64fe211', 10, 1, '/dashboard/projects', '18.47', NULL, '1', 3, 'client', '2023-12-06 03:17:55', '2023-12-06 04:24:00', NULL),
(8, 'T-86d1ec946a27', 11, 1, '/products/preview/A-d890771864c3-erwtertwer', '31.62', NULL, '1', 5, 'client', '2023-12-06 03:17:57', '2023-12-06 05:06:00', NULL),
(9, 'T-8bbdf4e3d4ab', 21, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-06 03:44:11', '2023-12-21 06:00:00', NULL),
(10, 'T-9dfffbcb4881', 22, NULL, '/policy', '6.81', NULL, '1', 4, 'client', '2024-01-17 03:57:19', '2023-12-06 06:45:00', NULL),
(11, 'T-08eaa09b9561', 24, 1, '/blog', '49.88', NULL, '1', 1, 'client', '2023-12-06 04:12:36', '2023-12-09 04:00:00', NULL),
(12, 'T-8153a15892d7', 30, 1, '/websites', '33.79', NULL, '1', 1, 'client', '2023-12-06 04:17:55', '2023-12-06 05:59:00', NULL),
(13, 'T-924b6868009a', 22, NULL, '/documentation', '6.10', NULL, '1', 0, 'bot', '2023-12-06 04:18:03', '2023-12-06 05:03:00', NULL),
(14, 'T-aec04c531670', 32, 1, '/products', '34.13', NULL, '1', 2, 'client', '2023-12-06 04:18:03', '2023-12-06 05:40:00', NULL),
(15, 'T-002c8597f512', 35, 1, '/products/preview/A-a8baf0195607-NFCcards-ornear-fieldcommunicationcards', '28.55', NULL, '1', 1, 'client', '2023-12-06 04:19:49', '2023-12-06 05:53:00', NULL),
(16, 'T-f8b8271a3245', 39, 1, '/blog/preview/A-0d14858f19da-VersatileLanguageforDevelopers', '28.08', NULL, '1', 0, 'client', '2023-12-06 04:20:50', '2023-12-06 05:50:00', NULL),
(17, 'T-b87d7bc289f5', 22, NULL, '/services', '5.64', NULL, '1', 3, 'client', '2023-12-06 04:34:19', '2023-12-15 10:29:00', NULL),
(18, 'T-b80cdd3e7d74', 22, NULL, '/impression', '6.16', NULL, '1', 0, 'bot', '2023-12-06 05:11:12', '2023-12-06 06:12:00', NULL),
(19, 'T-5e775cbb2541', 49, NULL, '/login', '10.00', NULL, '1', 0, 'client', '2023-12-06 05:19:45', '2023-12-06 06:45:00', NULL),
(20, 'T-b622722c0a03', 50, 1, '/profile', '28.89', NULL, '1', 0, 'client', '2023-12-06 05:19:50', '2023-12-06 06:50:00', NULL),
(21, 'T-5d07aa50268d', 52, 1, '/dashboard/traffic', '21.33', NULL, '1', 0, 'client', '2023-12-06 05:22:40', '2023-12-06 06:40:00', NULL),
(22, 'T-ad5a858f0b53', 22, NULL, '/products/preview/A-d890771864c3-erwtertwer', '29.44', NULL, '1', 0, 'bot', '2023-12-06 05:22:45', '2023-12-06 06:45:00', NULL),
(23, 'T-dc75d51a77f5', 53, 1, '/home', '57.46', NULL, '1', 0, 'client', '2023-12-06 05:22:59', '2023-12-06 06:59:00', NULL),
(24, 'T-1cf149623891', 54, 1, '/documentation', '13.20', NULL, '1', 0, 'client', '2023-12-06 05:23:05', '2023-12-06 06:05:00', NULL),
(25, 'T-3947c2eb9155', 55, 1, '/dashboard', '552.51', NULL, '1', 153, 'client', '2023-12-06 05:23:08', '2023-12-24 06:10:00', NULL),
(26, 'T-497d339da19e', 56, 1, '/dashboard/traffic', '18.42', NULL, '1', 0, 'client', '2023-12-06 05:23:11', '2023-12-06 06:11:00', NULL),
(27, 'T-e90db6186b51', 22, NULL, '/qanda', '6.22', NULL, '1', 0, 'bot', '2023-12-06 05:24:10', '2023-12-06 06:10:00', NULL),
(28, 'T-cc1c554bc1a8', 57, 1, '/dashboard/traffic', '19.25', NULL, '1', 0, 'client', '2023-12-06 05:25:51', '2023-12-06 06:51:00', NULL),
(29, 'T-9a788d8e6c89', 58, 1, '/dashboard/traffic', '17.82', NULL, '1', 0, 'client', '2023-12-06 05:25:57', '2023-12-06 06:57:00', NULL),
(30, 'T-66dd362c313a', 59, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-06 05:26:03', '2023-12-21 06:00:00', NULL),
(31, 'T-1db6cbfe6c69', 60, 1, '/dashboard', '552.51', NULL, '1', 153, 'client', '2023-12-06 05:26:14', '2023-12-24 06:10:00', NULL),
(32, 'T-5fab8d041132', 61, 1, '/dashboard/traffic', '19.44', NULL, '1', 0, 'client', '2023-12-06 05:26:16', '2023-12-06 06:16:00', NULL),
(33, 'T-0075a3323c4d', 62, 1, '/dashboard', '552.51', NULL, '1', 153, 'client', '2023-12-06 05:40:08', '2023-12-24 06:10:00', NULL),
(34, 'T-e4029c6bc8eb', 63, 1, '/dashboard/traffic', '22.33', NULL, '1', 0, 'client', '2023-12-06 05:40:15', '2023-12-06 06:15:00', NULL),
(35, 'T-3748a1a62606', 64, NULL, '/login', '8.23', NULL, '1', 0, 'client', '2023-12-06 05:40:33', '2023-12-06 06:33:00', NULL),
(36, 'T-ab9abfe5d292', 65, NULL, '/login', '5.97', NULL, '1', 0, 'client', '2023-12-06 05:40:34', '2023-12-06 06:34:00', NULL),
(37, 'T-697500969929', 64, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-06 05:40:36', '2023-12-19 01:03:00', NULL),
(38, 'T-33c70c6c083e', 66, NULL, '/login', '7.94', NULL, '1', 0, 'client', '2023-12-06 05:40:38', '2023-12-06 06:38:00', NULL),
(39, 'T-bcb4a1488d94', 67, NULL, '/login', '6.60', NULL, '1', 0, 'client', '2023-12-06 05:40:40', '2023-12-06 06:40:00', NULL),
(40, 'T-889c5aaa2e2b', 68, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-06 05:41:33', '2023-12-21 06:00:00', NULL),
(41, 'T-3bab1d2d6ced', 69, 1, '/websites', '39.84', NULL, '1', 0, 'client', '2023-12-06 05:41:36', '2023-12-06 06:36:00', NULL),
(42, 'T-e79edfb11c83', 70, 1, '/websites/preview/A-da257de2c949-PowerfulandVersatileLanguageforWebDevelopment', '34.18', NULL, '1', 0, 'client', '2023-12-06 05:41:38', '2023-12-06 06:38:00', NULL),
(43, 'T-5611dfe8b6bc', 71, NULL, '/websites/preview/A-da257de2c949-PowerfulandVersatileLanguageforWebDevelopment', '30.07', NULL, '1', 0, 'client', '2023-12-06 05:41:44', '2023-12-06 06:44:00', NULL),
(44, 'T-d24b8d43ba88', 72, NULL, '/websites/preview/A-da257de2c949-PowerfulandVersatileLanguageforWebDevelopment', '28.45', NULL, '1', 0, 'client', '2023-12-06 05:41:45', '2023-12-06 06:45:00', NULL),
(45, 'T-3060211fddd9', 73, NULL, '/websites/preview/A-da257de2c949-PowerfulandVersatileLanguageforWebDevelopment', '26.89', NULL, '1', 0, 'client', '2023-12-06 05:41:48', '2023-12-06 06:48:00', NULL),
(46, 'T-7b75e7487d37', 74, NULL, '/websites/preview/A-da257de2c949-PowerfulandVersatileLanguageforWebDevelopment', '29.42', NULL, '1', 0, 'client', '2023-12-06 05:41:48', '2023-12-06 06:48:00', NULL),
(47, 'T-0cd73f4b4cc9', 75, NULL, '/websites/preview/A-da257de2c949-PowerfulandVersatileLanguageforWebDevelopment', '27.89', NULL, '1', 0, 'client', '2023-12-06 05:41:54', '2023-12-06 06:54:00', NULL),
(48, 'T-3f09422ca858', 76, NULL, '/websites/preview/A-da257de2c949-PowerfulandVersatileLanguageforWebDevelopment', '23.64', NULL, '1', 0, 'client', '2023-12-06 05:41:55', '2023-12-06 06:55:00', NULL),
(49, 'T-d48037bf94ec', 77, 1, '/dashboard/traffic', '34.23', NULL, '1', 0, 'client', '2023-12-06 05:44:02', '2023-12-06 06:02:00', NULL),
(50, 'T-9b48f2c6bbe7', 78, 1, '/dashboard/traffic', '23.57', NULL, '1', 0, 'client', '2023-12-06 05:46:02', '2023-12-06 06:02:00', NULL),
(51, 'T-5846597a0881', 79, 1, '/dashboard/traffic', '23.94', NULL, '1', 0, 'client', '2023-12-06 05:47:05', '2023-12-06 06:05:00', NULL),
(52, 'T-c28f09a79d84', 80, 1, '/dashboard/traffic', '21.70', NULL, '1', 0, 'client', '2023-12-06 05:47:50', '2023-12-06 06:50:00', NULL),
(53, 'T-8387087fe368', 81, 1, '/dashboard/traffic?current=2&count=50', '20.53', '{\"current\":\"2\",\"count\":\"50\"}', '1', 0, 'client', '2023-12-06 05:47:56', '2023-12-06 06:56:00', NULL),
(54, 'T-ff45149f1cb4', 82, 1, '/dashboard/traffic?current=1&count=50', '20.60', '{\"current\":\"1\",\"count\":\"50\"}', '1', 0, 'client', '2023-12-06 05:48:01', '2023-12-06 06:01:00', NULL),
(55, 'T-0344d0c2930d', 83, 1, '/dashboard/traffic?current=2&count=50', '19.19', '{\"current\":\"2\",\"count\":\"50\"}', '1', 0, 'client', '2023-12-06 05:50:08', '2023-12-06 06:08:00', NULL),
(56, 'T-b7e3afaf3744', 84, 1, '/dashboard/traffic?current=1&count=50', '19.70', '{\"current\":\"1\",\"count\":\"50\"}', '1', 0, 'client', '2023-12-06 05:50:13', '2023-12-06 06:13:00', NULL),
(57, 'T-732e71e8d87e', 85, 1, '/dashboard/traffic?current=1&count=50', '23.20', '{\"current\":\"1\",\"count\":\"50\"}', '1', 0, 'client', '2023-12-06 05:50:42', '2023-12-06 06:42:00', NULL),
(58, 'T-4d98628cdd14', 86, 1, '/dashboard/traffic?current=1&count=50', '36.12', '{\"current\":\"1\",\"count\":\"50\"}', '1', 0, 'client', '2023-12-06 05:52:27', '2023-12-06 06:27:00', NULL),
(59, 'T-816fd48063a6', 87, 1, '/dashboard/traffic?current=2&count=50', '20.65', '{\"current\":\"2\",\"count\":\"50\"}', '1', 0, 'client', '2023-12-06 05:52:48', '2023-12-06 06:48:00', NULL),
(60, 'T-9aacfb2916d2', 88, 1, '/dashboard/traffic?current=1&count=50', '21.06', '{\"current\":\"1\",\"count\":\"50\"}', '1', 0, 'client', '2023-12-06 05:52:57', '2023-12-06 06:57:00', NULL),
(61, 'T-d37627e7285c', 89, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-06 05:55:17', '2023-12-21 06:00:00', NULL),
(62, 'T-b841f8a346c0', 90, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-06 05:56:31', '2023-12-21 06:00:00', NULL),
(63, 'T-03540138bc92', 91, 1, '/impression', '11.95', NULL, '1', 0, 'client', '2023-12-06 05:56:33', '2023-12-06 06:33:00', NULL),
(64, 'T-838aa03e95a9', 92, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-06 05:58:15', '2023-12-21 06:00:00', NULL),
(65, 'T-e0f011437039', 93, 1, '/blog', '49.88', NULL, '1', 1, 'client', '2023-12-06 05:58:18', '2023-12-09 04:00:00', NULL),
(66, 'T-16f55abbb200', 94, 1, '/blog/preview/A-0d14858f19da-VersatileLanguageforDevelopers', '30.29', NULL, '1', 0, 'client', '2023-12-06 05:58:20', '2023-12-06 06:20:00', NULL),
(67, 'T-25af524eae3f', 95, 1, '/tags?search=PHP', '26.05', '{\"search\":\"PHP\"}', '1', 0, 'client', '2023-12-06 05:59:45', '2023-12-06 06:45:00', NULL),
(68, 'T-8b0caa3788dd', 96, 1, '/dashboard', '552.51', NULL, '1', 153, 'client', '2023-12-06 06:00:25', '2023-12-24 06:10:00', NULL),
(69, 'T-cea833bd76a0', 97, 1, '/dashboard/offers', '16.71', NULL, '1', 0, 'client', '2023-12-06 06:00:27', '2023-12-06 07:27:00', NULL),
(70, 'T-4711025f52c3', 22, NULL, '/websites/preview/A-36cdf725e31e-IDEA-IntegratedDevelopmentEnvironmentforAutomation', '44.82', NULL, '1', 0, 'bot', '2023-12-06 06:59:09', '2023-12-06 07:09:00', NULL),
(71, 'T-f69ad68806a8', 22, NULL, '/websites/preview/A-bef60b9d5d68-UnveilingtheInnovationsShapingOurFuture', '27.18', NULL, '1', 0, 'bot', '2023-12-06 07:03:45', '2023-12-06 08:45:00', NULL),
(72, 'T-2956a905bc16', 22, NULL, '/help', '23.88', NULL, '1', 0, 'bot', '2023-12-06 07:34:33', '2023-12-06 08:33:00', NULL),
(73, 'T-66bbe8d75d01', 98, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-06 07:49:29', '2023-12-21 06:00:00', NULL),
(74, 'T-7be123af5e1a', 99, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-06 07:52:52', '2023-12-21 06:00:00', NULL),
(75, 'T-579c0e3a29aa', 22, NULL, '/websites/preview/A-da257de2c949-PowerfulandVersatileLanguageforWebDevelopment', '208.92', NULL, '1', 0, 'bot', '2023-12-06 08:43:48', '2023-12-06 09:48:00', NULL),
(76, 'T-c8f826b6dd84', 100, NULL, '/documentation', '67.51', NULL, '1', 0, 'client', '2023-12-06 09:41:47', '2023-12-06 10:47:00', NULL),
(77, 'T-556659442345', 101, NULL, '/login', '9.99', NULL, '1', 0, 'client', '2023-12-06 09:44:50', '2023-12-06 10:50:00', NULL),
(78, 'T-de631803e776', 102, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-06 09:45:00', '2023-12-21 06:00:00', NULL),
(79, 'T-cc1f25ed35c1', 103, 1, '/dashboard', '552.51', NULL, '1', 153, 'client', '2023-12-06 09:45:03', '2023-12-24 06:10:00', NULL),
(80, 'T-2ed2714cb544', 104, 1, '/dashboard/traffic', '28.03', NULL, '1', 0, 'client', '2023-12-06 09:45:07', '2023-12-06 10:07:00', NULL),
(81, 'T-caa049b8605e', 105, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-06 09:52:14', '2023-12-21 06:00:00', NULL),
(82, 'T-3bba4aa61b5d', 106, NULL, '/policy', '6.80', NULL, '1', 0, 'client', '2023-12-06 09:52:25', '2023-12-06 10:25:00', NULL),
(83, 'T-7cfc84659a75', 107, NULL, '/impression', '6.07', NULL, '1', 0, 'client', '2023-12-06 09:52:35', '2023-12-06 10:35:00', NULL),
(84, 'T-060cc0f5a20d', 108, NULL, '/policy', '6.12', NULL, '1', 0, 'client', '2023-12-06 09:52:42', '2023-12-06 10:42:00', NULL),
(85, 'T-64faa4ac9ac5', 109, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-06 09:52:46', '2023-12-21 06:00:00', NULL),
(86, 'T-036ca53b357e', 110, NULL, '/websites', '44.33', NULL, '1', 0, 'client', '2023-12-06 09:52:53', '2023-12-06 10:53:00', NULL),
(87, 'T-2c478cb4a846', 111, NULL, '/websites/preview/A-bef60b9d5d68-UnveilingtheInnovationsShapingOurFuture', '33.87', NULL, '1', 0, 'client', '2023-12-06 09:52:55', '2023-12-06 10:55:00', NULL),
(88, 'T-0c473eef9d50', 112, NULL, '/websites', '35.22', NULL, '1', 0, 'client', '2023-12-06 09:53:00', '2023-12-06 10:00:00', NULL),
(89, 'T-1f4d8783e118', 113, NULL, '/websites/preview/A-da257de2c949-PowerfulandVersatileLanguageforWebDevelopment', '31.75', NULL, '1', 0, 'client', '2023-12-06 09:53:02', '2023-12-06 10:02:00', NULL),
(90, 'T-0a61704e2e1c', 114, NULL, '/websites', '35.76', NULL, '1', 0, 'client', '2023-12-06 09:53:06', '2023-12-06 10:06:00', NULL),
(91, 'T-f1deb4eb7333', 115, NULL, '/blog', '49.88', NULL, '1', 1, 'client', '2023-12-06 09:53:10', '2023-12-09 04:00:00', NULL),
(92, 'T-1860fc16163b', 116, NULL, '/blog/preview/A-294f7301084f-IntroducingtheQualityControlAI', '27.60', NULL, '1', 0, 'client', '2023-12-06 09:53:12', '2023-12-06 10:12:00', NULL),
(93, 'T-bf50c6978fe8', 117, NULL, '/blog', '49.88', NULL, '1', 1, 'client', '2023-12-06 09:53:17', '2023-12-09 04:00:00', NULL),
(94, 'T-53bcdf198420', 118, NULL, '/blog/preview/A-4ffa60cc3a06-Thisisjustaroughestimate', '27.44', NULL, '1', 0, 'client', '2023-12-06 09:53:22', '2023-12-06 10:22:00', NULL),
(95, 'T-87eece2c19bc', 119, NULL, '/blog', '49.88', NULL, '1', 1, 'client', '2023-12-06 09:53:25', '2023-12-09 04:00:00', NULL),
(96, 'T-8fd11fcfd60f', 120, NULL, '/websites', '33.97', NULL, '1', 0, 'client', '2023-12-06 09:53:27', '2023-12-06 10:27:00', NULL),
(97, 'T-102fa3407cc3', 121, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-06 09:53:35', '2023-12-21 06:00:00', NULL),
(98, 'T-f8ec4cb45e09', 122, NULL, '/blog', '49.88', NULL, '1', 1, 'client', '2023-12-06 09:53:59', '2023-12-09 04:00:00', NULL),
(99, 'T-b95f4bad92ae', 123, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-06 09:54:04', '2023-12-19 01:03:00', NULL),
(100, 'T-87320c07a6cf', 124, NULL, '/blog', '49.88', NULL, '1', 1, 'client', '2023-12-06 09:54:30', '2023-12-09 04:00:00', NULL),
(101, 'T-bf345a8ffbb1', 125, NULL, '/services', '5.64', NULL, '1', 3, 'client', '2023-12-06 09:54:43', '2023-12-15 10:29:00', NULL),
(102, 'T-e2d945f9ae91', 126, NULL, '/blog', '49.88', NULL, '1', 1, 'client', '2023-12-06 09:55:02', '2023-12-09 04:00:00', NULL),
(103, 'T-ae059d98e860', 127, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-06 13:08:12', '2023-12-21 06:00:00', NULL),
(104, 'T-ebf9008907b0', 128, 1, '/dashboard/traffic', '65.80', NULL, '1', 0, 'client', '2023-12-06 18:06:35', '2023-12-06 07:35:00', NULL),
(105, 'T-b18a565afbc7', 129, 1, '/dashboard/traffic?current=2&count=50', '20.56', '{\"current\":\"2\",\"count\":\"50\"}', '1', 0, 'client', '2023-12-06 18:06:41', '2023-12-06 07:41:00', NULL),
(106, 'T-67e3ad366608', 130, 1, '/dashboard/traffic', '20.11', NULL, '1', 0, 'client', '2023-12-06 18:06:52', '2023-12-06 07:52:00', NULL),
(107, 'T-909d4db48c83', 131, 1, '/home', '75.28', NULL, '1', 0, 'client', '2023-12-06 18:08:55', '2023-12-06 07:54:00', NULL),
(108, 'T-adb832e936b0', 132, 1, '/websites', '43.31', NULL, '1', 0, 'client', '2023-12-06 18:09:01', '2023-12-06 07:01:00', NULL),
(109, 'T-df18a6baba2e', 133, 1, '/websites/preview/A-da257de2c949-PowerfulandVersatileLanguageforWebDevelopment', '43.38', NULL, '1', 0, 'client', '2023-12-06 18:09:02', '2023-12-06 07:02:00', NULL),
(110, 'T-d24675be8cd5', 134, 1, '/websites', '39.52', NULL, '1', 0, 'client', '2023-12-06 18:09:06', '2023-12-06 07:06:00', NULL),
(111, 'T-074e207a43f1', 135, 1, '/websites/preview/A-bef60b9d5d68-UnveilingtheInnovationsShapingOurFuture', '31.43', NULL, '1', 0, 'client', '2023-12-06 18:09:07', '2023-12-06 07:07:00', NULL),
(112, 'T-bd8f7ad67bca', 136, 1, '/websites', '38.47', NULL, '1', 0, 'client', '2023-12-06 18:09:12', '2023-12-06 07:12:00', NULL),
(113, 'T-69368ad4192a', 137, 1, '/websites/preview/A-36cdf725e31e-IDEA-IntegratedDevelopmentEnvironmentforAutomation', '30.31', NULL, '1', 0, 'client', '2023-12-06 18:09:14', '2023-12-06 07:14:00', NULL),
(114, 'T-74c233108707', 138, 1, '/websites/preview/A-36cdf725e31e-IDEA-IntegratedDevelopmentEnvironmentforAutomation', '35.45', NULL, '1', 0, 'client', '2023-12-06 18:12:55', '2023-12-06 07:55:00', NULL),
(115, 'T-bcc43a94b15f', 139, 1, '/websites/preview/A-36cdf725e31e-IDEA-IntegratedDevelopmentEnvironmentforAutomation', '30.76', NULL, '1', 0, 'client', '2023-12-06 18:12:58', '2023-12-06 07:58:00', NULL),
(116, 'T-0d4eef8400e5', 140, 1, '/websites/preview/A-36cdf725e31e-IDEA-IntegratedDevelopmentEnvironmentforAutomation', '35.77', NULL, '1', 0, 'client', '2023-12-06 18:13:57', '2023-12-06 07:57:00', NULL),
(117, 'T-093fef259e90', 141, 1, '/websites/preview/A-36cdf725e31e-IDEA-IntegratedDevelopmentEnvironmentforAutomation', '36.35', NULL, '1', 0, 'client', '2023-12-06 18:18:03', '2023-12-06 07:03:00', NULL),
(118, 'T-9e8ab7a952ad', 142, 1, '/websites/preview/A-36cdf725e31e-IDEA-IntegratedDevelopmentEnvironmentforAutomation', '31.09', NULL, '1', 0, 'client', '2023-12-06 18:18:07', '2023-12-06 07:07:00', NULL),
(119, 'T-65e417760032', 143, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-06 18:20:53', '2023-12-21 06:00:00', NULL),
(120, 'T-e4e015127ed7', 144, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-07 00:38:05', '2023-12-21 06:00:00', NULL),
(121, 'T-278132448efc', 145, 1, '/dashboard', '552.51', NULL, '1', 153, 'client', '2023-12-07 00:38:07', '2023-12-24 06:10:00', NULL),
(122, 'T-7197900f47c5', 146, 1, '/dashboard/traffic', '23.15', NULL, '1', 0, 'client', '2023-12-07 00:38:14', '2023-12-07 01:14:00', NULL),
(123, 'T-abe1a90bd6ab', 147, 1, '/documentation', '17.55', NULL, '1', 0, 'client', '2023-12-07 00:38:27', '2023-12-07 01:27:00', NULL),
(124, 'T-663ff3ecfd7e', 148, 1, '/documentation', '10.22', NULL, '1', 0, 'client', '2023-12-07 00:38:35', '2023-12-07 01:35:00', NULL),
(125, 'T-88b8d514530d', 149, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-07 06:19:51', '2023-12-21 06:00:00', NULL),
(126, 'T-53923a60437d', 150, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-07 07:03:14', '2023-12-21 06:00:00', NULL),
(127, 'T-2d9fd59b771e', 151, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-07 07:28:24', '2023-12-21 06:00:00', NULL),
(128, 'T-01ad498e81d1', 152, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-07 14:19:11', '2023-12-21 06:00:00', NULL),
(129, 'T-da222e3bd227', 153, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-07 14:19:57', '2023-12-21 06:00:00', NULL),
(130, 'T-7b42b3f6876b', 154, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-07 14:20:15', '2023-12-21 06:00:00', NULL),
(131, 'T-fba3976f4be4', 155, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-07 14:20:47', '2023-12-21 06:00:00', NULL),
(132, 'T-140bba339f7c', 156, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-07 14:45:31', '2023-12-21 06:00:00', NULL),
(133, 'T-5986e696a1fd', 157, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-07 18:12:16', '2023-12-21 06:00:00', NULL),
(134, 'T-d6a99e9a1b85', 158, NULL, '/?of=1', '141.37', '{\"of\":\"1\"}', '1', 0, 'client', '2023-12-07 22:19:12', '2023-12-07 11:12:00', NULL),
(135, 'T-a00cddaf2ee9', 159, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-08 08:38:44', '2023-12-21 06:00:00', NULL),
(136, 'T-2854d7a49474', 160, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-08 08:50:37', '2023-12-21 06:00:00', NULL),
(137, 'T-35eadcbca596', 161, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-08 09:19:16', '2023-12-21 06:00:00', NULL),
(138, 'T-20910daee421', 162, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-08 17:23:52', '2023-12-21 06:00:00', NULL),
(139, 'T-bcbfeeefb3ea', 163, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-08 17:44:41', '2023-12-21 06:00:00', NULL),
(140, 'T-28df86238ed5', 164, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-08 23:19:00', '2023-12-21 06:00:00', NULL),
(141, 'T-0a6dbdaa84a9', 165, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-09 01:46:48', '2023-12-21 06:00:00', NULL),
(142, 'T-c13738eaefcf', 166, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-09 01:46:56', '2023-12-21 06:00:00', NULL),
(143, 'T-d5900caa3dbe', 167, NULL, '/policy', '22.40', NULL, '1', 0, 'client', '2023-12-09 01:47:02', '2023-12-09 02:02:00', NULL),
(144, 'T-3c74673a1826', 168, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-09 01:47:20', '2023-12-21 06:00:00', NULL),
(145, 'T-15c0c1ea9c95', 169, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-09 01:47:35', '2023-12-21 06:00:00', NULL),
(146, 'T-f675f3034568', 170, NULL, '/login', '7.44', NULL, '1', 0, 'client', '2023-12-09 01:47:40', '2023-12-09 02:40:00', NULL),
(147, 'T-05222b8bc53e', 171, 1, '/profile', '73.00', NULL, '1', 0, 'client', '2023-12-09 01:47:49', '2023-12-09 02:49:00', NULL),
(148, 'T-9d92bd8f7808', 172, 1, '/dashboard/traffic', '22.53', NULL, '1', 0, 'client', '2023-12-09 01:48:19', '2023-12-09 02:19:00', NULL),
(149, 'T-d7f4c310a830', 173, 1, '/profile', '13.48', NULL, '1', 0, 'client', '2023-12-09 01:51:49', '2023-12-09 02:49:00', NULL),
(150, 'T-a22ab5fd3758', 174, 1, '/dashboard', '552.51', NULL, '1', 153, 'client', '2023-12-09 01:51:52', '2023-12-24 06:10:00', NULL),
(151, 'T-460530aa958a', 175, NULL, '/login', '6.17', NULL, '1', 0, 'client', '2023-12-09 01:51:56', '2023-12-09 02:56:00', NULL),
(152, 'T-11e073940956', 176, 1, '/profile', '16.88', NULL, '1', 0, 'client', '2023-12-09 01:52:01', '2023-12-09 02:01:00', NULL),
(153, 'T-d062e4d55c1c', 177, 1, '/dashboard', '552.51', NULL, '1', 153, 'client', '2023-12-09 01:52:06', '2023-12-24 06:10:00', NULL),
(154, 'T-77ba078075c1', 178, 1, '/dashboard', '552.51', NULL, '1', 153, 'client', '2023-12-09 01:52:08', '2023-12-24 06:10:00', NULL),
(155, 'T-dd6b1b73e14d', 179, 1, '/dashboard', '552.51', NULL, '1', 153, 'client', '2023-12-09 01:52:28', '2023-12-24 06:10:00', NULL),
(156, 'T-94766becc51c', 180, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-09 08:36:34', '2023-12-21 06:00:00', NULL),
(157, 'T-25269323c7e2', 181, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-09 12:21:23', '2023-12-21 06:00:00', NULL),
(158, 'T-a7e5af297180', 182, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-09 14:25:56', '2023-12-21 06:00:00', NULL),
(159, 'T-b1af08d30b84', 183, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-09 14:44:37', '2023-12-21 06:00:00', NULL),
(160, 'T-ac5b0a9f40b1', 184, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-09 15:06:30', '2023-12-21 06:00:00', NULL),
(161, 'T-19c2a443c286', 185, NULL, '/blog', '49.88', NULL, '1', 1, 'client', '2023-12-09 15:06:43', '2023-12-09 04:00:00', NULL),
(162, 'T-3854d92d0f85', 185, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-09 15:06:45', '2023-12-19 01:03:00', NULL),
(163, 'T-5bf2e0807cbd', 186, 1, '/dashboard', '552.51', NULL, '1', 153, 'client', '2023-12-09 15:14:13', '2023-12-24 06:10:00', NULL),
(164, 'T-a7c3170bd16b', 186, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-09 15:14:18', '2023-12-21 06:00:00', NULL),
(165, 'T-2c3ce89ec835', 186, 1, '/dashboard/mailbox', '15.86', NULL, '1', 0, 'client', '2023-12-09 15:15:18', '2023-12-09 04:18:00', NULL),
(166, 'T-4f4f003ed8ff', 187, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-09 16:38:03', '2023-12-21 06:00:00', NULL),
(167, 'T-694fec3aab46', 188, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-10 01:06:08', '2023-12-21 06:00:00', NULL),
(168, 'T-447f65e0ffa2', 189, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-10 10:10:01', '2023-12-21 06:00:00', NULL),
(169, 'T-c536b94ba520', 190, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-10 10:10:20', '2023-12-21 06:00:00', NULL),
(170, 'T-ec6acb79cbb3', 191, NULL, '/products', '69.67', NULL, '1', 0, 'bot', '2023-12-10 10:45:37', '2023-12-10 11:37:00', NULL),
(171, 'T-77c9de924a6a', 191, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-10 10:45:38', '2023-12-19 01:03:00', NULL),
(172, 'T-7f236dd909d7', 191, NULL, '/websites', '31.03', NULL, '1', 0, 'bot', '2023-12-10 10:45:38', '2023-12-10 11:38:00', NULL),
(173, 'T-d88693d8c635', 191, NULL, '/products/preview/A-a8baf0195607-NFCcards-ornear-fieldcommunicationcards', '30.08', NULL, '1', 0, 'bot', '2023-12-10 10:45:38', '2023-12-10 11:38:00', NULL),
(174, 'T-2b1e8bda71c8', 191, NULL, '/policy', '4.94', NULL, '1', 0, 'bot', '2023-12-10 10:45:38', '2023-12-10 11:38:00', NULL),
(175, 'T-774ee7fbfaba', 191, NULL, '/documentation', '8.11', NULL, '1', 0, 'bot', '2023-12-10 10:45:39', '2023-12-10 11:39:00', NULL),
(176, 'T-1cf1b7369e0d', 191, NULL, '/services', '5.64', NULL, '1', 3, 'client', '2023-12-10 10:45:39', '2023-12-15 10:29:00', NULL),
(177, 'T-75bd8234c667', 191, NULL, '/impression', '5.03', NULL, '1', 0, 'bot', '2023-12-10 10:45:39', '2023-12-10 11:39:00', NULL),
(178, 'T-1fed1f216c55', 191, NULL, '/products/preview/A-d890771864c3-erwtertwer', '23.56', NULL, '1', 0, 'bot', '2023-12-10 10:45:40', '2023-12-10 11:40:00', NULL),
(179, 'T-1ee6c539f46c', 191, NULL, '/qanda', '5.59', NULL, '1', 0, 'bot', '2023-12-10 10:45:40', '2023-12-10 11:40:00', NULL),
(180, 'T-5279c11d707d', 191, NULL, '/websites/preview/A-36cdf725e31e-IDEA-IntegratedDevelopmentEnvironmentforAutomation', '24.93', NULL, '1', 0, 'bot', '2023-12-10 10:45:40', '2023-12-10 11:40:00', NULL),
(181, 'T-dfdee1a11e7b', 191, NULL, '/websites/preview/A-bef60b9d5d68-UnveilingtheInnovationsShapingOurFuture', '24.12', NULL, '1', 0, 'bot', '2023-12-10 10:45:41', '2023-12-10 11:41:00', NULL),
(182, 'T-37c07d7dcf15', 191, NULL, '/help', '5.71', NULL, '1', 0, 'bot', '2023-12-10 10:45:41', '2023-12-10 11:41:00', NULL),
(183, 'T-9fd56b117107', 191, NULL, '/websites/preview/A-da257de2c949-PowerfulandVersatileLanguageforWebDevelopment', '25.73', NULL, '1', 0, 'bot', '2023-12-10 10:45:41', '2023-12-10 11:41:00', NULL),
(184, 'T-ff466c74a2dc', 192, 1, '/dashboard/mailbox', '148.25', NULL, '1', 0, 'client', '2023-12-10 11:59:37', '2023-12-10 12:37:00', NULL),
(185, 'T-d42e0fa0a371', 193, NULL, '/tags?search=Society', '28.72', '{\"search\":\"Society\"}', '1', 0, 'bot', '2023-12-10 12:25:50', '2023-12-10 01:50:00', NULL),
(186, 'T-a0bb00cd7030', 193, NULL, '/tags?search=easy%20to%20use', '15.08', '{\"search\":\"easy to use\"}', '1', 0, 'bot', '2023-12-10 12:25:51', '2023-12-10 01:51:00', NULL),
(187, 'T-a4ea04070045', 193, NULL, '/tags?search=Future', '23.97', '{\"search\":\"Future\"}', '1', 0, 'bot', '2023-12-10 12:25:54', '2023-12-10 01:54:00', NULL),
(188, 'T-6d25df034758', 193, NULL, '/categories?search==Python', '16.58', '{\"search\":\"=Python\"}', '1', 0, 'bot', '2023-12-10 12:25:54', '2023-12-10 01:54:00', NULL),
(189, 'T-0dec026c385e', 193, NULL, '/tags?search=Virtual%20reality%20(VR)', '14.32', '{\"search\":\"Virtual reality (VR)\"}', '1', 0, 'bot', '2023-12-10 12:25:55', '2023-12-10 01:55:00', NULL),
(190, 'T-25ca41c31ebe', 193, NULL, '/tags?search=open%20source', '14.58', '{\"search\":\"open source\"}', '1', 0, 'bot', '2023-12-10 12:25:55', '2023-12-10 01:55:00', NULL),
(191, 'T-a3c503bff32b', 193, NULL, '/categories?search==wertwertwertwt', '13.62', '{\"search\":\"=wertwertwertwt\"}', '1', 0, 'bot', '2023-12-10 12:25:56', '2023-12-10 01:56:00', NULL),
(192, 'T-1c4c81267ade', 193, NULL, '/tags?search=PHP', '13.77', '{\"search\":\"PHP\"}', '1', 0, 'bot', '2023-12-10 12:25:57', '2023-12-10 01:57:00', NULL),
(193, 'T-f807ac780db0', 193, NULL, '/tags?search=Data%20transformatio', '17.42', '{\"search\":\"Data transformatio\"}', '1', 0, 'bot', '2023-12-10 12:25:58', '2023-12-10 01:58:00', NULL),
(194, 'T-625e2cfc8db9', 193, NULL, '/tags?search=Python', '17.68', '{\"search\":\"Python\"}', '1', 0, 'bot', '2023-12-10 12:25:58', '2023-12-10 01:58:00', NULL),
(195, 'T-aa8bece2eaca', 193, NULL, '/categories?search==Technology', '16.12', '{\"search\":\"=Technology\"}', '1', 0, 'bot', '2023-12-10 12:25:59', '2023-12-10 01:59:00', NULL),
(196, 'T-d15505a62c41', 193, NULL, '/categories?search=Technology', '15.06', '{\"search\":\"Technology\"}', '1', 0, 'bot', '2023-12-10 12:25:59', '2023-12-10 01:59:00', NULL),
(197, 'T-f21411fad377', 193, NULL, '/tags?search=web%20development', '27.09', '{\"search\":\"web development\"}', '1', 0, 'bot', '2023-12-10 12:26:00', '2023-12-10 01:00:00', NULL),
(198, 'T-e9fa80bb8830', 193, NULL, '/tags?search=Web%20scraping', '17.90', '{\"search\":\"Web scraping\"}', '1', 0, 'bot', '2023-12-10 12:26:02', '2023-12-10 01:02:00', NULL),
(199, 'T-8ab42606e3cd', 193, NULL, '/categories?search==IDEA', '16.66', '{\"search\":\"=IDEA\"}', '1', 0, 'bot', '2023-12-10 12:26:03', '2023-12-10 01:03:00', NULL),
(200, 'T-fa95e09a4960', 193, NULL, '/tags?search=Improved%20accuracy', '16.50', '{\"search\":\"Improved accuracy\"}', '1', 0, 'bot', '2023-12-10 12:26:03', '2023-12-10 01:03:00', NULL),
(201, 'T-5e3e297b45b0', 193, NULL, '/categories?search=%20NFC%20Cards', '15.80', '{\"search\":\" NFC Cards\"}', '1', 0, 'bot', '2023-12-10 12:26:04', '2023-12-10 01:04:00', NULL),
(202, 'T-64a1d7176f73', 193, NULL, '/tags?search=Reduced%20costs', '16.61', '{\"search\":\"Reduced costs\"}', '1', 0, 'bot', '2023-12-10 12:26:04', '2023-12-10 01:04:00', NULL),
(203, 'T-63931a703b78', 193, NULL, '/categories?search=IDEA', '22.23', '{\"search\":\"IDEA\"}', '1', 0, 'bot', '2023-12-10 12:26:06', '2023-12-10 01:06:00', NULL),
(204, 'T-f984443214e0', 193, NULL, '/tags?search=Task%20automation', '14.88', '{\"search\":\"Task automation\"}', '1', 0, 'bot', '2023-12-10 12:26:06', '2023-12-10 01:06:00', NULL),
(205, 'T-7aa8473f0cae', 193, NULL, '/tags?search=NFC', '20.36', '{\"search\":\"NFC\"}', '1', 0, 'bot', '2023-12-10 12:26:07', '2023-12-10 01:07:00', NULL),
(206, 'T-396595c6bf87', 193, NULL, '/tags?search=wertwer', '15.35', '{\"search\":\"wertwer\"}', '1', 0, 'bot', '2023-12-10 12:26:07', '2023-12-10 01:07:00', NULL),
(207, 'T-c38fd1731b9a', 193, NULL, '/tags?search=Innovation', '24.25', '{\"search\":\"Innovation\"}', '1', 0, 'bot', '2023-12-10 12:26:08', '2023-12-10 01:08:00', NULL),
(208, 'T-79e77ca0f391', 193, NULL, '/tags?search=Technology', '16.22', '{\"search\":\"Technology\"}', '1', 0, 'bot', '2023-12-10 12:26:10', '2023-12-10 01:10:00', NULL),
(209, 'T-c1d49e793a89', 193, NULL, '/tags?search=scripting%20language', '16.52', '{\"search\":\"scripting language\"}', '1', 0, 'bot', '2023-12-10 12:26:10', '2023-12-10 01:10:00', NULL),
(210, 'T-c77c0f64faa9', 193, NULL, '/tags?search=ewrt', '17.03', '{\"search\":\"ewrt\"}', '1', 0, 'bot', '2023-12-10 12:26:11', '2023-12-10 01:11:00', NULL),
(211, 'T-bc0a2544a0c2', 193, NULL, '/categories?search=project', '16.57', '{\"search\":\"project\"}', '1', 0, 'bot', '2023-12-10 12:26:11', '2023-12-10 01:11:00', NULL),
(212, 'T-5832c170e039', 193, NULL, '/tags?search=Quality%20Control%20AI', '21.58', '{\"search\":\"Quality Control AI\"}', '1', 0, 'bot', '2023-12-10 12:26:12', '2023-12-10 01:12:00', NULL),
(213, 'T-21ed92094d2c', 193, NULL, '/tags?search=NFC%20Cards', '20.11', '{\"search\":\"NFC Cards\"}', '1', 0, 'bot', '2023-12-10 12:26:13', '2023-12-10 01:13:00', NULL),
(214, 'T-c674c1830edd', 193, NULL, '/categories?search=Python', '16.88', '{\"search\":\"Python\"}', '1', 0, 'bot', '2023-12-10 12:26:14', '2023-12-10 01:14:00', NULL),
(215, 'T-1e31777cc3be', 193, NULL, '/categories?search=quality%20control%20ai', '22.65', '{\"search\":\"quality control ai\"}', '1', 0, 'bot', '2023-12-10 12:26:14', '2023-12-10 01:14:00', NULL),
(216, 'T-dfb0614f877a', 193, NULL, '/categories?search==%20NFC%20Cards', '17.17', '{\"search\":\"= NFC Cards\"}', '1', 0, 'bot', '2023-12-10 12:26:15', '2023-12-10 01:15:00', NULL),
(217, 'T-d5234a7861dc', 193, NULL, '/tags?search=Augmented%20reality%20(AR)', '15.52', '{\"search\":\"Augmented reality (AR)\"}', '1', 0, 'bot', '2023-12-10 12:26:16', '2023-12-10 01:16:00', NULL),
(218, 'T-d3941a587d13', 193, NULL, '/categories?search=wertwertwertwt', '15.85', '{\"search\":\"wertwertwertwt\"}', '1', 0, 'bot', '2023-12-10 12:26:16', '2023-12-10 01:16:00', NULL),
(219, 'T-ba2720493cba', 194, NULL, '/unknown/preview/A-ebb7e51fd928-PowerfulandVersatileToolforWebDevelopment', '64.82', NULL, '1', 0, 'bot', '2023-12-10 14:06:06', '2023-12-10 03:06:00', NULL),
(220, 'T-58fd8a602c93', 195, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-10 17:46:23', '2023-12-21 06:00:00', NULL),
(221, 'T-7202aa014f47', 196, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-10 18:02:43', '2023-12-21 06:00:00', NULL),
(222, 'T-96e6a9dcd64c', 197, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-10 18:55:43', '2023-12-21 06:00:00', NULL),
(223, 'T-58da01dcbe5a', 198, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-11 02:37:52', '2023-12-19 01:03:00', NULL),
(224, 'T-fb9dc7d41ff8', 198, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-11 02:37:52', '2023-12-21 06:00:00', NULL),
(225, 'T-557e896735c9', 199, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-11 04:21:22', '2023-12-21 06:00:00', NULL),
(226, 'T-fb74210f9e2e', 200, NULL, '/login', '7.88', NULL, '1', 0, 'client', '2023-12-11 04:21:25', '2023-12-11 05:25:00', NULL),
(227, 'T-95e39562f0b5', 201, 1, '/profile', '92.34', NULL, '1', 0, 'client', '2023-12-11 04:21:32', '2023-12-11 05:32:00', NULL),
(228, 'T-eb7c2e1f804e', 202, 1, '/dashboard/mailbox', '45.77', NULL, '1', 0, 'client', '2023-12-11 04:21:36', '2023-12-11 05:36:00', NULL),
(229, 'T-88caf0b45ad0', 203, 1, '/dashboard/traffic', '27.91', NULL, '1', 0, 'client', '2023-12-11 04:23:00', '2023-12-11 05:00:00', NULL),
(230, 'T-ccc2e882e6ec', 204, 1, '/dashboard/traffic?current=2&count=50', '24.96', '{\"current\":\"2\",\"count\":\"50\"}', '1', 0, 'client', '2023-12-11 04:23:51', '2023-12-11 05:51:00', NULL),
(231, 'T-d231e38a3f1f', 205, 1, '/dashboard/traffic?current=3&count=50', '41.87', '{\"current\":\"3\",\"count\":\"50\"}', '1', 0, 'client', '2023-12-11 04:24:52', '2023-12-11 05:51:00', NULL),
(232, 'T-7564a1827ea5', 206, 1, '/dashboard/traffic?current=2&count=50', '21.95', '{\"current\":\"2\",\"count\":\"50\"}', '1', 0, 'client', '2023-12-11 04:25:49', '2023-12-11 05:49:00', NULL),
(233, 'T-59a315840374', 207, 1, '/dashboard/traffic?current=1&count=50', '19.53', '{\"current\":\"1\",\"count\":\"50\"}', '1', 0, 'client', '2023-12-11 04:25:53', '2023-12-11 05:53:00', NULL),
(234, 'T-ec6ed737b759', 208, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-11 07:58:15', '2023-12-21 06:00:00', NULL),
(235, 'T-8a0c9334a8ee', 209, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-11 11:22:08', '2023-12-21 06:00:00', NULL),
(236, 'T-1a0e8564d5f8', 210, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-12 02:16:00', '2023-12-21 06:00:00', NULL),
(237, 'T-171c2907938f', 211, 1, '/dashboard', '552.51', NULL, '1', 153, 'client', '2023-12-12 02:16:02', '2023-12-24 06:10:00', NULL),
(238, 'T-8e7eee128caf', 212, 1, '/dashboard/offers', '52.67', NULL, '1', 0, 'client', '2023-12-12 02:16:14', '2023-12-12 03:14:00', NULL),
(239, 'T-71bcbdf2b326', 213, 1, '/dashboard/offers?current=2&count=3', '19.11', '{\"current\":\"2\",\"count\":\"3\"}', '1', 0, 'client', '2023-12-12 02:17:12', '2023-12-12 03:12:00', NULL),
(240, 'T-28f0a6978ea8', 214, 1, '/dashboard/offers?current=3&count=3', '15.60', '{\"current\":\"3\",\"count\":\"3\"}', '1', 0, 'client', '2023-12-12 02:17:20', '2023-12-12 03:20:00', NULL),
(241, 'T-cd4e25e7e9ab', 215, 1, '/dashboard/offers?current=4&count=3', '13.98', '{\"current\":\"4\",\"count\":\"3\"}', '1', 0, 'client', '2023-12-12 02:17:23', '2023-12-12 03:23:00', NULL),
(242, 'T-a72678b31b8b', 216, 1, '/dashboard/offers?current=5&count=3', '15.19', '{\"current\":\"5\",\"count\":\"3\"}', '1', 0, 'client', '2023-12-12 02:17:26', '2023-12-12 03:26:00', NULL),
(243, 'T-a596bf0e0e45', 217, 1, '/dashboard/traffic', '24.90', NULL, '1', 0, 'client', '2023-12-12 02:17:31', '2023-12-12 03:31:00', NULL),
(244, 'T-79cba638ac35', 218, 1, '/dashboard/projects', '19.50', NULL, '1', 0, 'client', '2023-12-12 02:18:41', '2023-12-12 03:41:00', NULL),
(245, 'T-f24ae25af08e', 219, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-12 03:09:14', '2023-12-21 06:00:00', NULL),
(246, 'T-6a7f6427baf2', 220, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-12 04:00:50', '2023-12-21 06:00:00', NULL),
(247, 'T-2e2697340cd1', 221, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-12 11:55:36', '2023-12-21 06:00:00', NULL),
(248, 'T-b7433ebdef47', 222, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-12 19:49:36', '2023-12-21 06:00:00', NULL),
(249, 'T-2ded45e37d9c', 223, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-13 04:21:44', '2023-12-21 06:00:00', NULL),
(250, 'T-1bb86e3fa076', 224, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-13 07:56:43', '2023-12-21 06:00:00', NULL),
(251, 'T-3daf8b5d9be4', 225, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-13 09:39:57', '2023-12-21 06:00:00', NULL),
(252, 'T-29022a196553', 226, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-13 12:49:05', '2023-12-21 06:00:00', NULL),
(253, 'T-0ca9d644c5c4', 227, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-13 13:19:40', '2023-12-21 06:00:00', NULL),
(254, 'T-21a62c4aa68e', 228, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-13 13:19:44', '2023-12-21 06:00:00', NULL),
(255, 'T-498c926aaccd', 228, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-13 13:19:44', '2023-12-19 01:03:00', NULL),
(256, 'T-d0b1646cb6d8', 228, NULL, '/services', '5.64', NULL, '1', 3, 'client', '2023-12-13 13:19:44', '2023-12-15 10:29:00', NULL),
(257, 'T-bda8296aad66', 229, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-13 16:26:48', '2023-12-21 06:00:00', NULL),
(258, 'T-54989e257e30', 230, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-13 19:15:22', '2023-12-21 06:00:00', NULL),
(259, 'T-b01a162269fd', 231, NULL, '/policy', '113.02', NULL, '1', 0, 'client', '2023-12-13 20:38:18', '2023-12-13 09:18:00', NULL),
(260, 'T-c0f504076727', 231, NULL, '/services', '5.64', NULL, '1', 3, 'client', '2023-12-13 20:38:18', '2023-12-15 10:29:00', NULL),
(261, 'T-bc736e9390b8', 231, NULL, '/help', '5.41', NULL, '1', 0, 'client', '2023-12-13 20:38:18', '2023-12-13 09:18:00', NULL),
(262, 'T-2cfced2e88af', 231, NULL, '/qanda', '5.51', NULL, '1', 0, 'client', '2023-12-13 20:38:18', '2023-12-13 09:18:00', NULL),
(263, 'T-1c511dee315f', 231, NULL, '/websites', '45.38', NULL, '1', 0, 'client', '2023-12-13 20:38:19', '2023-12-13 09:19:00', NULL),
(264, 'T-f373be7476fd', 231, NULL, '/impression', '5.31', NULL, '1', 0, 'client', '2023-12-13 20:38:20', '2023-12-13 09:20:00', NULL),
(265, 'T-db6ec6385fe4', 231, NULL, '/documentation', '7.65', NULL, '1', 0, 'client', '2023-12-13 20:38:21', '2023-12-13 09:21:00', NULL),
(266, 'T-fde9739a5db8', 231, NULL, '/products/preview/A-d890771864c3-erwtertwer', '90.30', NULL, '1', 0, 'client', '2023-12-13 20:38:22', '2023-12-13 09:22:00', NULL),
(267, 'T-dbdf4ad33993', 231, NULL, '/products/preview/A-a8baf0195607-NFCcards-ornear-fieldcommunicationcards', '25.05', NULL, '1', 0, 'client', '2023-12-13 20:38:23', '2023-12-13 09:23:00', NULL),
(268, 'T-dc550f5beea2', 231, NULL, '/websites/preview/A-da257de2c949-PowerfulandVersatileLanguageforWebDevelopment', '26.29', NULL, '1', 0, 'client', '2023-12-13 20:38:23', '2023-12-13 09:23:00', NULL),
(269, 'T-a36b467c8469', 231, NULL, '/websites/preview/A-36cdf725e31e-IDEA-IntegratedDevelopmentEnvironmentforAutomation', '24.85', NULL, '1', 0, 'client', '2023-12-13 20:38:24', '2023-12-13 09:24:00', NULL),
(270, 'T-0d168f788adf', 232, NULL, '/impression', '8.49', NULL, '1', 0, 'client', '2023-12-13 20:43:32', '2023-12-13 09:32:00', NULL),
(271, 'T-0e734e509337', 233, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-13 20:43:35', '2023-12-21 06:00:00', NULL),
(272, 'T-3a0cf62fee54', 233, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-13 20:43:35', '2023-12-19 01:03:00', NULL),
(273, 'T-d669939583f2', 233, NULL, '/services', '5.64', NULL, '1', 3, 'client', '2023-12-13 20:43:35', '2023-12-15 10:29:00', NULL),
(274, 'T-0dc7a1b08c42', 234, NULL, '/help', '7.97', NULL, '1', 0, 'client', '2023-12-13 20:44:24', '2023-12-13 09:24:00', NULL),
(275, 'T-ccd6e3c8cd36', 235, NULL, '/services', '5.64', NULL, '1', 3, 'client', '2023-12-13 20:44:24', '2023-12-15 10:29:00', NULL),
(276, 'T-97358f0f1ade', 235, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-13 20:44:24', '2023-12-21 06:00:00', NULL),
(277, 'T-4fea37e0e9c4', 235, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-13 20:44:24', '2023-12-19 01:03:00', NULL),
(278, 'T-6441c15f74a1', 236, NULL, '/products/preview/A-d890771864c3-erwtertwer', '28.14', NULL, '1', 0, 'client', '2023-12-13 20:45:06', '2023-12-13 09:06:00', NULL),
(279, 'T-88cd2195745d', 237, NULL, '/services', '5.64', NULL, '1', 3, 'client', '2023-12-13 20:45:07', '2023-12-15 10:29:00', NULL),
(280, 'T-8beb5df1d753', 237, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-13 20:45:07', '2023-12-19 01:03:00', NULL),
(281, 'T-59b80200827e', 237, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-13 20:45:07', '2023-12-21 06:00:00', NULL),
(282, 'T-5f53a28be4b6', 238, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-13 20:49:45', '2023-12-21 06:00:00', NULL),
(283, 'T-dcf192d0f7c0', 239, NULL, '/websites', '52.74', NULL, '1', 0, 'client', '2023-12-13 20:59:50', '2023-12-13 09:50:00', NULL),
(284, 'T-eecdd8bdaf9e', 240, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-13 20:59:50', '2023-12-19 01:03:00', NULL),
(285, 'T-bdabf5fdd03e', 240, NULL, '/services', '5.64', NULL, '1', 3, 'client', '2023-12-13 20:59:50', '2023-12-15 10:29:00', NULL),
(286, 'T-62d64f3d78bf', 240, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-13 20:59:50', '2023-12-21 06:00:00', NULL),
(287, 'T-9d2aa61aa567', 241, NULL, '/websites/preview/A-36cdf725e31e-IDEA-IntegratedDevelopmentEnvironmentforAutomation', '47.83', NULL, '1', 0, 'client', '2023-12-13 21:06:12', '2023-12-13 10:12:00', NULL),
(288, 'T-d6169dae2ffd', 242, NULL, '/services', '5.64', NULL, '1', 3, 'client', '2023-12-13 21:06:14', '2023-12-15 10:29:00', NULL),
(289, 'T-ba1138a068d3', 242, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-13 21:06:14', '2023-12-19 01:03:00', NULL),
(290, 'T-44b07e32085e', 242, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-13 21:06:14', '2023-12-21 06:00:00', NULL),
(291, 'T-4c37003f38c7', 243, NULL, '/websites/preview/A-da257de2c949-PowerfulandVersatileLanguageforWebDevelopment', '31.67', NULL, '1', 0, 'client', '2023-12-13 21:09:36', '2023-12-13 10:36:00', NULL),
(292, 'T-fded9c618c30', 244, NULL, '/services', '5.64', NULL, '1', 3, 'client', '2023-12-13 21:09:36', '2023-12-15 10:29:00', NULL),
(293, 'T-a262d711e9db', 244, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-13 21:09:36', '2023-12-21 06:00:00', NULL),
(294, 'T-f17aad75749d', 244, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-13 21:09:36', '2023-12-19 01:03:00', NULL),
(295, 'T-a03609dc5af5', 245, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-14 01:38:00', '2023-12-21 06:00:00', NULL),
(296, 'T-267765c699ff', 246, NULL, '/login', '9.93', NULL, '1', 0, 'client', '2023-12-14 01:38:04', '2023-12-14 02:04:00', NULL),
(297, 'T-d0d3ca1bfcb3', 247, 1, '/profile', '72.10', NULL, '1', 0, 'client', '2023-12-14 01:38:09', '2023-12-14 02:09:00', NULL),
(298, 'T-14b0f42dc556', 248, 1, '/dashboard/mailbox', '100.11', NULL, '1', 0, 'client', '2023-12-14 01:38:12', '2023-12-14 02:12:00', NULL),
(299, 'T-93800bfbeae6', 249, 1, '/dashboard/mails', '44.47', NULL, '1', 0, 'client', '2023-12-14 01:38:28', '2023-12-14 02:28:00', NULL),
(300, 'T-ee3c93bda8ba', 250, 1, '/dashboard/mailbox', '14.61', NULL, '1', 0, 'client', '2023-12-14 01:38:30', '2023-12-14 02:30:00', NULL),
(301, 'T-c4f526596593', 251, 1, '/dashboard/notifications', '16.41', NULL, '1', 0, 'client', '2023-12-14 01:38:31', '2023-12-14 02:31:00', NULL),
(302, 'T-6c741b43dd12', 252, 1, '/dashboard/notifications?current=2&count=3', '16.36', '{\"current\":\"2\",\"count\":\"3\"}', '1', 0, 'client', '2023-12-14 01:38:35', '2023-12-14 02:35:00', NULL),
(303, 'T-7928fa22f067', 253, 1, '/dashboard/notifications?current=3&count=3', '14.46', '{\"current\":\"3\",\"count\":\"3\"}', '1', 0, 'client', '2023-12-14 01:38:37', '2023-12-14 02:37:00', NULL),
(304, 'T-8db8c8d1b0db', 254, 1, '/dashboard/notifications?current=4&count=3', '14.01', '{\"current\":\"4\",\"count\":\"3\"}', '1', 0, 'client', '2023-12-14 01:38:38', '2023-12-14 02:38:00', NULL),
(305, 'T-3dfb6885466c', 255, 1, '/dashboard/notifications?current=5&count=3', '14.52', '{\"current\":\"5\",\"count\":\"3\"}', '1', 0, 'client', '2023-12-14 01:38:39', '2023-12-14 02:39:00', NULL),
(306, 'T-ba86b3342d69', 256, 1, '/dashboard/mails', '13.91', NULL, '1', 0, 'client', '2023-12-14 01:38:43', '2023-12-14 02:43:00', NULL),
(307, 'T-8a643ec3a501', 257, 1, '/dashboard/mailbox', '16.00', NULL, '1', 0, 'client', '2023-12-14 01:38:44', '2023-12-14 02:44:00', NULL),
(308, 'T-b62e0607b98d', 258, 1, '/dashboard/offers', '45.00', NULL, '1', 0, 'client', '2023-12-14 01:38:59', '2023-12-14 02:59:00', NULL),
(309, 'T-4616db9932e7', 259, 1, '/dashboard/offers?current=2&count=3', '17.57', '{\"current\":\"2\",\"count\":\"3\"}', '1', 0, 'client', '2023-12-14 01:39:03', '2023-12-14 02:03:00', NULL),
(310, 'T-31fb8061867a', 260, 1, '/dashboard/offers?current=3&count=3', '16.88', '{\"current\":\"3\",\"count\":\"3\"}', '1', 0, 'client', '2023-12-14 01:39:14', '2023-12-14 02:14:00', NULL),
(311, 'T-8e9dfb2ce048', 261, 1, '/dashboard/offers?current=2&count=3', '18.63', '{\"current\":\"2\",\"count\":\"3\"}', '1', 0, 'client', '2023-12-14 01:39:20', '2023-12-14 02:20:00', NULL),
(312, 'T-3119264c94f1', 262, 1, '/dashboard/offers?current=1&count=3', '14.92', '{\"current\":\"1\",\"count\":\"3\"}', '1', 0, 'client', '2023-12-14 01:39:21', '2023-12-14 02:21:00', NULL),
(313, 'T-39ea848db2a1', 263, 1, '/home', '51.48', NULL, '1', 0, 'client', '2023-12-14 01:39:28', '2023-12-14 02:28:00', NULL),
(314, 'T-0c7e2d771c33', 264, 1, '/dashboard/offers?current=1&count=3', '16.68', '{\"current\":\"1\",\"count\":\"3\"}', '1', 0, 'client', '2023-12-14 01:39:30', '2023-12-14 02:30:00', NULL),
(315, 'T-f7bb1eaade93', 265, 1, '/dashboard/traffic', '27.56', NULL, '1', 0, 'client', '2023-12-14 01:39:32', '2023-12-14 02:32:00', NULL),
(316, 'T-aebdcfc5bc2f', 266, 1, '/dashboard/traffic?current=2&count=50', '22.77', '{\"current\":\"2\",\"count\":\"50\"}', '1', 0, 'client', '2023-12-14 01:40:18', '2023-12-14 02:18:00', NULL),
(317, 'T-d70fc0489103', 267, 1, '/dashboard/traffic?current=3&count=50', '25.34', '{\"current\":\"3\",\"count\":\"50\"}', '1', 0, 'client', '2023-12-14 01:41:04', '2023-12-14 02:04:00', NULL),
(318, 'T-6492d8e03eb7', 268, 1, '/dashboard/traffic?current=2&count=50', '24.08', '{\"current\":\"2\",\"count\":\"50\"}', '1', 0, 'client', '2023-12-14 01:44:53', '2023-12-14 02:53:00', NULL),
(319, 'T-408209a3b5f4', 269, NULL, '/blog', '85.20', NULL, '1', 0, 'client', '2023-12-14 05:40:11', '2023-12-14 06:11:00', NULL),
(320, 'T-27dc66311773', 270, NULL, '/blog', '35.48', NULL, '1', 0, 'client', '2023-12-14 05:41:10', '2023-12-14 06:10:00', NULL),
(321, 'T-5e05a9b496ba', 271, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-14 05:41:25', '2023-12-21 06:00:00', NULL),
(322, 'T-0ad8bb7d322a', 272, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-14 05:41:34', '2023-12-21 06:00:00', NULL),
(323, 'T-399ec9a78ce9', 273, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-14 05:41:38', '2023-12-21 06:00:00', NULL),
(324, 'T-c7de96273180', 274, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-14 05:41:44', '2023-12-21 06:00:00', NULL),
(325, 'T-f3120749ac53', 275, NULL, '/blog', '33.78', NULL, '1', 0, 'client', '2023-12-14 05:42:06', '2023-12-14 06:06:00', NULL),
(326, 'T-34592cc13366', 276, NULL, '/websites', '35.41', NULL, '1', 0, 'client', '2023-12-14 05:42:16', '2023-12-14 06:16:00', NULL),
(327, 'T-44d638390ced', 277, NULL, '/blog', '48.35', NULL, '1', 0, 'client', '2023-12-14 05:43:02', '2023-12-14 06:02:00', NULL),
(328, 'T-9d470c43795d', 278, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-14 05:43:07', '2023-12-19 01:03:00', NULL),
(329, 'T-dee519d7b9f0', 279, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-14 05:43:28', '2023-12-19 01:03:00', NULL),
(330, 'T-2c17d46e7e88', 280, NULL, '/blog', '31.73', NULL, '1', 0, 'client', '2023-12-14 05:43:31', '2023-12-14 06:31:00', NULL),
(331, 'T-fa1e78343dfa', 281, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-14 05:43:33', '2023-12-19 01:03:00', NULL),
(332, 'T-e47c30436d04', 282, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-14 05:43:34', '2023-12-21 06:00:00', NULL),
(333, 'T-c415a19feb87', 283, NULL, '/blog', '31.47', NULL, '1', 0, 'client', '2023-12-14 05:43:37', '2023-12-14 06:37:00', NULL),
(334, 'T-535f3d6732d8', 284, NULL, '/login', '9.19', NULL, '1', 0, 'client', '2023-12-14 05:51:03', '2023-12-14 06:03:00', NULL),
(335, 'T-ce2ed978181c', 285, 1, '/profile', '28.58', NULL, '1', 0, 'client', '2023-12-14 05:51:07', '2023-12-14 06:07:00', NULL),
(336, 'T-64da07d1568a', 286, 1, '/dashboard/projects', '28.12', NULL, '1', 0, 'client', '2023-12-14 05:51:11', '2023-12-14 06:11:00', NULL),
(337, 'T-e52da335fd99', 287, 1, '/project/editor', '12.84', NULL, '1', 0, 'client', '2023-12-14 05:51:12', '2023-12-14 06:12:00', NULL),
(338, 'T-83848a8569f3', 288, 1, '/dashboard/projects', '18.42', NULL, '1', 0, 'client', '2023-12-14 05:52:42', '2023-12-14 06:42:00', NULL),
(339, 'T-4f6e2c21bd2d', 289, 1, '/project/editor', '12.77', NULL, '1', 0, 'client', '2023-12-14 05:53:05', '2023-12-14 06:05:00', NULL),
(340, 'T-85a74047e5b0', 290, 1, '/dashboard/projects', '14.78', NULL, '1', 0, 'client', '2023-12-14 05:58:19', '2023-12-14 06:19:00', NULL),
(341, 'T-4413f33de5ad', 291, 1, '/project/editor/A-bef60b9d5d68', '26.83', NULL, '1', 0, 'client', '2023-12-14 05:58:34', '2023-12-14 06:34:00', NULL);
INSERT INTO `traffic` (`uid`, `guide`, `visitor_id`, `registered_id`, `page_url`, `page_load_time`, `queries`, `response`, `reloaded`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(342, 'T-eced89e7bce8', 292, 1, '/dashboard/projects', '14.54', NULL, '1', 0, 'client', '2023-12-14 05:58:37', '2023-12-14 06:37:00', NULL),
(343, 'T-93748c9ce8a4', 293, 1, '/dashboard/projects', '20.44', NULL, '1', 0, 'client', '2023-12-14 05:58:50', '2023-12-14 06:50:00', NULL),
(344, 'T-c4828abf26a8', 294, 1, '/project/editor/A-bef60b9d5d68', '58.07', NULL, '1', 0, 'client', '2023-12-14 05:58:53', '2023-12-14 06:53:00', NULL),
(345, 'T-14456b9e3395', 295, 1, '/dashboard/projects', '17.61', NULL, '1', 0, 'client', '2023-12-14 05:58:56', '2023-12-14 06:56:00', NULL),
(346, 'T-7e374fe73409', 296, 1, '/websites/preview/A-bef60b9d5d68-UnveilingtheInnovationsShapingOurFuture', '64.41', NULL, '1', 0, 'client', '2023-12-14 05:59:29', '2023-12-14 06:29:00', NULL),
(347, 'T-bb487ee7c45e', 297, 1, '/dashboard/projects', '15.39', NULL, '1', 0, 'client', '2023-12-14 05:59:31', '2023-12-14 06:31:00', NULL),
(348, 'T-7104544e8f6d', 298, 1, '/websites/preview/A-bef60b9d5d68-UnveilingtheInnovationsShapingOurFuture', '37.89', NULL, '1', 0, 'client', '2023-12-14 05:59:32', '2023-12-14 06:32:00', NULL),
(349, 'T-7423611a5ed6', 299, 1, '/dashboard/projects', '14.94', NULL, '1', 0, 'client', '2023-12-14 05:59:38', '2023-12-14 06:38:00', NULL),
(350, 'T-c1b2b2e19502', 300, 1, '/project/editor/A-bef60b9d5d68', '25.14', NULL, '1', 0, 'client', '2023-12-14 05:59:41', '2023-12-14 06:41:00', NULL),
(351, 'T-b0321ac0633a', 301, 1, '/dashboard/projects', '14.34', NULL, '1', 0, 'client', '2023-12-14 05:59:43', '2023-12-14 06:43:00', NULL),
(352, 'T-b6e6676bfed4', 302, 1, '/websites/preview/A-bef60b9d5d68-UnveilingtheInnovationsShapingOurFuture', '30.19', NULL, '1', 0, 'client', '2023-12-14 05:59:47', '2023-12-14 06:47:00', NULL),
(353, 'T-a90d0ca95501', 303, 1, '/dashboard/projects', '44.45', NULL, '1', 0, 'client', '2023-12-14 05:59:49', '2023-12-14 06:49:00', NULL),
(354, 'T-383ec1c5aaa2', 304, 1, '/project/editor/A-bef60b9d5d68', '23.34', NULL, '1', 0, 'client', '2023-12-14 05:59:52', '2023-12-14 06:52:00', NULL),
(355, 'T-135e382e4cf7', 305, 1, '/dashboard/projects', '14.14', NULL, '1', 0, 'client', '2023-12-14 05:59:59', '2023-12-14 06:59:00', NULL),
(356, 'T-5115408f1398', 306, 1, '/dashboard/projects', '16.09', NULL, '1', 0, 'client', '2023-12-14 06:00:08', '2023-12-14 07:08:00', NULL),
(357, 'T-91e574ed9018', 307, 1, '/dashboard/projects', '15.42', NULL, '1', 0, 'client', '2023-12-14 06:00:14', '2023-12-14 07:14:00', NULL),
(358, 'T-7356db3f74e8', 308, 1, '/project/editor/A-da257de2c949', '24.73', NULL, '1', 0, 'client', '2023-12-14 06:00:28', '2023-12-14 07:28:00', NULL),
(359, 'T-0ffc6fb11dd3', 309, 1, '/dashboard/projects', '16.10', NULL, '1', 0, 'client', '2023-12-14 06:00:32', '2023-12-14 07:32:00', NULL),
(360, 'T-8bcbe478b237', 310, 1, '/project/editor/A-36cdf725e31e', '24.63', NULL, '1', 0, 'client', '2023-12-14 06:00:35', '2023-12-14 07:35:00', NULL),
(361, 'T-236cbdb0ebde', 311, 1, '/dashboard/projects', '18.76', NULL, '1', 0, 'client', '2023-12-14 06:00:39', '2023-12-14 07:39:00', NULL),
(362, 'T-4731b56f71f7', 312, 1, '/dashboard/projects?current=2&count=10', '16.70', '{\"current\":\"2\",\"count\":\"10\"}', '1', 0, 'client', '2023-12-14 06:00:42', '2023-12-14 07:42:00', NULL),
(363, 'T-a599248cd6bc', 313, 1, '/dashboard/projects?current=1&count=10', '16.01', '{\"current\":\"1\",\"count\":\"10\"}', '1', 0, 'client', '2023-12-14 06:00:44', '2023-12-14 07:44:00', NULL),
(364, 'T-e64c80063a02', 314, 1, '/project/editor', '13.84', NULL, '1', 0, 'client', '2023-12-14 06:01:32', '2023-12-14 07:32:00', NULL),
(365, 'T-e01f845f9809', 315, 1, '/dashboard/projects?current=1&count=10', '17.20', '{\"current\":\"1\",\"count\":\"10\"}', '1', 0, 'client', '2023-12-14 06:02:24', '2023-12-14 07:24:00', NULL),
(366, 'T-443a31baa879', 316, 1, '/project/editor', '14.95', NULL, '1', 0, 'client', '2023-12-14 06:05:52', '2023-12-14 07:52:00', NULL),
(367, 'T-41eebafad357', 317, 1, '/dashboard/projects?current=1&count=10', '18.39', '{\"current\":\"1\",\"count\":\"10\"}', '1', 0, 'client', '2023-12-14 06:06:44', '2023-12-14 07:44:00', NULL),
(368, 'T-1583ae580251', 318, 1, '/project/editor', '13.99', NULL, '1', 0, 'client', '2023-12-14 06:08:05', '2023-12-14 07:05:00', NULL),
(369, 'T-af28a9abe883', 319, 1, '/dashboard/projects?current=1&count=10', '18.83', '{\"current\":\"1\",\"count\":\"10\"}', '1', 0, 'client', '2023-12-14 06:09:25', '2023-12-14 07:25:00', NULL),
(370, 'T-cabe6ea73ec4', 320, 1, '/home', '66.51', NULL, '1', 0, 'client', '2023-12-14 06:09:28', '2023-12-14 07:28:00', NULL),
(371, 'T-da6f034d694d', 321, 1, '/blog', '52.55', NULL, '1', 0, 'client', '2023-12-14 06:09:29', '2023-12-14 07:29:00', NULL),
(372, 'T-3beba5d534e6', 322, 1, '/websites', '48.81', NULL, '1', 0, 'client', '2023-12-14 06:09:31', '2023-12-14 07:31:00', NULL),
(373, 'T-60b7790f7dcd', 323, 1, '/websites/preview/A-5e79d3b231c6-MobileTechZone', '31.28', NULL, '1', 0, 'client', '2023-12-14 06:09:39', '2023-12-14 07:39:00', NULL),
(374, 'T-453291cd99f9', 324, 1, '/websites/preview/A-5e79d3b231c6-MobileTechZone', '33.80', NULL, '1', 0, 'client', '2023-12-14 06:09:44', '2023-12-14 07:44:00', NULL),
(375, 'T-e3a6b7d6f2ba', 325, 1, '/websites', '74.74', NULL, '1', 0, 'client', '2023-12-14 06:09:56', '2023-12-14 07:56:00', NULL),
(376, 'T-0191d2bc509c', 326, 1, '/websites/preview/A-304f448137de-HandySalzburg', '34.58', NULL, '1', 0, 'client', '2023-12-14 06:09:58', '2023-12-14 07:58:00', NULL),
(377, 'T-2dc9033a9fa0', 327, 1, '/websites', '56.61', NULL, '1', 0, 'client', '2023-12-14 06:10:06', '2023-12-14 07:06:00', NULL),
(378, 'T-492eb257bc89', 328, 1, '/websites/preview/A-6a1f16c47a5e-Grandmasterss', '34.76', NULL, '1', 0, 'client', '2023-12-14 06:10:09', '2023-12-14 07:09:00', NULL),
(379, 'T-4ec13ec6c680', 329, 1, '/websites', '51.24', NULL, '1', 0, 'client', '2023-12-14 06:10:14', '2023-12-14 07:14:00', NULL),
(380, 'T-ccca7a419df9', 330, 1, '/websites/preview/A-0876acfceb99-Cemani', '34.36', NULL, '1', 0, 'client', '2023-12-14 06:10:17', '2023-12-14 07:17:00', NULL),
(381, 'T-33378b1f78f8', 331, 1, '/websites', '50.22', NULL, '1', 0, 'client', '2023-12-14 06:10:19', '2023-12-14 07:19:00', NULL),
(382, 'T-0d7cb1ff9e56', 332, 1, '/websites/preview/A-c6bdf71df6d3-SabriMontagen', '31.95', NULL, '1', 0, 'client', '2023-12-14 06:10:22', '2023-12-14 07:22:00', NULL),
(383, 'T-792f9a2eab5f', 333, 1, '/websites', '54.90', NULL, '1', 0, 'client', '2023-12-14 06:10:31', '2023-12-14 07:31:00', NULL),
(384, 'T-65298954fd5b', 334, 1, '/websites/preview/A-c6bdf71df6d3-SabriMontagen', '32.84', NULL, '1', 0, 'client', '2023-12-14 06:10:33', '2023-12-14 07:33:00', NULL),
(385, 'T-712c3829469f', 335, 1, '/websites', '50.33', NULL, '1', 0, 'client', '2023-12-14 06:10:36', '2023-12-14 07:36:00', NULL),
(386, 'T-ee5a2d383839', 336, 1, '/websites/preview/A-304f448137de-HandySalzburg', '32.35', NULL, '1', 0, 'client', '2023-12-14 06:10:40', '2023-12-14 07:40:00', NULL),
(387, 'T-edb6089e12b4', 337, 1, '/categories?search=phone', '24.05', '{\"search\":\"phone\"}', '1', 0, 'client', '2023-12-14 06:10:46', '2023-12-14 07:46:00', NULL),
(388, 'T-fe81dc758c08', 338, 1, '/tags?search=web%20development', '33.29', '{\"search\":\"web development\"}', '1', 0, 'client', '2023-12-14 06:10:51', '2023-12-14 07:51:00', NULL),
(389, 'T-88f9654887a0', 339, 1, '/categories?search=phone', '25.39', '{\"search\":\"phone\"}', '1', 0, 'client', '2023-12-14 06:10:54', '2023-12-14 07:54:00', NULL),
(390, 'T-33ca3439df60', 340, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-14 06:10:58', '2023-12-21 06:00:00', NULL),
(391, 'T-9908086264c0', 341, 1, '/blog', '46.41', NULL, '1', 0, 'client', '2023-12-14 06:11:00', '2023-12-14 07:00:00', NULL),
(392, 'T-9ef4a2eb106b', 342, 1, '/products', '38.77', NULL, '1', 0, 'client', '2023-12-14 06:11:04', '2023-12-14 07:04:00', NULL),
(393, 'T-70e03e063973', 343, 1, '/dashboard', '552.51', NULL, '1', 153, 'client', '2023-12-14 06:11:10', '2023-12-24 06:10:00', NULL),
(394, 'T-b7e2405f80a8', 344, 1, '/dashboard/projects', '15.94', NULL, '1', 0, 'client', '2023-12-14 06:11:13', '2023-12-14 07:13:00', NULL),
(395, 'T-c247e97a3798', 345, 1, '/project/editor/A-d890771864c3', '28.21', NULL, '1', 0, 'client', '2023-12-14 06:11:17', '2023-12-14 07:17:00', NULL),
(396, 'T-649dfd82ae6e', 346, 1, '/dashboard/projects', '19.03', NULL, '1', 0, 'client', '2023-12-14 06:12:57', '2023-12-14 07:57:00', NULL),
(397, 'T-a8924d91289f', 347, 1, '/products/preview/A-d890771864c3-Loremipsum', '38.30', NULL, '1', 0, 'client', '2023-12-14 06:13:02', '2023-12-14 07:02:00', NULL),
(398, 'T-68e8f0e2b4fe', 348, 1, '/products', '37.39', NULL, '1', 0, 'client', '2023-12-14 06:13:08', '2023-12-14 07:08:00', NULL),
(399, 'T-a05a6c3fc1c1', 349, 1, '/products/preview/A-d890771864c3-Loremipsum', '33.92', NULL, '1', 0, 'client', '2023-12-14 06:13:12', '2023-12-14 07:12:00', NULL),
(400, 'T-1d4b47963fb3', 350, 1, '/dashboard/projects', '17.73', NULL, '1', 0, 'client', '2023-12-14 06:13:13', '2023-12-14 07:13:00', NULL),
(401, 'T-7f641814dd52', 351, 1, '/dashboard', '552.51', NULL, '1', 153, 'client', '2023-12-14 06:13:14', '2023-12-24 06:10:00', NULL),
(402, 'T-9f8ab5b5c8e4', 352, 1, '/dashboard/projects', '16.53', NULL, '1', 0, 'client', '2023-12-14 06:13:16', '2023-12-14 07:16:00', NULL),
(403, 'T-7b8b39a155c4', 353, 1, '/products/preview/A-d890771864c3-Loremipsum', '31.01', NULL, '1', 0, 'client', '2023-12-14 06:13:18', '2023-12-14 07:18:00', NULL),
(404, 'T-c79bf5e732a8', 354, 1, '/dashboard/projects', '16.32', NULL, '1', 0, 'client', '2023-12-14 06:13:20', '2023-12-14 07:20:00', NULL),
(405, 'T-4c72b07ef7ab', 355, 1, '/project/editor/A-d890771864c3', '23.92', NULL, '1', 0, 'client', '2023-12-14 06:13:22', '2023-12-14 07:22:00', NULL),
(406, 'T-3bb22d6fbfea', 356, 1, '/dashboard/projects', '18.33', NULL, '1', 0, 'client', '2023-12-14 06:13:35', '2023-12-14 07:35:00', NULL),
(407, 'T-0179e42b9c13', 357, 1, '/dashboard', '552.51', NULL, '1', 153, 'client', '2023-12-14 06:13:36', '2023-12-24 06:10:00', NULL),
(408, 'T-164f2268ffa2', 358, 1, '/dashboard/projects', '16.34', NULL, '1', 0, 'client', '2023-12-14 06:13:38', '2023-12-14 07:38:00', NULL),
(409, 'T-39d92d32a9b6', 359, 1, '/home', '65.49', NULL, '1', 0, 'client', '2023-12-14 06:13:39', '2023-12-14 07:39:00', NULL),
(410, 'T-c018f0ff36de', 360, 1, '/blog', '55.70', NULL, '1', 0, 'client', '2023-12-14 06:13:40', '2023-12-14 07:40:00', NULL),
(411, 'T-51b5d89a2279', 361, 1, '/products', '33.20', NULL, '1', 0, 'client', '2023-12-14 06:13:43', '2023-12-14 07:43:00', NULL),
(412, 'T-6d5662c381fb', 362, 1, '/blog', '58.38', NULL, '1', 0, 'client', '2023-12-14 06:13:46', '2023-12-14 07:46:00', NULL),
(413, 'T-e185c95d80f3', 363, 1, '/home', '60.77', NULL, '1', 0, 'client', '2023-12-14 06:13:47', '2023-12-14 07:47:00', NULL),
(414, 'T-ab9a6fe97f54', 364, 1, '/dashboard/projects', '17.63', NULL, '1', 0, 'client', '2023-12-14 06:13:48', '2023-12-14 07:48:00', NULL),
(415, 'T-291a3759a416', 365, 1, '/project/editor/A-d890771864c3', '23.93', NULL, '1', 0, 'client', '2023-12-14 06:13:56', '2023-12-14 07:56:00', NULL),
(416, 'T-979f6f1e6283', 366, 1, '/dashboard/projects', '17.84', NULL, '1', 0, 'client', '2023-12-14 06:14:00', '2023-12-14 07:00:00', NULL),
(417, 'T-c85013573a3e', 367, 1, '/home', '71.67', NULL, '1', 0, 'client', '2023-12-14 06:14:02', '2023-12-14 07:02:00', NULL),
(418, 'T-6ee0c68060cf', 368, 1, '/products', '40.92', NULL, '1', 0, 'client', '2023-12-14 06:14:04', '2023-12-14 07:04:00', NULL),
(419, 'T-0e2ab9e065dc', 369, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-14 06:29:52', '2023-12-21 06:00:00', NULL),
(420, 'T-229cbdddaaf8', 370, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-14 06:29:53', '2023-12-21 06:00:00', NULL),
(421, 'T-b98cbf732eac', 371, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-14 10:26:01', '2023-12-19 01:03:00', NULL),
(422, 'T-d774f9ea243b', 371, NULL, '/products', '230.47', NULL, '1', 0, 'client', '2023-12-14 10:26:02', '2023-12-14 11:02:00', NULL),
(423, 'T-8f8a41b6c18a', 371, NULL, '/tags?search=NFC', '23.99', '{\"search\":\"NFC\"}', '1', 0, 'client', '2023-12-14 10:26:03', '2023-12-14 11:03:00', NULL),
(424, 'T-9552ea31d6af', 371, NULL, '/tags?search=PHP', '17.56', '{\"search\":\"PHP\"}', '1', 0, 'client', '2023-12-14 10:26:04', '2023-12-14 11:04:00', NULL),
(425, 'T-9c01c8a3c024', 372, NULL, '/products', '54.00', NULL, '1', 0, 'client', '2023-12-14 11:12:42', '2023-12-14 12:42:00', NULL),
(426, 'T-0679f67814be', 373, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-14 11:12:45', '2023-12-19 01:03:00', NULL),
(427, 'T-efdbf03fc3d2', 373, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-14 11:12:45', '2023-12-21 06:00:00', NULL),
(428, 'T-1e143badd318', 373, NULL, '/services', '5.64', NULL, '1', 3, 'client', '2023-12-14 11:12:45', '2023-12-15 10:29:00', NULL),
(429, 'T-4e2e4e9ef1d0', 374, NULL, '/tags?search=PHP', '38.19', '{\"search\":\"PHP\"}', '1', 0, 'client', '2023-12-14 11:24:44', '2023-12-14 12:44:00', NULL),
(430, 'T-66d057e4055d', 375, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-14 11:24:44', '2023-12-19 01:03:00', NULL),
(431, 'T-a66ffe83adfa', 375, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-14 11:24:45', '2023-12-21 06:00:00', NULL),
(432, 'T-483e31ccd96b', 375, NULL, '/services', '5.64', NULL, '1', 3, 'client', '2023-12-14 11:24:45', '2023-12-15 10:29:00', NULL),
(433, 'T-82952ab328a2', 376, NULL, '/tags?search=NFC', '23.10', '{\"search\":\"NFC\"}', '1', 0, 'client', '2023-12-14 11:29:44', '2023-12-14 12:44:00', NULL),
(434, 'T-c6b49b30f20b', 377, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-14 11:29:45', '2023-12-21 06:00:00', NULL),
(435, 'T-60243edd823c', 377, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-14 11:29:45', '2023-12-19 01:03:00', NULL),
(436, 'T-365361d1f1c8', 377, NULL, '/services', '5.64', NULL, '1', 3, 'client', '2023-12-14 11:29:45', '2023-12-15 10:29:00', NULL),
(437, 'T-eb29eebb5da6', 378, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-14 14:41:03', '2023-12-21 06:00:00', NULL),
(438, 'T-3843e3b5e549', 379, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-14 14:54:35', '2023-12-21 06:00:00', NULL),
(439, 'T-cea65b276c76', 380, 1, '/dashboard', '552.51', NULL, '1', 153, 'client', '2023-12-14 14:54:53', '2023-12-24 06:10:00', NULL),
(440, 'T-8c5e763961fa', 381, 1, '/dashboard/traffic', '25.84', NULL, '1', 0, 'client', '2023-12-14 14:55:32', '2023-12-14 03:32:00', NULL),
(441, 'T-bf4423380f0d', 382, 1, '/dashboard/traffic', '357.94', NULL, '1', 0, 'client', '2023-12-14 14:55:43', '2023-12-14 03:43:00', NULL),
(442, 'T-5f72057b1ed9', 383, 1, '/dashboard', '552.51', NULL, '1', 153, 'client', '2023-12-14 14:57:17', '2023-12-24 06:10:00', NULL),
(443, 'T-6ddee52004d5', 384, 1, '/dashboard/users', '41.82', NULL, '1', 0, 'client', '2023-12-14 15:09:00', '2023-12-14 04:00:00', NULL),
(444, 'T-249a2ef8f947', 385, 1, '/dashboard/permission', '19.10', NULL, '1', 0, 'client', '2023-12-14 15:09:09', '2023-12-14 04:09:00', NULL),
(445, 'T-bc4a70c3a284', 386, 1, '/permission/edit/G-DEFAULTGROUP', '45.39', NULL, '1', 0, 'client', '2023-12-14 15:09:12', '2023-12-14 04:12:00', NULL),
(446, 'T-1fe1b2c385ec', 387, 1, '/dashboard/projects', '18.71', NULL, '1', 0, 'client', '2023-12-14 15:09:20', '2023-12-14 04:20:00', NULL),
(447, 'T-a1d6e128f492', 388, 1, '/project/editor', '14.38', NULL, '1', 0, 'client', '2023-12-14 15:09:24', '2023-12-14 04:24:00', NULL),
(448, 'T-1df9d8a5b304', 389, 1, '/dashboard/projects', '16.38', NULL, '1', 0, 'client', '2023-12-14 15:09:40', '2023-12-14 04:40:00', NULL),
(449, 'T-59bf3551cf04', 390, 1, '/dashboard/filestorage', '18.09', NULL, '1', 0, 'client', '2023-12-14 15:09:43', '2023-12-14 04:43:00', NULL),
(450, 'T-12d3f18e74ed', 391, 1, '/dashboard/mails', '38.43', NULL, '1', 0, 'client', '2023-12-14 15:09:51', '2023-12-14 04:51:00', NULL),
(451, 'T-5f266fd1014d', 392, 1, '/dashboard/language', '17.27', NULL, '1', 0, 'client', '2023-12-14 15:10:05', '2023-12-14 04:05:00', NULL),
(452, 'T-85a692a2919e', 393, 1, '/dashboard/language/en', '16.79', NULL, '1', 0, 'client', '2023-12-14 15:10:08', '2023-12-14 04:08:00', NULL),
(453, 'T-3d26b82aabae', 394, 1, '/dashboard/mailbox', '43.45', NULL, '1', 0, 'client', '2023-12-14 15:10:12', '2023-12-14 04:12:00', NULL),
(454, 'T-2e055878323a', 395, 1, '/dashboard/notifications', '18.68', NULL, '1', 0, 'client', '2023-12-14 15:10:34', '2023-12-14 04:34:00', NULL),
(455, 'T-dcc54fa1ed16', 396, 1, '/dashboard/traffic', '23.94', NULL, '1', 0, 'client', '2023-12-14 15:10:39', '2023-12-14 04:39:00', NULL),
(456, 'T-e42947b19478', 397, 1, '/dashboard/offers', '51.31', NULL, '1', 0, 'client', '2023-12-14 15:10:52', '2023-12-14 04:52:00', NULL),
(457, 'T-5f73ac8d16c0', 398, 1, '/dashboard/logs', '55.20', NULL, '1', 0, 'client', '2023-12-14 15:11:10', '2023-12-14 04:10:00', NULL),
(458, 'T-1f18c75e3c5b', 399, 1, '/dashboard/traffic', '19.94', NULL, '1', 0, 'client', '2023-12-14 15:11:17', '2023-12-14 04:17:00', NULL),
(459, 'T-d510931e680b', 400, 1, '/home', '67.00', NULL, '1', 0, 'client', '2023-12-14 15:12:31', '2023-12-14 04:31:00', NULL),
(460, 'T-5f96db3bbea2', 401, 1, '/websites', '56.77', NULL, '1', 0, 'client', '2023-12-14 15:12:34', '2023-12-14 04:34:00', NULL),
(461, 'T-7b251d337ab9', 402, 1, '/websites/preview/A-c6bdf71df6d3-SabriMontagen', '35.22', NULL, '1', 0, 'client', '2023-12-14 15:12:48', '2023-12-14 04:48:00', NULL),
(462, 'T-2c8c8d17b0b0', 403, 1, '/websites', '49.07', NULL, '1', 0, 'client', '2023-12-14 15:13:41', '2023-12-14 04:41:00', NULL),
(463, 'T-909b7fab6c22', 404, 1, '/websites/preview/A-5e79d3b231c6-MobileTechZone', '34.21', NULL, '1', 0, 'client', '2023-12-14 15:15:27', '2023-12-14 04:27:00', NULL),
(464, 'T-6c8e55411c1f', 405, 1, '/websites', '50.23', NULL, '1', 0, 'client', '2023-12-14 15:15:32', '2023-12-14 04:32:00', NULL),
(465, 'T-656d7e50dfdf', 406, 1, '/websites/preview/A-304f448137de-HandySalzburg', '31.24', NULL, '1', 0, 'client', '2023-12-14 15:15:37', '2023-12-14 04:37:00', NULL),
(466, 'T-4effae813c86', 407, 1, '/websites', '50.73', NULL, '1', 0, 'client', '2023-12-14 15:15:47', '2023-12-14 04:47:00', NULL),
(467, 'T-8cc57425ddfd', 408, 1, '/documentation', '16.46', NULL, '1', 0, 'client', '2023-12-14 15:17:19', '2023-12-14 04:19:00', NULL),
(468, 'T-33eca323e12d', 409, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-14 15:40:46', '2023-12-21 06:00:00', NULL),
(469, 'T-da93e7643878', 410, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-14 18:32:49', '2023-12-21 06:00:00', NULL),
(470, 'T-30b7a2ee7b97', 411, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-14 22:15:49', '2023-12-21 06:00:00', NULL),
(471, 'T-7609af83d931', 412, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-15 01:00:34', '2023-12-21 06:00:00', NULL),
(472, 'T-4a8a9d9a8bb6', 413, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-15 04:22:58', '2023-12-21 06:00:00', NULL),
(473, 'T-18804c7b7ad7', 414, NULL, '/login', '7.71', NULL, '1', 0, 'client', '2023-12-15 04:23:08', '2023-12-15 05:08:00', NULL),
(474, 'T-347d8921c545', 415, 1, '/profile', '86.72', NULL, '1', 0, 'client', '2023-12-15 04:23:14', '2023-12-15 05:14:00', NULL),
(475, 'T-94aefe780e27', 416, 1, '/dashboard/traffic', '29.76', NULL, '1', 0, 'client', '2023-12-15 04:23:21', '2023-12-15 05:21:00', NULL),
(476, 'T-1ff3fc9776a1', 417, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-15 04:31:16', '2023-12-21 06:00:00', NULL),
(477, 'T-ff93ef1ecc4c', 418, 1, '/', '59.25', NULL, '1', 3, 'client', '2023-12-15 04:33:58', '2023-12-21 06:00:00', NULL),
(478, 'T-c56d46544538', 419, 1, '/impression', '15.13', NULL, '1', 0, 'client', '2023-12-15 04:36:13', '2023-12-15 05:13:00', NULL),
(479, 'T-dcb41e9e4c05', 420, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-15 05:22:17', '2023-12-21 06:00:00', NULL),
(480, 'T-69c2997af764', 421, NULL, '/products', '36.14', NULL, '1', 0, 'client', '2023-12-15 05:22:21', '2023-12-15 06:21:00', NULL),
(481, 'T-85a76f9cc7d3', 422, NULL, '/services', '5.64', NULL, '1', 3, 'client', '2023-12-15 05:22:24', '2023-12-15 10:29:00', NULL),
(482, 'T-cddc684b8468', 423, NULL, '/websites', '40.69', NULL, '1', 0, 'client', '2023-12-15 05:22:27', '2023-12-15 06:27:00', NULL),
(483, 'T-ccd8cabb380e', 424, NULL, '/websites/preview/A-c6bdf71df6d3-SabriMontagen', '30.30', NULL, '1', 0, 'client', '2023-12-15 05:22:37', '2023-12-15 06:37:00', NULL),
(484, 'T-7bcf3ae9181f', 425, NULL, '/websites', '49.01', NULL, '1', 0, 'client', '2023-12-15 05:23:00', '2023-12-15 06:00:00', NULL),
(485, 'T-9e709a21f775', 426, NULL, '/websites/preview/A-304f448137de-HandySalzburg', '32.70', NULL, '1', 0, 'client', '2023-12-15 05:23:03', '2023-12-15 06:03:00', NULL),
(486, 'T-a685bdc63df1', 427, NULL, '/websites', '45.36', NULL, '1', 0, 'client', '2023-12-15 05:23:07', '2023-12-15 06:07:00', NULL),
(487, 'T-cda539506141', 428, NULL, '/services', '5.64', NULL, '1', 3, 'client', '2023-12-15 05:23:10', '2023-12-15 10:29:00', NULL),
(488, 'T-aadb440e691f', 429, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-15 07:11:53', '2023-12-21 06:00:00', NULL),
(489, 'T-4580fd2b1b87', 430, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-15 09:09:00', '2023-12-21 06:00:00', NULL),
(490, 'T-80ec12f9f1b5', 431, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-15 09:09:08', '2023-12-21 06:00:00', NULL),
(491, 'T-f4f97e7e6211', 432, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-15 09:09:09', '2023-12-21 06:00:00', NULL),
(492, 'T-cfa21a90b273', 432, NULL, '/products/preview/A-da257de2c949-PowerfulandVersatileLanguageforWebDevelopment', '58.88', NULL, '1', 0, 'client', '2023-12-15 09:09:11', '2023-12-15 10:11:00', NULL),
(493, 'T-0ae9d14abb70', 432, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-15 09:09:11', '2023-12-19 01:03:00', NULL),
(494, 'T-7a73e454c127', 432, NULL, '/websites/preview/A-5e79d3b231c6-MobileTechZone', '27.06', NULL, '1', 0, 'client', '2023-12-15 09:09:11', '2023-12-15 10:11:00', NULL),
(495, 'T-a330cfb2afc5', 432, NULL, '/blog/preview/A-36cdf725e31e-IDEA-IntegratedDevelopmentEnvironmentforAutomation', '24.59', NULL, '1', 0, 'client', '2023-12-15 09:09:11', '2023-12-15 10:11:00', NULL),
(496, 'T-77473ee0e066', 432, NULL, '/websites/preview/A-0876acfceb99-Cemani', '30.35', NULL, '1', 0, 'client', '2023-12-15 09:09:11', '2023-12-15 10:11:00', NULL),
(497, 'T-138afd8a9d40', 432, NULL, '/impression', '6.50', NULL, '1', 0, 'client', '2023-12-15 09:09:11', '2023-12-15 10:11:00', NULL),
(498, 'T-5a4352814fee', 432, NULL, '/services', '5.64', NULL, '1', 3, 'client', '2023-12-15 09:09:11', '2023-12-15 10:29:00', NULL),
(499, 'T-5f8960af085f', 432, NULL, '/products', '30.75', NULL, '1', 0, 'client', '2023-12-15 09:09:11', '2023-12-15 10:11:00', NULL),
(500, 'T-6ccd33717259', 432, NULL, '/websites', '42.37', NULL, '1', 0, 'client', '2023-12-15 09:09:11', '2023-12-15 10:11:00', NULL),
(501, 'T-7fb825d747c0', 432, NULL, '/websites/preview/A-304f448137de-HandySalzburg', '28.34', NULL, '1', 0, 'client', '2023-12-15 09:09:11', '2023-12-15 10:11:00', NULL),
(502, 'T-407dc8231599', 432, NULL, '/websites/preview/A-c6bdf71df6d3-SabriMontagen', '28.89', NULL, '1', 0, 'client', '2023-12-15 09:09:11', '2023-12-15 10:11:00', NULL),
(503, 'T-6a23af342451', 432, NULL, '/blog/preview/A-294f7301084f-IntroducingtheQualityControlAI', '29.05', NULL, '1', 0, 'client', '2023-12-15 09:09:11', '2023-12-15 10:11:00', NULL),
(504, 'T-2a8689228ac5', 432, NULL, '/help', '5.85', NULL, '1', 0, 'client', '2023-12-15 09:09:11', '2023-12-15 10:11:00', NULL),
(505, 'T-777b8a986c4a', 432, NULL, '/policy', '6.45', NULL, '1', 0, 'client', '2023-12-15 09:09:11', '2023-12-15 10:11:00', NULL),
(506, 'T-08238a4438a1', 432, NULL, '/blog/preview/A-0d14858f19da-VersatileLanguageforDevelopers', '27.00', NULL, '1', 0, 'client', '2023-12-15 09:09:11', '2023-12-15 10:11:00', NULL),
(507, 'T-b8d0352e2e3d', 432, NULL, '/websites/preview/A-6a1f16c47a5e-Grandmasterss', '29.33', NULL, '1', 0, 'client', '2023-12-15 09:09:11', '2023-12-15 10:11:00', NULL),
(508, 'T-16efd1169eac', 432, NULL, '/blog', '39.95', NULL, '1', 0, 'client', '2023-12-15 09:09:11', '2023-12-15 10:11:00', NULL),
(509, 'T-4b569d67686b', 432, NULL, '/products/preview/A-a8baf0195607-NFCcards-ornear-fieldcommunicationcards', '36.02', NULL, '1', 0, 'client', '2023-12-15 09:09:11', '2023-12-15 10:11:00', NULL),
(510, 'T-eb680f25980d', 432, NULL, '/blog/preview/A-bef60b9d5d68-UnveilingtheInnovationsShapingOurFuture', '31.46', NULL, '1', 0, 'client', '2023-12-15 09:09:11', '2023-12-15 10:11:00', NULL),
(511, 'T-2122a6c15b07', 432, NULL, '/qanda', '7.51', NULL, '1', 0, 'client', '2023-12-15 09:09:11', '2023-12-15 10:11:00', NULL),
(512, 'T-e8d556ffd176', 432, NULL, '/products/preview/A-d890771864c3-Loremipsum', '24.51', NULL, '1', 0, 'client', '2023-12-15 09:09:11', '2023-12-15 10:11:00', NULL),
(513, 'T-271eee3074f5', 432, NULL, '/documentation', '9.96', NULL, '1', 0, 'client', '2023-12-15 09:09:11', '2023-12-15 10:11:00', NULL),
(514, 'T-0242b33f0037', 433, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-15 09:10:10', '2023-12-21 06:00:00', NULL),
(515, 'T-25469a011568', 434, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-15 09:21:04', '2023-12-21 06:00:00', NULL),
(516, 'T-2189eb5f9cc4', 435, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-15 09:21:04', '2023-12-21 06:00:00', NULL),
(517, 'T-cb784c599d2f', 436, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-15 09:21:05', '2023-12-21 06:00:00', NULL),
(518, 'T-0ac0bcd94e88', 437, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-15 09:21:06', '2023-12-21 06:00:00', NULL),
(519, 'T-40e92147c3c8', 438, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-15 11:34:12', '2023-12-21 06:00:00', NULL),
(520, 'T-85590ebd18df', 439, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-15 11:34:13', '2023-12-21 06:00:00', NULL),
(521, 'T-81d4faec6d3f', 439, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-15 11:34:13', '2023-12-19 01:03:00', NULL),
(522, 'T-334d9a12f7c0', 439, NULL, '/services', '5.64', NULL, '1', 3, 'client', '2023-12-15 11:34:13', '2023-12-15 10:29:00', NULL),
(523, 'T-030671ef7501', 439, NULL, '/websites', '50.36', NULL, '1', 0, 'client', '2023-12-15 11:35:43', '2023-12-15 12:43:00', NULL),
(524, 'T-3adf73e161f5', 439, NULL, '/products', '36.34', NULL, '1', 0, 'client', '2023-12-15 11:35:55', '2023-12-15 12:55:00', NULL),
(525, 'T-2062d832d743', 440, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-15 12:09:16', '2023-12-21 06:00:00', NULL),
(526, 'T-a4054fdfdc18', 438, NULL, '/services', '5.64', NULL, '1', 3, 'client', '2023-12-15 12:14:14', '2023-12-15 10:29:00', NULL),
(527, 'T-e123644df6c4', 441, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-15 19:53:25', '2023-12-21 06:00:00', NULL),
(528, 'T-2312cd0012f0', 442, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-15 21:46:22', '2023-12-21 06:00:00', NULL),
(529, 'T-a8f15b57c714', 443, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-15 21:46:27', '2023-12-21 06:00:00', NULL),
(530, 'T-bfcc91651881', 444, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-15 21:46:27', '2023-12-21 06:00:00', NULL),
(531, 'T-7fab6ad94a8b', 444, NULL, '/documentation', '8.71', NULL, '1', 0, 'client', '2023-12-15 21:46:28', '2023-12-15 10:28:00', NULL),
(532, 'T-f68d51446ad2', 444, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-15 21:46:28', '2023-12-19 01:03:00', NULL),
(533, 'T-c59a0babfaa3', 444, NULL, '/blog', '49.75', NULL, '1', 0, 'client', '2023-12-15 21:46:28', '2023-12-15 10:28:00', NULL),
(534, 'T-5d0d549a5cfd', 444, NULL, '/services', '5.64', NULL, '1', 3, 'client', '2023-12-15 21:46:28', '2023-12-15 10:29:00', NULL),
(535, 'T-0c3b0d3f1160', 444, NULL, '/products/preview/A-da257de2c949-PowerfulandVersatileLanguageforWebDevelopment', '36.27', NULL, '1', 0, 'client', '2023-12-15 21:46:28', '2023-12-15 10:28:00', NULL),
(536, 'T-e3e8414bce12', 444, NULL, '/blog/preview/A-bef60b9d5d68-UnveilingtheInnovationsShapingOurFuture', '27.44', NULL, '1', 0, 'client', '2023-12-15 21:46:29', '2023-12-15 10:29:00', NULL),
(537, 'T-e0d4a4349c3c', 444, NULL, '/blog/preview/A-36cdf725e31e-IDEA-IntegratedDevelopmentEnvironmentforAutomation', '26.05', NULL, '1', 0, 'client', '2023-12-15 21:46:29', '2023-12-15 10:29:00', NULL),
(538, 'T-6f32e058b126', 444, NULL, '/websites', '44.43', NULL, '1', 0, 'client', '2023-12-15 21:46:29', '2023-12-15 10:29:00', NULL),
(539, 'T-85eafd12f46c', 444, NULL, '/products/preview/A-a8baf0195607-NFCcards-ornear-fieldcommunicationcards', '26.76', NULL, '1', 0, 'client', '2023-12-15 21:46:29', '2023-12-15 10:29:00', NULL),
(540, 'T-b529be9f79eb', 444, NULL, '/products/preview/A-d890771864c3-Loremipsum', '27.51', NULL, '1', 0, 'client', '2023-12-15 21:46:29', '2023-12-15 10:29:00', NULL),
(541, 'T-588a3f21c5e0', 444, NULL, '/websites/preview/A-304f448137de-HandySalzburg', '28.92', NULL, '1', 0, 'client', '2023-12-15 21:46:29', '2023-12-15 10:29:00', NULL),
(542, 'T-5f5004a634cd', 444, NULL, '/websites/preview/A-6a1f16c47a5e-Grandmasterss', '28.70', NULL, '1', 0, 'client', '2023-12-15 21:46:29', '2023-12-15 10:29:00', NULL),
(543, 'T-9638946e8c59', 444, NULL, '/websites/preview/A-0876acfceb99-Cemani', '27.74', NULL, '1', 0, 'client', '2023-12-15 21:46:29', '2023-12-15 10:29:00', NULL),
(544, 'T-dc7eac80d87d', 444, NULL, '/websites/preview/A-c6bdf71df6d3-SabriMontagen', '24.46', NULL, '1', 0, 'client', '2023-12-15 21:46:29', '2023-12-15 10:29:00', NULL),
(545, 'T-8f5c748cffe3', 444, NULL, '/qanda', '5.15', NULL, '1', 0, 'client', '2023-12-15 21:46:29', '2023-12-15 10:29:00', NULL),
(546, 'T-c3c8d6de7ba3', 444, NULL, '/impression', '5.11', NULL, '1', 0, 'client', '2023-12-15 21:46:29', '2023-12-15 10:29:00', NULL),
(547, 'T-6dbf0a13087b', 444, NULL, '/websites/preview/A-5e79d3b231c6-MobileTechZone', '31.19', NULL, '1', 0, 'client', '2023-12-15 21:46:29', '2023-12-15 10:29:00', NULL),
(548, 'T-56a72c6761c2', 444, NULL, '/help', '9.00', NULL, '1', 0, 'client', '2023-12-15 21:46:29', '2023-12-15 10:29:00', NULL),
(549, 'T-858b277725a4', 444, NULL, '/blog/preview/A-0d14858f19da-VersatileLanguageforDevelopers', '25.19', NULL, '1', 0, 'client', '2023-12-15 21:46:29', '2023-12-15 10:29:00', NULL),
(550, 'T-7c72fd7b7d78', 444, NULL, '/policy', '7.68', NULL, '1', 0, 'client', '2023-12-15 21:46:29', '2023-12-15 10:29:00', NULL),
(551, 'T-a0fe5a054773', 444, NULL, '/blog/preview/A-294f7301084f-IntroducingtheQualityControlAI', '23.92', NULL, '1', 0, 'client', '2023-12-15 21:46:29', '2023-12-15 10:29:00', NULL),
(552, 'T-9b66ba6ccaa2', 444, NULL, '/products', '29.39', NULL, '1', 0, 'client', '2023-12-15 21:46:29', '2023-12-15 10:29:00', NULL),
(553, 'T-2298927b89cb', 445, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-15 23:36:53', '2023-12-21 06:00:00', NULL),
(554, 'T-a99a22b50599', 446, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-16 02:18:50', '2023-12-21 06:00:00', NULL),
(555, 'T-82a3f8b3b310', 446, NULL, '/policy', '6.82', NULL, '1', 0, 'client', '2023-12-16 02:18:55', '2023-12-16 03:55:00', NULL),
(556, 'T-ab1876fc6095', 446, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-16 02:18:56', '2023-12-19 01:03:00', NULL),
(557, 'T-7bbdc31a71ae', 446, NULL, '/services', '6.14', NULL, '1', 0, 'client', '2023-12-16 02:18:57', '2023-12-16 03:57:00', NULL),
(558, 'T-a132ac63ceb5', 446, NULL, '/websites', '42.69', NULL, '1', 0, 'client', '2023-12-16 02:18:58', '2023-12-16 03:58:00', NULL),
(559, 'T-01a56cced856', 446, NULL, '/products', '27.82', NULL, '1', 0, 'client', '2023-12-16 02:18:59', '2023-12-16 03:59:00', NULL),
(560, 'T-2f238ce12767', 446, NULL, '/blog', '38.78', NULL, '1', 0, 'client', '2023-12-16 02:19:00', '2023-12-16 03:00:00', NULL),
(561, 'T-b493e8b85e98', 446, NULL, '/products/preview/A-d890771864c3-Loremipsum', '29.92', NULL, '1', 0, 'client', '2023-12-16 02:19:01', '2023-12-16 03:01:00', NULL),
(562, 'T-3b6d551deb61', 446, NULL, '/websites/preview/A-304f448137de-HandySalzburg', '29.72', NULL, '1', 0, 'client', '2023-12-16 02:19:02', '2023-12-16 03:02:00', NULL),
(563, 'T-0cf5a91a998a', 446, NULL, '/products/preview/A-da257de2c949-PowerfulandVersatileLanguageforWebDevelopment', '24.79', NULL, '1', 0, 'client', '2023-12-16 02:19:03', '2023-12-16 03:03:00', NULL),
(564, 'T-9ea136c8fe44', 447, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-16 02:19:29', '2023-12-21 06:00:00', NULL),
(565, 'T-8ae67fb49942', 448, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-16 02:45:44', '2023-12-21 06:00:00', NULL),
(566, 'T-b1f6e11cf1d2', 449, NULL, '//xmlrpc.php?rsd', '60.68', '{\"rsd\":\"\"}', '1', 0, 'client', '2023-12-16 02:45:44', '2023-12-16 03:44:00', NULL),
(567, 'T-956159b3e7c8', 449, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-16 02:45:45', '2023-12-21 06:00:00', NULL),
(568, 'T-90cb4cbdb1d2', 450, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-16 02:51:09', '2023-12-21 06:00:00', NULL),
(569, 'T-49c079ff989f', 451, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-16 09:04:22', '2023-12-21 06:00:00', NULL),
(570, 'T-6e5636276950', 452, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-16 12:12:38', '2023-12-21 06:00:00', NULL),
(571, 'T-fc42cbc5d03e', 453, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-16 16:29:56', '2023-12-21 06:00:00', NULL),
(572, 'T-1dbbb969b717', 454, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-16 21:50:21', '2023-12-21 06:00:00', NULL),
(573, 'T-093439d00745', 455, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-16 21:50:25', '2023-12-19 01:03:00', NULL),
(574, 'T-f869c9d1cb7f', 456, NULL, '/policy', '8.02', NULL, '1', 0, 'client', '2023-12-16 21:50:31', '2023-12-16 10:31:00', NULL),
(575, 'T-66a277dd1130', 457, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-16 21:52:13', '2023-12-21 06:00:00', NULL),
(576, 'T-3dcea2886714', 458, NULL, '/login', '7.42', NULL, '1', 0, 'client', '2023-12-16 21:52:18', '2023-12-16 10:18:00', NULL),
(577, 'T-85b60d6160e9', 459, 1, '/profile', '26.13', NULL, '1', 0, 'client', '2023-12-16 21:52:23', '2023-12-16 10:23:00', NULL),
(578, 'T-b6ac3ba3cdea', 460, 1, '/dashboard/traffic', '85.81', NULL, '1', 0, 'client', '2023-12-16 21:52:25', '2023-12-16 10:25:00', NULL),
(579, 'T-dfe3cfeeadb8', 461, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-17 06:43:09', '2023-12-21 06:00:00', NULL),
(580, 'T-192b4b138259', 462, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-17 10:03:45', '2023-12-21 06:00:00', NULL),
(581, 'T-54fb735f6477', 463, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-17 17:24:19', '2023-12-21 06:00:00', NULL),
(582, 'T-786617452823', 464, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-17 17:57:18', '2023-12-21 06:00:00', NULL),
(583, 'T-b48085395f36', 465, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-17 17:57:21', '2023-12-21 06:00:00', NULL),
(584, 'T-5736707c23f9', 465, NULL, '/services', '8.02', NULL, '1', 0, 'client', '2023-12-17 17:57:21', '2023-12-17 06:21:00', NULL),
(585, 'T-49f846970a87', 465, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-17 17:57:21', '2023-12-19 01:03:00', NULL),
(586, 'T-2f6dcefd52bf', 466, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-18 02:30:37', '2023-12-21 06:00:00', NULL),
(587, 'T-2f1102166338', 467, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-18 03:30:26', '2023-12-21 06:00:00', NULL),
(588, 'T-10948b2f036f', 468, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-19 04:08:19', '2023-12-21 06:00:00', NULL),
(589, 'T-0c6a402ddb81', 469, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-19 05:03:41', '2023-12-21 06:00:00', NULL),
(590, 'T-ae34d2a06f2a', 469, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-19 05:03:42', '2023-12-19 01:03:00', NULL),
(591, 'T-226ad9c27b6b', 469, NULL, '/services', '6.28', NULL, '1', 0, 'client', '2023-12-19 05:03:43', '2023-12-19 06:43:00', NULL),
(592, 'T-2b68b9e47841', 470, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-19 06:45:39', '2023-12-21 06:00:00', NULL),
(593, 'T-a38ac345ec87', 471, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-19 06:58:33', '2023-12-21 06:00:00', NULL),
(594, 'T-b85e0e20db26', 472, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-19 07:03:54', '2023-12-21 06:00:00', NULL),
(595, 'T-4a9c5567eee4', 473, NULL, '/login', '8.93', NULL, '1', 0, 'client', '2023-12-19 07:06:06', '2023-12-19 08:06:00', NULL),
(596, 'T-c08342452286', 474, 1, '/profile', '60.62', NULL, '1', 0, 'client', '2023-12-19 07:06:13', '2023-12-19 08:13:00', NULL),
(597, 'T-b0543b709943', 475, 1, '/dashboard/traffic', '30.11', NULL, '1', 0, 'client', '2023-12-19 07:06:15', '2023-12-19 08:15:00', NULL),
(598, 'T-0f5f6a058ad2', 476, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-19 08:26:28', '2023-12-21 06:00:00', NULL),
(599, 'T-afb91f92412e', 477, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-19 12:19:50', '2023-12-21 06:00:00', NULL),
(600, 'T-87fd4687d126', 478, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-19 12:19:53', '2023-12-21 06:00:00', NULL),
(601, 'T-79bb4fc4fdcf', 478, NULL, '/services', '8.55', NULL, '1', 0, 'client', '2023-12-19 12:19:53', '2023-12-19 01:53:00', NULL),
(602, 'T-962d277279f4', 478, NULL, '/about', '7.09', NULL, '1', 1, 'client', '2023-12-19 12:19:53', '2023-12-19 01:03:00', NULL),
(603, 'T-f1f49a208ad0', 479, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-19 20:32:51', '2023-12-21 06:00:00', NULL),
(604, 'T-8bc9890e0723', 480, NULL, '/products', '427.68', NULL, '1', 0, 'bot', '2023-12-20 00:25:29', '2023-12-20 01:29:00', NULL),
(605, 'T-9058c6f4c1dd', 480, NULL, '/websites/preview/A-c6bdf71df6d3-SabriMontagen', '93.19', NULL, '1', 0, 'bot', '2023-12-20 00:25:43', '2023-12-20 01:43:00', NULL),
(606, 'T-25642e3a7d7d', 480, NULL, '/about', '7.36', NULL, '1', 0, 'bot', '2023-12-20 00:25:55', '2023-12-20 01:55:00', NULL),
(607, 'T-09ec95529942', 480, NULL, '/websites/preview/A-0876acfceb99-Cemani', '26.49', NULL, '1', 0, 'bot', '2023-12-20 00:25:57', '2023-12-20 01:57:00', NULL),
(608, 'T-fdb1d90324ee', 480, NULL, '/websites', '50.87', NULL, '1', 0, 'bot', '2023-12-20 00:27:02', '2023-12-20 01:02:00', NULL),
(609, 'T-ed5d92adc2c0', 480, NULL, '/products/preview/A-a8baf0195607-NFCcards-ornear-fieldcommunicationcards', '46.77', NULL, '1', 0, 'bot', '2023-12-20 00:40:55', '2023-12-20 01:55:00', NULL),
(610, 'T-409052fe3c5f', 480, NULL, '/products/preview/A-d890771864c3-Loremipsum', '27.67', NULL, '1', 0, 'bot', '2023-12-20 00:43:35', '2023-12-20 01:35:00', NULL),
(611, 'T-31b0379cfcb8', 480, NULL, '/policy', '24.35', NULL, '1', 0, 'bot', '2023-12-20 01:35:01', '2023-12-20 02:01:00', NULL),
(612, 'T-c988fb1760ed', 480, NULL, '/documentation', '26.11', NULL, '1', 0, 'bot', '2023-12-20 02:00:33', '2023-12-20 03:33:00', NULL),
(613, 'T-c11e49605894', 480, NULL, '/websites/preview/A-6a1f16c47a5e-Grandmasterss', '65.60', NULL, '1', 0, 'bot', '2023-12-20 02:14:14', '2023-12-20 03:14:00', NULL),
(614, 'T-92654f7fe894', 480, NULL, '/services', '21.17', NULL, '1', 0, 'bot', '2023-12-20 02:22:20', '2023-12-20 03:20:00', NULL),
(615, 'T-6a0bb8ec515a', 480, NULL, '/websites/preview/A-304f448137de-HandySalzburg', '50.68', NULL, '1', 0, 'bot', '2023-12-20 02:46:40', '2023-12-20 03:40:00', NULL),
(616, 'T-401a134bb29f', 481, NULL, '/products', '337.89', NULL, '1', 0, 'bot', '2023-12-20 03:31:30', '2023-12-20 04:30:00', NULL),
(617, 'T-8f36b1fc9ee6', 481, NULL, '/websites/preview/A-c6bdf71df6d3-SabriMontagen', '39.06', NULL, '1', 0, 'bot', '2023-12-20 03:31:33', '2023-12-20 04:33:00', NULL),
(618, 'T-68e5a1ae5987', 481, NULL, '/about', '8.74', NULL, '1', 0, 'bot', '2023-12-20 03:31:45', '2023-12-20 04:45:00', NULL),
(619, 'T-c06d89d83e52', 481, NULL, '/websites/preview/A-0876acfceb99-Cemani', '28.53', NULL, '1', 0, 'bot', '2023-12-20 03:31:50', '2023-12-20 04:50:00', NULL),
(620, 'T-5901eaacaba6', 481, NULL, '/websites', '44.14', NULL, '1', 0, 'bot', '2023-12-20 03:33:00', '2023-12-20 04:00:00', NULL),
(621, 'T-600bffdbfc26', 481, NULL, '/products/preview/A-a8baf0195607-NFCcards-ornear-fieldcommunicationcards', '45.81', NULL, '1', 0, 'bot', '2023-12-20 03:51:21', '2023-12-20 04:21:00', NULL),
(622, 'T-90709ca9ce41', 481, NULL, '/products/preview/A-d890771864c3-Loremipsum', '26.37', NULL, '1', 0, 'bot', '2023-12-20 03:54:41', '2023-12-20 04:41:00', NULL),
(623, 'T-cfba104c37fd', 482, NULL, '/products', '134.61', NULL, '1', 0, 'bot', '2023-12-20 04:58:15', '2023-12-20 05:15:00', NULL),
(624, 'T-ca0462509868', 482, NULL, '/websites/preview/A-c6bdf71df6d3-SabriMontagen', '38.81', NULL, '1', 0, 'bot', '2023-12-20 04:58:18', '2023-12-20 05:18:00', NULL),
(625, 'T-56b2f7e6dd8e', 482, NULL, '/about', '8.10', NULL, '1', 0, 'bot', '2023-12-20 04:58:41', '2023-12-20 05:41:00', NULL),
(626, 'T-7c8ab5e54864', 482, NULL, '/websites/preview/A-0876acfceb99-Cemani', '28.81', NULL, '1', 0, 'bot', '2023-12-20 04:58:45', '2023-12-20 05:45:00', NULL),
(627, 'T-87de8dcb03b0', 482, NULL, '/websites', '49.36', NULL, '1', 0, 'bot', '2023-12-20 05:00:01', '2023-12-20 06:01:00', NULL),
(628, 'T-b2f97ad910f5', 482, NULL, '/products/preview/A-a8baf0195607-NFCcards-ornear-fieldcommunicationcards', '45.58', NULL, '1', 0, 'bot', '2023-12-20 05:17:01', '2023-12-20 06:01:00', NULL),
(629, 'T-79295a56f007', 482, NULL, '/products/preview/A-d890771864c3-Loremipsum', '31.27', NULL, '1', 0, 'bot', '2023-12-20 05:20:08', '2023-12-20 06:08:00', NULL),
(630, 'T-70bfcdb6cfbf', 483, NULL, '/products', '67.16', NULL, '1', 0, 'bot', '2023-12-20 06:37:22', '2023-12-20 07:22:00', NULL),
(631, 'T-c4845d9fddda', 483, NULL, '/websites/preview/A-c6bdf71df6d3-SabriMontagen', '38.22', NULL, '1', 0, 'bot', '2023-12-20 06:37:31', '2023-12-20 07:31:00', NULL),
(632, 'T-ec61e609cd66', 483, NULL, '/about', '7.13', NULL, '1', 0, 'bot', '2023-12-20 06:37:41', '2023-12-20 07:41:00', NULL),
(633, 'T-0a1e17d23970', 483, NULL, '/websites/preview/A-0876acfceb99-Cemani', '29.24', NULL, '1', 0, 'bot', '2023-12-20 06:37:44', '2023-12-20 07:44:00', NULL),
(634, 'T-e9f6d0373ccb', 483, NULL, '/websites', '49.41', NULL, '1', 0, 'bot', '2023-12-20 06:38:45', '2023-12-20 07:45:00', NULL),
(635, 'T-1f8a03ec366a', 483, NULL, '/products/preview/A-a8baf0195607-NFCcards-ornear-fieldcommunicationcards', '45.73', NULL, '1', 0, 'bot', '2023-12-20 06:51:52', '2023-12-20 07:52:00', NULL),
(636, 'T-9c5640754a89', 483, NULL, '/products/preview/A-d890771864c3-Loremipsum', '28.53', NULL, '1', 0, 'bot', '2023-12-20 06:54:14', '2023-12-20 07:14:00', NULL),
(637, 'T-edc8d5519127', 483, NULL, '/policy', '28.23', NULL, '1', 0, 'bot', '2023-12-20 07:43:15', '2023-12-20 08:15:00', NULL),
(638, 'T-d6e669b4018e', 483, NULL, '/documentation', '23.14', NULL, '1', 0, 'bot', '2023-12-20 08:07:53', '2023-12-20 09:53:00', NULL),
(639, 'T-65929b59b59b', 483, NULL, '/websites/preview/A-6a1f16c47a5e-Grandmasterss', '67.31', NULL, '1', 0, 'bot', '2023-12-20 08:21:02', '2023-12-20 09:02:00', NULL),
(640, 'T-4e9fea3f1bf3', 483, NULL, '/services', '22.11', NULL, '1', 0, 'bot', '2023-12-20 08:29:07', '2023-12-20 09:07:00', NULL),
(641, 'T-87dcf8c33678', 484, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-20 08:29:48', '2023-12-21 06:00:00', NULL),
(642, 'T-4357347bcfa8', 483, NULL, '/websites/preview/A-304f448137de-HandySalzburg', '114.59', NULL, '1', 0, 'bot', '2023-12-20 08:50:28', '2023-12-20 09:28:00', NULL),
(643, 'T-691379b90862', 483, NULL, '/impression', '23.27', NULL, '1', 0, 'bot', '2023-12-20 09:17:41', '2023-12-20 10:41:00', NULL),
(644, 'T-23a02ff17862', 483, NULL, '/qanda', '22.03', NULL, '1', 0, 'bot', '2023-12-20 09:36:37', '2023-12-20 10:37:00', NULL),
(645, 'T-befc63eb4c49', 483, NULL, '/websites/preview/A-5e79d3b231c6-MobileTechZone', '134.46', NULL, '1', 0, 'bot', '2023-12-20 12:07:21', '2023-12-20 01:21:00', NULL),
(646, 'T-333de7f24899', 483, NULL, '/help', '21.96', NULL, '1', 0, 'bot', '2023-12-20 12:26:33', '2023-12-20 01:33:00', NULL),
(647, 'T-4d981d6971a0', 483, NULL, '/products/preview/A-da257de2c949-PowerfulandVersatileLanguageforWebDevelopment', '68.13', NULL, '1', 0, 'bot', '2023-12-20 13:11:06', '2023-12-20 02:06:00', NULL),
(648, 'T-2876b2cba534', 485, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-20 16:00:04', '2023-12-21 06:00:00', NULL),
(649, 'T-3f36c0b0f87d', 486, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-21 05:43:38', '2023-12-21 06:00:00', NULL),
(650, 'T-7aea4acd7bac', 487, NULL, '/products/preview/A-d890771864c3-Loremipsum', '66.56', NULL, '1', 0, 'client', '2023-12-21 05:43:39', '2023-12-21 06:39:00', NULL),
(651, 'T-19069121774d', 487, NULL, '/', '59.25', NULL, '1', 3, 'client', '2023-12-21 05:43:40', '2023-12-21 06:00:00', NULL),
(652, 'T-1184b5557eaa', 487, NULL, '/websites/preview/A-304f448137de-HandySalzburg', '26.35', NULL, '1', 0, 'client', '2023-12-21 05:43:42', '2023-12-21 06:42:00', NULL),
(653, 'T-a08dee98bf3a', 487, NULL, '/products/preview/A-da257de2c949-PowerfulandVersatileLanguageforWebDevelopment', '23.84', NULL, '1', 0, 'client', '2023-12-21 05:43:46', '2023-12-21 06:46:00', NULL),
(654, 'T-e7f4f6a52eda', 487, NULL, '/websites/preview/A-5e79d3b231c6-MobileTechZone', '28.96', NULL, '1', 0, 'client', '2023-12-21 05:43:58', '2023-12-21 06:58:00', NULL),
(655, 'T-e8363cb46bad', 487, NULL, '/websites/preview/A-0876acfceb99-Cemani', '26.53', NULL, '1', 0, 'client', '2023-12-21 05:44:05', '2023-12-21 06:05:00', NULL),
(656, 'T-8d441fb5ed95', 487, NULL, '/help', '6.43', NULL, '1', 0, 'client', '2023-12-21 05:44:07', '2023-12-21 06:07:00', NULL),
(657, 'T-44f485155325', 487, NULL, '/websites/preview/A-6a1f16c47a5e-Grandmasterss', '25.49', NULL, '1', 0, 'client', '2023-12-21 05:44:11', '2023-12-21 06:11:00', NULL),
(658, 'T-4f05351d65d5', 487, NULL, '/blog', '40.42', NULL, '1', 0, 'client', '2023-12-21 05:44:13', '2023-12-21 06:13:00', NULL),
(659, 'T-d29393a76e5f', 487, NULL, '/websites/preview/A-c6bdf71df6d3-SabriMontagen', '30.17', NULL, '1', 0, 'client', '2023-12-21 05:44:14', '2023-12-21 06:14:00', NULL),
(660, 'T-b94aebf1da44', 487, NULL, '/documentation', '8.30', NULL, '1', 0, 'client', '2023-12-21 05:44:16', '2023-12-21 06:16:00', NULL),
(661, 'T-522b8d7daad3', 487, NULL, '/products/preview/A-a8baf0195607-NFCcards-ornear-fieldcommunicationcards', '26.11', NULL, '1', 0, 'client', '2023-12-21 05:44:17', '2023-12-21 06:17:00', NULL),
(662, 'T-83d23f31e96b', 487, NULL, '/products', '30.23', NULL, '1', 0, 'client', '2023-12-21 05:44:19', '2023-12-21 06:19:00', NULL),
(663, 'T-ad1df249966f', 487, NULL, '/blog/preview/A-36cdf725e31e-IDEA-IntegratedDevelopmentEnvironmentforAutomation', '25.98', NULL, '1', 0, 'client', '2023-12-21 05:44:23', '2023-12-21 06:23:00', NULL),
(664, 'T-f0c426dd07b4', 487, NULL, '/websites', '41.53', NULL, '1', 0, 'client', '2023-12-21 05:44:24', '2023-12-21 06:24:00', NULL),
(665, 'T-bd2721af2787', 487, NULL, '/blog/preview/A-bef60b9d5d68-UnveilingtheInnovationsShapingOurFuture', '28.46', NULL, '1', 0, 'client', '2023-12-21 05:44:26', '2023-12-21 06:26:00', NULL),
(666, 'T-0430d59754ec', 487, NULL, '/impression', '9.25', NULL, '1', 0, 'client', '2023-12-21 05:44:28', '2023-12-21 06:28:00', NULL),
(667, 'T-cc80488a16b7', 487, NULL, '/blog/preview/A-294f7301084f-IntroducingtheQualityControlAI', '26.57', NULL, '1', 0, 'client', '2023-12-21 05:44:29', '2023-12-21 06:29:00', NULL),
(668, 'T-0f0e755739b5', 487, NULL, '/qanda', '6.92', NULL, '1', 0, 'client', '2023-12-21 05:44:33', '2023-12-21 06:33:00', NULL),
(669, 'T-a8c215b3aea1', 487, NULL, '/blog/preview/A-0d14858f19da-VersatileLanguageforDevelopers', '28.22', NULL, '1', 0, 'client', '2023-12-21 05:44:35', '2023-12-21 06:35:00', NULL),
(670, 'T-86499cd87b71', 487, NULL, '/policy', '8.46', NULL, '1', 0, 'client', '2023-12-21 05:44:39', '2023-12-21 06:39:00', NULL),
(671, 'T-1dc409b66221', 487, NULL, '/about', '7.21', NULL, '1', 0, 'client', '2023-12-21 05:44:40', '2023-12-21 06:40:00', NULL),
(672, 'T-61a27d8f9f91', 487, NULL, '/services', '7.40', NULL, '1', 0, 'client', '2023-12-21 05:44:41', '2023-12-21 06:41:00', NULL),
(673, 'T-d423bbf79b20', 488, NULL, '/login', '10.36', NULL, '1', 0, 'client', '2023-12-21 05:53:47', '2023-12-21 06:47:00', NULL),
(674, 'T-09087c536f81', 489, 1, '/profile', '62.99', NULL, '1', 0, 'client', '2023-12-21 05:53:53', '2023-12-21 06:53:00', NULL),
(675, 'T-edf87bbb5fac', 490, 1, '/dashboard/traffic', '22.82', NULL, '1', 0, 'client', '2023-12-21 05:54:02', '2023-12-21 06:02:00', NULL),
(676, 'T-9a0b7d4ca69b', 491, 1, '/dashboard/offers', '52.99', NULL, '1', 0, 'client', '2023-12-21 05:55:34', '2023-12-21 06:34:00', NULL),
(677, 'T-c3c7bfa14aff', 492, 1, '/dashboard/mailbox', '51.15', NULL, '1', 0, 'client', '2023-12-21 06:29:29', '2023-12-21 07:29:00', NULL),
(678, 'T-aa23c1d35faf', 493, NULL, '/', '79.59', NULL, '1', 0, 'client', '2023-12-21 07:37:51', '2023-12-21 08:51:00', NULL),
(679, 'T-1a9eec7ba389', 494, NULL, '/', '292.54', NULL, '1', 0, 'client', '2023-12-21 10:27:58', '2023-12-21 11:58:00', NULL),
(680, 'T-d10e4e42b0a9', 495, NULL, '/', '85.85', NULL, '1', 0, 'client', '2023-12-22 00:37:26', '2023-12-22 01:26:00', NULL),
(681, 'T-5ff50bde26de', 496, 1, '/dashboard/mailbox', '140.74', NULL, '1', 0, 'client', '2023-12-22 02:32:32', '2023-12-22 03:32:00', NULL),
(682, 'T-532f3beaa60a', 497, 1, '/dashboard/traffic', '30.60', NULL, '1', 0, 'client', '2023-12-22 02:32:39', '2023-12-22 03:39:00', NULL),
(683, 'T-50cfded541e1', 498, 1, '/home', '84.32', NULL, '1', 0, 'client', '2023-12-22 02:38:37', '2023-12-22 03:37:00', NULL),
(684, 'T-1cecf07553ff', 499, 1, '/dashboard/traffic', '152.62', NULL, '1', 0, 'client', '2023-12-22 02:38:47', '2023-12-22 03:47:00', NULL),
(685, 'T-195d1c164b47', 500, 1, '/home', '60.74', NULL, '1', 0, 'client', '2023-12-22 02:39:15', '2023-12-22 03:15:00', NULL),
(686, 'T-ee0ecd7c59c7', 501, 1, '/blog', '201.55', NULL, '1', 0, 'client', '2023-12-22 02:39:16', '2023-12-22 03:16:00', NULL),
(687, 'T-9da7f01528ac', 502, 1, '/blog/preview/A-bef60b9d5d68-UnveilingtheInnovationsShapingOurFuture', '33.52', NULL, '1', 0, 'client', '2023-12-22 02:39:20', '2023-12-22 03:20:00', NULL),
(688, 'T-675a396fd960', 503, 1, '/blog', '45.12', NULL, '1', 0, 'client', '2023-12-22 02:39:23', '2023-12-22 03:23:00', NULL),
(689, 'T-b90fda6735d0', 504, 1, '/blog/preview/A-36cdf725e31e-IDEA-IntegratedDevelopmentEnvironmentforAutomation', '31.38', NULL, '1', 0, 'client', '2023-12-22 02:39:24', '2023-12-22 03:24:00', NULL),
(690, 'T-6b1af14f8091', 505, 1, '/blog', '50.49', NULL, '1', 0, 'client', '2023-12-22 02:39:26', '2023-12-22 03:26:00', NULL);
INSERT INTO `traffic` (`uid`, `guide`, `visitor_id`, `registered_id`, `page_url`, `page_load_time`, `queries`, `response`, `reloaded`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(691, 'T-a114779ed271', 506, 1, '/blog/preview/A-294f7301084f-IntroducingtheQualityControlAI', '32.38', NULL, '1', 0, 'client', '2023-12-22 02:39:28', '2023-12-22 03:28:00', NULL),
(692, 'T-5f10929d77d5', 507, 1, '/blog', '48.66', NULL, '1', 0, 'client', '2023-12-22 02:39:32', '2023-12-22 03:32:00', NULL),
(693, 'T-df91885b9293', 508, 1, '/websites', '51.38', NULL, '1', 0, 'client', '2023-12-22 02:39:48', '2023-12-22 03:48:00', NULL),
(694, 'T-56b51645ef60', 509, 1, '/websites/preview/A-5e79d3b231c6-MobileTechZone', '30.73', NULL, '1', 0, 'client', '2023-12-22 02:39:51', '2023-12-22 03:51:00', NULL),
(695, 'T-a9bdba5981e4', 510, 1, '/websites', '48.51', NULL, '1', 0, 'client', '2023-12-22 02:39:53', '2023-12-22 03:53:00', NULL),
(696, 'T-4a8894e9ab88', 511, 1, '/websites/preview/A-304f448137de-HandySalzburg', '30.80', NULL, '1', 0, 'client', '2023-12-22 02:39:55', '2023-12-22 03:55:00', NULL),
(697, 'T-ecb59c76e7d2', 512, 1, '/websites', '49.46', NULL, '1', 0, 'client', '2023-12-22 02:39:58', '2023-12-22 03:58:00', NULL),
(698, 'T-89c9ab139900', 513, 1, '/websites/preview/A-0876acfceb99-Cemani', '33.10', NULL, '1', 0, 'client', '2023-12-22 02:40:01', '2023-12-22 03:01:00', NULL),
(699, 'T-8924c2f44078', 514, 1, '/websites', '57.52', NULL, '1', 0, 'client', '2023-12-22 02:40:03', '2023-12-22 03:03:00', NULL),
(700, 'T-0db53902e722', 515, 1, '/websites/preview/A-6a1f16c47a5e-Grandmasterss', '35.35', NULL, '1', 0, 'client', '2023-12-22 02:40:05', '2023-12-22 03:05:00', NULL),
(701, 'T-48ecc9f16881', 516, 1, '/websites', '119.50', NULL, '1', 0, 'client', '2023-12-22 02:40:11', '2023-12-22 03:11:00', NULL),
(702, 'T-388bdcb53da5', 517, 1, '/websites/preview/A-c6bdf71df6d3-SabriMontagen', '32.80', NULL, '1', 0, 'client', '2023-12-22 02:40:14', '2023-12-22 03:14:00', NULL),
(703, 'T-eb916761c6c5', 518, 1, '/websites', '48.22', NULL, '1', 0, 'client', '2023-12-22 02:40:21', '2023-12-22 03:21:00', NULL),
(704, 'T-c2941127d81b', 519, NULL, '/', '76.85', NULL, '1', 0, 'client', '2023-12-22 03:21:37', '2023-12-22 04:37:00', NULL),
(705, 'T-a986b6e2adc4', 520, NULL, '/login', '9.45', NULL, '1', 0, 'client', '2023-12-22 03:21:55', '2023-12-22 04:55:00', NULL),
(706, 'T-56b14ebabe30', 521, NULL, '/forgot/password', '6.81', NULL, '1', 0, 'client', '2023-12-22 03:21:59', '2023-12-22 04:59:00', NULL),
(707, 'T-9c738ada6b93', 522, NULL, '/', '64.23', NULL, '1', 0, 'client', '2023-12-22 03:24:44', '2023-12-22 04:44:00', NULL),
(708, 'T-6d79b181c26d', 523, NULL, '/', '59.76', NULL, '1', 0, 'client', '2023-12-22 03:24:56', '2023-12-22 04:56:00', NULL),
(709, 'T-da04a5dc820b', 524, NULL, '/', '62.44', NULL, '1', 0, 'client', '2023-12-22 03:25:28', '2023-12-22 04:28:00', NULL),
(710, 'T-1187cd25c49e', 525, NULL, '/', '64.41', NULL, '1', 0, 'client', '2023-12-22 03:25:40', '2023-12-22 04:40:00', NULL),
(711, 'T-a02dd22a92f3', 526, NULL, '/forgot/password', '8.37', NULL, '1', 0, 'client', '2023-12-22 03:27:53', '2023-12-22 04:53:00', NULL),
(712, 'T-36c060988a25', 527, NULL, '/forgot/password', '7.91', NULL, '1', 0, 'client', '2023-12-22 03:30:12', '2023-12-22 04:12:00', NULL),
(713, 'T-808d0f85500c', 528, NULL, '/', '60.86', NULL, '1', 0, 'client', '2023-12-22 03:39:20', '2023-12-22 04:20:00', NULL),
(714, 'T-a689297211d3', 529, 1, '/dashboard', '552.51', NULL, '1', 153, 'client', '2023-12-23 17:58:42', '2023-12-24 06:10:00', NULL),
(715, 'T-1e09f1adec84', 529, NULL, '/login', '431.09', NULL, '1', 0, 'client', '2023-12-24 02:59:23', '2023-12-24 03:23:00', NULL),
(716, 'T-072ba0253a31', 529, 1, '/profile', '377.49', NULL, '1', 0, 'client', '2023-12-24 02:59:38', '2023-12-24 03:38:00', NULL),
(717, 'T-8e22a6b272d9', 529, 1, '/', '845.68', NULL, '1', 0, 'client', '2023-12-24 04:17:21', '2023-12-24 05:21:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usergroup`
--

CREATE TABLE `usergroup` (
  `uid` int(11) NOT NULL,
  `guide` char(14) NOT NULL,
  `user_id` int(33) NOT NULL,
  `group_id` int(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usergroup`
--

INSERT INTO `usergroup` (`uid`, `guide`, `user_id`, `group_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'S-DEFAULTGROUP', 1, 1, '2023-12-14 05:10:25', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `guide` char(14) NOT NULL,
  `type` char(33) NOT NULL DEFAULT 'account',
  `roles` char(11) NOT NULL DEFAULT 'none',
  `name` char(33) NOT NULL,
  `firstname` char(55) DEFAULT NULL,
  `lastname` char(55) DEFAULT NULL,
  `email` char(33) NOT NULL,
  `password` char(255) NOT NULL,
  `avatar` char(255) DEFAULT NULL,
  `activation` char(11) NOT NULL DEFAULT 'ENABLE',
  `last_active_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `guide`, `type`, `roles`, `name`, `firstname`, `lastname`, `email`, `password`, `avatar`, `activation`, `last_active_timestamp`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'U-DEVELOPER001', 'account', 'DEV', 'developer', NULL, NULL, 'developer@email.com', '$2y$10$vNPcaPlOmstGKqnGbemdG.NRmh6Sz76KGHhpxmZpYdvmLZ3c/p1hu', '/uploads/U-DEVELOPER001/avatar/file_6588f6ef1a5f2.jpg', 'ENABLE', '2023-12-14 05:10:21', '2023-12-14 05:10:21', '2023-12-25 04:47:00', NULL),
(2, 'U-MONITORING01', 'account', 'MONITORING', 'monitoring', NULL, NULL, 'monitoring@email.com', '$2y$10$vNPcaPlOmstGKqnGbemdG.NRmh6Sz76KGHhpxmZpYdvmLZ3c/p1hu', NULL, 'ENABLE', '2023-12-14 05:10:21', '2023-12-14 05:10:21', NULL, NULL),
(3, 'U-GUEST0000001', 'account', 'GUEST', 'guest', NULL, NULL, 'guest@email.com', '$2y$10$vNPcaPlOmstGKqnGbemdG.NRmh6Sz76KGHhpxmZpYdvmLZ3c/p1hu', NULL, 'ENABLE', '2023-12-14 05:10:21', '2023-12-14 05:10:21', NULL, NULL),
(5, 'U-ADMIN0000001', 'account', 'ADMIN', 'admin', NULL, NULL, 'admin@email.com', '$2y$10$vNPcaPlOmstGKqnGbemdG.NRmh6Sz76KGHhpxmZpYdvmLZ3c/p1hu', NULL, 'ENABLE', '2023-12-14 05:10:21', '2023-12-14 05:10:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `uid` int(11) NOT NULL,
  `guide` char(14) NOT NULL,
  `ip_address` char(33) DEFAULT '-1',
  `session` char(255) DEFAULT '-1',
  `user_agent` char(255) DEFAULT NULL,
  `language` char(255) DEFAULT NULL,
  `os` char(255) DEFAULT NULL,
  `browser` char(255) DEFAULT NULL,
  `device` char(255) DEFAULT NULL,
  `country` char(255) DEFAULT NULL,
  `first_visit_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_visit_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`uid`, `guide`, `ip_address`, `session`, `user_agent`, `language`, `os`, `browser`, `device`, `country`, `first_visit_timestamp`, `last_visit_timestamp`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'V-c1d29d84face', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 03:12:51', '2024-01-25 03:32:28', '2024-01-17 03:12:51', '2023-12-06 04:51:00', NULL),
(2, 'V-9b0aff799693', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 03:12:53', '2023-12-06 03:12:53', '2023-12-06 03:12:53', '2023-12-06 04:53:00', NULL),
(3, 'V-33e651123635', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 03:12:54', '2023-12-06 03:12:54', '2023-12-06 03:12:54', '2023-12-06 04:54:00', NULL),
(4, 'V-73cde44b0ac0', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 03:12:55', '2023-12-06 03:12:55', '2023-12-06 03:12:55', '2023-12-06 04:55:00', NULL),
(5, 'V-0ef22115fd77', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 03:12:56', '2023-12-06 03:12:56', '2023-12-06 03:12:56', '2023-12-06 04:56:00', NULL),
(6, 'V-9bf6cc83904d', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 03:14:02', '2023-12-06 03:14:02', '2023-12-06 03:14:02', '2023-12-06 04:02:00', NULL),
(7, 'V-62e01b22faa6', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 03:14:04', '2023-12-06 03:14:04', '2023-12-06 03:14:04', '2023-12-06 04:04:00', NULL),
(8, 'V-65950d276991', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 03:17:04', '2023-12-06 03:17:04', '2023-12-06 03:17:04', '2023-12-06 04:04:00', NULL),
(9, 'V-35fb971567f7', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 03:17:19', '2023-12-06 03:17:19', '2023-12-06 03:17:19', '2023-12-06 04:19:00', NULL),
(10, 'V-e71d7647e0bd', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 03:17:55', '2023-12-06 03:17:55', '2023-12-06 03:17:55', '2023-12-06 04:55:00', NULL),
(11, 'V-a0be0d377cda', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 03:17:57', '2023-12-06 03:17:57', '2023-12-06 03:17:57', '2023-12-06 04:57:00', NULL),
(12, 'V-6ead37a71d4f', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 03:17:59', '2023-12-06 03:17:59', '2023-12-06 03:17:59', '2023-12-06 04:59:00', NULL),
(13, 'V-d0ef2b4ba867', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 03:18:01', '2023-12-06 03:18:01', '2023-12-06 03:18:01', '2023-12-06 04:01:00', NULL),
(14, 'V-71a2637c3c97', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 03:18:22', '2023-12-06 03:18:22', '2023-12-06 03:18:22', '2023-12-06 04:22:00', NULL),
(15, 'V-571b5f763bfa', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 03:18:23', '2023-12-06 03:18:23', '2023-12-06 03:18:23', '2023-12-06 04:23:00', NULL),
(16, 'V-915456b97f82', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 03:18:24', '2023-12-06 03:18:24', '2023-12-06 03:18:24', '2023-12-06 04:24:00', NULL),
(17, 'V-2f0a4085737d', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 03:18:27', '2023-12-06 03:18:27', '2023-12-06 03:18:27', '2023-12-06 04:27:00', NULL),
(18, 'V-db78c554857f', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 03:18:28', '2023-12-06 03:18:28', '2023-12-06 03:18:28', '2023-12-06 04:28:00', NULL),
(19, 'V-58ce59229fb0', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 03:18:31', '2023-12-06 03:18:31', '2023-12-06 03:18:31', '2023-12-06 04:31:00', NULL),
(20, 'V-b101d1775b46', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 03:18:33', '2023-12-06 03:18:33', '2023-12-06 03:18:33', '2023-12-06 04:33:00', NULL),
(21, 'V-667fc7b58cd5', '43.131.48.214', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-06 03:44:11', '2023-12-06 03:44:11', '2023-12-06 03:44:11', '2023-12-06 04:11:00', NULL),
(22, 'V-7205e4557c19', '34.138.187.194', 'tdnve83mkum4af5gii49u8gaft', 'zoominfobot (zoominfobot at zoominfo dot com)', 'en-us,en-gb,en;q=0.7,*;q=0.3', NULL, NULL, 'desktop', NULL, '2023-12-06 03:57:19', '2023-12-06 03:57:19', '2023-12-06 03:57:19', '2023-12-06 04:19:00', NULL),
(23, 'V-b465db946b2c', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 04:12:28', '2023-12-06 04:12:28', '2023-12-06 04:12:28', '2023-12-06 05:28:00', NULL),
(24, 'V-170894913626', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 04:12:36', '2023-12-06 04:12:36', '2023-12-06 04:12:36', '2023-12-06 05:36:00', NULL),
(25, 'V-de880579799b', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 04:12:42', '2023-12-06 04:12:42', '2023-12-06 04:12:42', '2023-12-06 05:42:00', NULL),
(26, 'V-27e99875f136', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 04:12:43', '2023-12-06 04:12:43', '2023-12-06 04:12:43', '2023-12-06 05:43:00', NULL),
(27, 'V-fa8b66578aff', '2a02:8388:a181:1a00:c0fe:416a:63e', 'utj0in7f0d854q7j5eef5jrcm0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 04:14:11', '2023-12-06 04:14:11', '2023-12-06 04:14:11', '2023-12-06 05:11:00', NULL),
(28, 'V-0a28b6b053a9', '135.148.195.1', '-1', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) chrome/112.0.0.0 safari/537.36', 'zh-CN,zh;q=0.9,en;q=0.8', 'linux', 'chrome', 'desktop', NULL, '2023-12-06 04:16:06', '2023-12-06 04:16:06', '2023-12-06 04:16:06', '2023-12-06 05:06:00', NULL),
(29, 'V-26f26a123370', '2a02:8388:a181:1a00:c0fe:416a:63e', 'rnchle4qac8p2qqfv16pbv8umn', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 04:17:49', '2023-12-06 04:17:49', '2023-12-06 04:17:49', '2023-12-06 05:49:00', NULL),
(30, 'V-f8de3cf30829', '2a02:8388:a181:1a00:c0fe:416a:63e', 'rnchle4qac8p2qqfv16pbv8umn', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 04:17:55', '2023-12-06 04:17:55', '2023-12-06 04:17:55', '2023-12-06 05:55:00', NULL),
(31, 'V-7db608a9f492', '2a02:8388:a181:1a00:c0fe:416a:63e', 'rnchle4qac8p2qqfv16pbv8umn', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 04:17:59', '2023-12-06 04:17:59', '2023-12-06 04:17:59', '2023-12-06 05:59:00', NULL),
(32, 'V-dd4701b55a65', '2a02:8388:a181:1a00:c0fe:416a:63e', 'rnchle4qac8p2qqfv16pbv8umn', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 04:18:03', '2023-12-06 04:18:03', '2023-12-06 04:18:03', '2023-12-06 05:03:00', NULL),
(33, 'V-d62122592b64', '2a02:8388:a181:1a00:c0fe:416a:63e', 'rnchle4qac8p2qqfv16pbv8umn', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 04:18:06', '2023-12-06 04:18:06', '2023-12-06 04:18:06', '2023-12-06 05:06:00', NULL),
(34, 'V-dc2baf2f579c', '2a02:8388:a181:1a00:c0fe:416a:63e', 'rnchle4qac8p2qqfv16pbv8umn', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 04:19:47', '2023-12-06 04:19:47', '2023-12-06 04:19:47', '2023-12-06 05:47:00', NULL),
(35, 'V-5533cb05a86a', '2a02:8388:a181:1a00:c0fe:416a:63e', 'rnchle4qac8p2qqfv16pbv8umn', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 04:19:49', '2023-12-06 04:19:49', '2023-12-06 04:19:49', '2023-12-06 05:49:00', NULL),
(36, 'V-1e5e3c5aa36c', '2a02:8388:a181:1a00:c0fe:416a:63e', 'rnchle4qac8p2qqfv16pbv8umn', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 04:19:53', '2023-12-06 04:19:53', '2023-12-06 04:19:53', '2023-12-06 05:53:00', NULL),
(37, 'V-272d0d559808', '2a02:8388:a181:1a00:c0fe:416a:63e', 'rnchle4qac8p2qqfv16pbv8umn', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 04:20:40', '2023-12-06 04:20:40', '2023-12-06 04:20:40', '2023-12-06 05:40:00', NULL),
(38, 'V-9205fea9ab5e', '2a02:8388:a181:1a00:c0fe:416a:63e', 'rnchle4qac8p2qqfv16pbv8umn', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 04:20:48', '2023-12-06 04:20:48', '2023-12-06 04:20:48', '2023-12-06 05:48:00', NULL),
(39, 'V-518f5827c9c2', '2a02:8388:a181:1a00:c0fe:416a:63e', 'rnchle4qac8p2qqfv16pbv8umn', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 04:20:50', '2023-12-06 04:20:50', '2023-12-06 04:20:50', '2023-12-06 05:50:00', NULL),
(40, 'V-56636f159dab', '2a02:8388:a181:1a00:c0fe:416a:63e', 'rnchle4qac8p2qqfv16pbv8umn', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 04:21:19', '2023-12-06 04:21:19', '2023-12-06 04:21:19', '2023-12-06 05:19:00', NULL),
(41, 'V-5d6c11133d61', '2a02:8388:a181:1a00:c0fe:416a:63e', 'rnchle4qac8p2qqfv16pbv8umn', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 04:21:24', '2023-12-06 04:21:24', '2023-12-06 04:21:24', '2023-12-06 05:24:00', NULL),
(42, 'V-9074357070f0', '2a02:8388:a181:1a00:c0fe:416a:63e', 'rnchle4qac8p2qqfv16pbv8umn', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 04:25:27', '2023-12-06 04:25:27', '2023-12-06 04:25:27', '2023-12-06 05:27:00', NULL),
(43, 'V-c0f2e6e28b4b', '2a02:8388:a181:1a00:f5d8:3254:eb3', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:10:42', '2023-12-06 05:10:42', '2023-12-06 05:10:42', '2023-12-06 06:42:00', NULL),
(44, 'V-9d9e732bea9d', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:10:50', '2023-12-06 05:10:50', '2023-12-06 05:10:50', '2023-12-06 06:50:00', NULL),
(45, 'V-a0c30bba5208', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:10:59', '2023-12-06 05:10:59', '2023-12-06 05:10:59', '2023-12-06 06:59:00', NULL),
(46, 'V-333b558f2bc4', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:12:39', '2023-12-06 05:12:39', '2023-12-06 05:12:39', '2023-12-06 06:39:00', NULL),
(47, 'V-8c887625a2f3', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:17:37', '2023-12-06 05:17:37', '2023-12-06 05:17:37', '2023-12-06 06:37:00', NULL),
(48, 'V-0ec906bae191', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:17:45', '2023-12-06 05:17:45', '2023-12-06 05:17:45', '2023-12-06 06:45:00', NULL),
(49, 'V-175bdd727aed', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:19:45', '2023-12-06 05:19:45', '2023-12-06 05:19:45', '2023-12-06 06:45:00', NULL),
(50, 'V-5bfd7199ca34', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:19:50', '2023-12-06 05:19:50', '2023-12-06 05:19:50', '2023-12-06 06:50:00', NULL),
(51, 'V-f20bb6d7e084', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:19:52', '2023-12-06 05:19:52', '2023-12-06 05:19:52', '2023-12-06 06:52:00', NULL),
(52, 'V-bc1c44949bd6', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:22:40', '2023-12-06 05:22:40', '2023-12-06 05:22:40', '2023-12-06 06:40:00', NULL),
(53, 'V-c9789fd09b6b', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:22:59', '2023-12-06 05:22:59', '2023-12-06 05:22:59', '2023-12-06 06:59:00', NULL),
(54, 'V-d87c3018430e', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:23:05', '2023-12-06 05:23:05', '2023-12-06 05:23:05', '2023-12-06 06:05:00', NULL),
(55, 'V-9c726852fc5c', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:23:08', '2023-12-06 05:23:08', '2023-12-06 05:23:08', '2023-12-06 06:08:00', NULL),
(56, 'V-4809b88ad85c', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:23:11', '2023-12-06 05:23:11', '2023-12-06 05:23:11', '2023-12-06 06:11:00', NULL),
(57, 'V-7d5bd24391ab', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:25:51', '2023-12-06 05:25:51', '2023-12-06 05:25:51', '2023-12-06 06:51:00', NULL),
(58, 'V-35f6f1c2d3e1', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:25:57', '2023-12-06 05:25:57', '2023-12-06 05:25:57', '2023-12-06 06:57:00', NULL),
(59, 'V-d0ffc23b6fe0', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:26:03', '2023-12-06 05:26:03', '2023-12-06 05:26:03', '2023-12-06 06:03:00', NULL),
(60, 'V-e5345eee27c9', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:26:14', '2023-12-06 05:26:14', '2023-12-06 05:26:14', '2023-12-06 06:14:00', NULL),
(61, 'V-6edb6f7d978b', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:26:16', '2023-12-06 05:26:16', '2023-12-06 05:26:16', '2023-12-06 06:16:00', NULL),
(62, 'V-7ff175d573f2', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:40:08', '2023-12-06 05:40:08', '2023-12-06 05:40:08', '2023-12-06 06:08:00', NULL),
(63, 'V-c50156861b69', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:40:15', '2023-12-06 05:40:15', '2023-12-06 05:40:15', '2023-12-06 06:15:00', NULL),
(64, 'V-410c39d214c3', '66.249.81.1', 'kcf0utp3aks0sjrjkdedg3luk1', 'mozilla/5.0 (macintosh; intel mac os x 10_15_7) applewebkit/537.36 (khtml, like gecko) chrome/94.0.4590.2 safari/537.36 chrome-lighthouse', 'en-US', 'mac os catalina', 'chrome', 'desktop', NULL, '2023-12-06 05:40:33', '2023-12-06 05:40:33', '2023-12-06 05:40:33', '2023-12-06 06:33:00', NULL),
(65, 'V-665ccec9d50c', '66.102.9.171', 'dtgb5b4eftqaq8poli1tbbgp05', 'mozilla/5.0 (linux; android 7.0; moto g (4)) applewebkit/537.36 (khtml, like gecko) chrome/94.0.4590.2 mobile safari/537.36 chrome-lighthouse', 'en-US', 'android', 'chrome', 'mobile', NULL, '2023-12-06 05:40:34', '2023-12-06 05:40:34', '2023-12-06 05:40:34', '2023-12-06 06:34:00', NULL),
(66, 'V-594a45ec36cb', '66.249.81.3', 'kcf0utp3aks0sjrjkdedg3luk1', 'mozilla/5.0 (macintosh; intel mac os x 10_15_7) applewebkit/537.36 (khtml, like gecko) chrome/94.0.4590.2 safari/537.36 chrome-lighthouse', 'en-US', 'mac os catalina', 'chrome', 'desktop', NULL, '2023-12-06 05:40:38', '2023-12-06 05:40:38', '2023-12-06 05:40:38', '2023-12-06 06:38:00', NULL),
(67, 'V-6c57be068026', '66.102.9.163', 'dtgb5b4eftqaq8poli1tbbgp05', 'mozilla/5.0 (linux; android 7.0; moto g (4)) applewebkit/537.36 (khtml, like gecko) chrome/94.0.4590.2 mobile safari/537.36 chrome-lighthouse', 'en-US', 'android', 'chrome', 'mobile', NULL, '2023-12-06 05:40:40', '2023-12-06 05:40:40', '2023-12-06 05:40:40', '2023-12-06 06:40:00', NULL),
(68, 'V-1e7c8d4f9326', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:41:33', '2023-12-06 05:41:33', '2023-12-06 05:41:33', '2023-12-06 06:33:00', NULL),
(69, 'V-d8f2e397916d', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:41:36', '2023-12-06 05:41:36', '2023-12-06 05:41:36', '2023-12-06 06:36:00', NULL),
(70, 'V-d4d67bc695d3', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:41:38', '2023-12-06 05:41:38', '2023-12-06 05:41:38', '2023-12-06 06:38:00', NULL),
(71, 'V-e90f23a3b182', '66.249.81.6', '-1', 'mozilla/5.0 (linux; android 7.0; moto g (4)) applewebkit/537.36 (khtml, like gecko) chrome/94.0.4590.2 mobile safari/537.36 chrome-lighthouse', 'en-US', 'android', 'chrome', 'mobile', NULL, '2023-12-06 05:41:44', '2023-12-06 05:41:44', '2023-12-06 05:41:44', '2023-12-06 06:44:00', NULL),
(72, 'V-6330f06d1d4b', '66.249.81.8', '-1', 'mozilla/5.0 (macintosh; intel mac os x 10_15_7) applewebkit/537.36 (khtml, like gecko) chrome/94.0.4590.2 safari/537.36 chrome-lighthouse', 'en-US', 'mac os catalina', 'chrome', 'desktop', NULL, '2023-12-06 05:41:45', '2023-12-06 05:41:45', '2023-12-06 05:41:45', '2023-12-06 06:45:00', NULL),
(73, 'V-947334bfcc81', '66.249.93.225', '-1', 'mozilla/5.0 (macintosh; intel mac os x 10_15_7) applewebkit/537.36 (khtml, like gecko) chrome/94.0.4590.2 safari/537.36 chrome-lighthouse', 'en-US', 'mac os catalina', 'chrome', 'desktop', NULL, '2023-12-06 05:41:48', '2023-12-06 05:41:48', '2023-12-06 05:41:48', '2023-12-06 06:48:00', NULL),
(74, 'V-177ce3bc60d1', '66.102.9.163', '-1', 'mozilla/5.0 (linux; android 7.0; moto g (4)) applewebkit/537.36 (khtml, like gecko) chrome/94.0.4590.2 mobile safari/537.36 chrome-lighthouse', 'en-US', 'android', 'chrome', 'mobile', NULL, '2023-12-06 05:41:48', '2023-12-06 05:41:48', '2023-12-06 05:41:48', '2023-12-06 06:48:00', NULL),
(75, 'V-42dbd3cf125c', '66.249.93.231', 'a3llejsa0putm8bn1v4t0fq14a', 'mozilla/5.0 (macintosh; intel mac os x 10_15_7) applewebkit/537.36 (khtml, like gecko) chrome/94.0.4590.2 safari/537.36 chrome-lighthouse', 'en-US', 'mac os catalina', 'chrome', 'desktop', NULL, '2023-12-06 05:41:54', '2023-12-06 05:41:54', '2023-12-06 05:41:54', '2023-12-06 06:54:00', NULL),
(76, 'V-09fcb76afabf', '66.102.9.171', 'kahd3b16uo5oteqfabl2qlmdkt', 'mozilla/5.0 (linux; android 7.0; moto g (4)) applewebkit/537.36 (khtml, like gecko) chrome/94.0.4590.2 mobile safari/537.36 chrome-lighthouse', 'en-US', 'android', 'chrome', 'mobile', NULL, '2023-12-06 05:41:55', '2023-12-06 05:41:55', '2023-12-06 05:41:55', '2023-12-06 06:55:00', NULL),
(77, 'V-1dc85c52f30e', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:44:02', '2023-12-06 05:44:02', '2023-12-06 05:44:02', '2023-12-06 06:02:00', NULL),
(78, 'V-e50cf4cbf162', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:46:02', '2023-12-06 05:46:02', '2023-12-06 05:46:02', '2023-12-06 06:02:00', NULL),
(79, 'V-854e76267809', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:47:05', '2023-12-06 05:47:05', '2023-12-06 05:47:05', '2023-12-06 06:05:00', NULL),
(80, 'V-935ce421675a', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:47:50', '2023-12-06 05:47:50', '2023-12-06 05:47:50', '2023-12-06 06:50:00', NULL),
(81, 'V-886852cbbe2c', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:47:56', '2023-12-06 05:47:56', '2023-12-06 05:47:56', '2023-12-06 06:56:00', NULL),
(82, 'V-32ca3b4f4328', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:48:01', '2023-12-06 05:48:01', '2023-12-06 05:48:01', '2023-12-06 06:01:00', NULL),
(83, 'V-8031dd44a19c', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:50:08', '2023-12-06 05:50:08', '2023-12-06 05:50:08', '2023-12-06 06:08:00', NULL),
(84, 'V-ad9373ccc511', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:50:13', '2023-12-06 05:50:13', '2023-12-06 05:50:13', '2023-12-06 06:13:00', NULL),
(85, 'V-a519de4562df', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:50:42', '2023-12-06 05:50:42', '2023-12-06 05:50:42', '2023-12-06 06:42:00', NULL),
(86, 'V-7c36c257fba6', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:52:27', '2023-12-06 05:52:27', '2023-12-06 05:52:27', '2023-12-06 06:27:00', NULL),
(87, 'V-c176f4b2f727', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:52:48', '2023-12-06 05:52:48', '2023-12-06 05:52:48', '2023-12-06 06:48:00', NULL),
(88, 'V-3fe90ea3de12', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:52:57', '2023-12-06 05:52:57', '2023-12-06 05:52:57', '2023-12-06 06:57:00', NULL),
(89, 'V-879719adbfb6', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:55:17', '2023-12-06 05:55:17', '2023-12-06 05:55:17', '2023-12-06 06:17:00', NULL),
(90, 'V-49d31c945180', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:56:31', '2023-12-06 05:56:31', '2023-12-06 05:56:31', '2023-12-06 06:31:00', NULL),
(91, 'V-41dc62d1043d', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:56:33', '2023-12-06 05:56:33', '2023-12-06 05:56:33', '2023-12-06 06:33:00', NULL),
(92, 'V-ad4baa41dae9', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:58:15', '2023-12-06 05:58:15', '2023-12-06 05:58:15', '2023-12-06 06:15:00', NULL),
(93, 'V-9cb01ab97567', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:58:18', '2023-12-06 05:58:18', '2023-12-06 05:58:18', '2023-12-06 06:18:00', NULL),
(94, 'V-e7d7c0250101', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:58:20', '2023-12-06 05:58:20', '2023-12-06 05:58:20', '2023-12-06 06:20:00', NULL),
(95, 'V-7e00898a512c', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 05:59:45', '2023-12-06 05:59:45', '2023-12-06 05:59:45', '2023-12-06 06:45:00', NULL),
(96, 'V-54a337121819', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 06:00:25', '2023-12-06 06:00:25', '2023-12-06 06:00:25', '2023-12-06 07:25:00', NULL),
(97, 'V-8742cb1ecf36', '2a02:8388:a181:1a00:f5d8:3254:eb3', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 06:00:27', '2023-12-06 06:00:27', '2023-12-06 06:00:27', '2023-12-06 07:27:00', NULL),
(98, 'V-5f1b0ff2bd8f', '185.166.84.142', '-1', 'mozilla/5.0 (macintosh; intel mac os x 11_0_0) applewebkit/537.36 (khtml, like gecko) chrome/87.0.4280.88 safari/537.36', 'en', 'mac os', 'chrome', 'desktop', NULL, '2023-12-06 07:49:29', '2023-12-06 07:49:29', '2023-12-06 07:49:29', '2023-12-06 08:29:00', NULL),
(99, 'V-56b90b9e4725', '2a02:8388:a181:1a00:f5d8:3254:eb3', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 07:52:52', '2023-12-06 07:52:52', '2023-12-06 07:52:52', '2023-12-06 08:52:00', NULL),
(100, 'V-b4534f2519da', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 09:41:47', '2023-12-06 09:41:47', '2023-12-06 09:41:47', '2023-12-06 10:47:00', NULL),
(101, 'V-3fd671fba717', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 09:44:50', '2023-12-06 09:44:50', '2023-12-06 09:44:50', '2023-12-06 10:50:00', NULL),
(102, 'V-c8897753afbe', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 09:45:00', '2023-12-06 09:45:00', '2023-12-06 09:45:00', '2023-12-06 10:00:00', NULL),
(103, 'V-805713c6b0da', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 09:45:03', '2023-12-06 09:45:03', '2023-12-06 09:45:03', '2023-12-06 10:03:00', NULL),
(104, 'V-af1ecd389041', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 09:45:07', '2023-12-06 09:45:07', '2023-12-06 09:45:07', '2023-12-06 10:07:00', NULL),
(105, 'V-7b140826b18a', '2a02:8388:a181:1a00:29f6:4cc0:3a1', '-1', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-06 09:52:14', '2023-12-06 09:52:14', '2023-12-06 09:52:14', '2023-12-06 10:14:00', NULL),
(106, 'V-45dd1160dd5a', '2a02:8388:a181:1a00:29f6:4cc0:3a1', 'id24qsqg0akt340bb8siacc2r4', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-06 09:52:25', '2023-12-06 09:52:25', '2023-12-06 09:52:25', '2023-12-06 10:25:00', NULL),
(107, 'V-911bdbec0d68', '2a02:8388:a181:1a00:29f6:4cc0:3a1', 'id24qsqg0akt340bb8siacc2r4', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-06 09:52:35', '2023-12-06 09:52:35', '2023-12-06 09:52:35', '2023-12-06 10:35:00', NULL),
(108, 'V-099a89637f4f', '2a02:8388:a181:1a00:29f6:4cc0:3a1', 'id24qsqg0akt340bb8siacc2r4', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-06 09:52:42', '2023-12-06 09:52:42', '2023-12-06 09:52:42', '2023-12-06 10:42:00', NULL),
(109, 'V-794d08b56948', '2a02:8388:a181:1a00:29f6:4cc0:3a1', 'id24qsqg0akt340bb8siacc2r4', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-06 09:52:46', '2023-12-06 09:52:46', '2023-12-06 09:52:46', '2023-12-06 10:46:00', NULL),
(110, 'V-a26fb2decaaf', '2a02:8388:a181:1a00:29f6:4cc0:3a1', 'id24qsqg0akt340bb8siacc2r4', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-06 09:52:53', '2023-12-06 09:52:53', '2023-12-06 09:52:53', '2023-12-06 10:53:00', NULL),
(111, 'V-99cf9d61b9e3', '2a02:8388:a181:1a00:29f6:4cc0:3a1', 'id24qsqg0akt340bb8siacc2r4', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-06 09:52:55', '2023-12-06 09:52:55', '2023-12-06 09:52:55', '2023-12-06 10:55:00', NULL),
(112, 'V-6937a8436c96', '2a02:8388:a181:1a00:29f6:4cc0:3a1', 'id24qsqg0akt340bb8siacc2r4', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-06 09:53:00', '2023-12-06 09:53:00', '2023-12-06 09:53:00', '2023-12-06 10:00:00', NULL),
(113, 'V-9f47400d73a8', '2a02:8388:a181:1a00:29f6:4cc0:3a1', 'id24qsqg0akt340bb8siacc2r4', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-06 09:53:02', '2023-12-06 09:53:02', '2023-12-06 09:53:02', '2023-12-06 10:02:00', NULL),
(114, 'V-127ff4897453', '2a02:8388:a181:1a00:29f6:4cc0:3a1', 'id24qsqg0akt340bb8siacc2r4', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-06 09:53:06', '2023-12-06 09:53:06', '2023-12-06 09:53:06', '2023-12-06 10:06:00', NULL),
(115, 'V-e7670cd5c828', '2a02:8388:a181:1a00:29f6:4cc0:3a1', 'id24qsqg0akt340bb8siacc2r4', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-06 09:53:10', '2023-12-06 09:53:10', '2023-12-06 09:53:10', '2023-12-06 10:10:00', NULL),
(116, 'V-8b44cd85233f', '2a02:8388:a181:1a00:29f6:4cc0:3a1', 'id24qsqg0akt340bb8siacc2r4', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-06 09:53:12', '2023-12-06 09:53:12', '2023-12-06 09:53:12', '2023-12-06 10:12:00', NULL),
(117, 'V-b1fb2d2d47eb', '2a02:8388:a181:1a00:29f6:4cc0:3a1', 'id24qsqg0akt340bb8siacc2r4', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-06 09:53:17', '2023-12-06 09:53:17', '2023-12-06 09:53:17', '2023-12-06 10:17:00', NULL),
(118, 'V-b12ab27f8669', '2a02:8388:a181:1a00:29f6:4cc0:3a1', 'id24qsqg0akt340bb8siacc2r4', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-06 09:53:22', '2023-12-06 09:53:22', '2023-12-06 09:53:22', '2023-12-06 10:22:00', NULL),
(119, 'V-72945ac61a53', '2a02:8388:a181:1a00:29f6:4cc0:3a1', 'id24qsqg0akt340bb8siacc2r4', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-06 09:53:25', '2023-12-06 09:53:25', '2023-12-06 09:53:25', '2023-12-06 10:25:00', NULL),
(120, 'V-6545bb4276f3', '2a02:8388:a181:1a00:29f6:4cc0:3a1', 'id24qsqg0akt340bb8siacc2r4', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-06 09:53:27', '2023-12-06 09:53:27', '2023-12-06 09:53:27', '2023-12-06 10:27:00', NULL),
(121, 'V-53bcb5603a56', '2a02:8388:a181:1a00:29f6:4cc0:3a1', 'id24qsqg0akt340bb8siacc2r4', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-06 09:53:35', '2023-12-06 09:53:35', '2023-12-06 09:53:35', '2023-12-06 10:35:00', NULL),
(122, 'V-3f1a36359400', '2a02:8388:a181:1a00:29f6:4cc0:3a1', 'id24qsqg0akt340bb8siacc2r4', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-06 09:53:59', '2023-12-06 09:53:59', '2023-12-06 09:53:59', '2023-12-06 10:59:00', NULL),
(123, 'V-06fc8b5a3dd7', '2a02:8388:a181:1a00:29f6:4cc0:3a1', 'id24qsqg0akt340bb8siacc2r4', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-06 09:54:04', '2023-12-06 09:54:04', '2023-12-06 09:54:04', '2023-12-06 10:04:00', NULL),
(124, 'V-bad53a6be6b3', '2a02:8388:a181:1a00:29f6:4cc0:3a1', 'id24qsqg0akt340bb8siacc2r4', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-06 09:54:30', '2023-12-06 09:54:30', '2023-12-06 09:54:30', '2023-12-06 10:30:00', NULL),
(125, 'V-1e6934d45617', '2a02:8388:a181:1a00:29f6:4cc0:3a1', 'id24qsqg0akt340bb8siacc2r4', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-06 09:54:43', '2023-12-06 09:54:43', '2023-12-06 09:54:43', '2023-12-06 10:43:00', NULL),
(126, 'V-36e97625d915', '2a02:8388:a181:1a00:29f6:4cc0:3a1', 'id24qsqg0akt340bb8siacc2r4', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-06 09:55:02', '2023-12-06 09:55:02', '2023-12-06 09:55:02', '2023-12-06 10:02:00', NULL),
(127, 'V-a6306373a8b4', '43.157.40.112', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-06 13:08:12', '2023-12-06 13:08:12', '2023-12-06 13:08:12', '2023-12-06 02:12:00', NULL),
(128, 'V-83116bb023c8', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 18:06:35', '2023-12-06 18:06:35', '2023-12-06 18:06:35', '2023-12-06 07:35:00', NULL),
(129, 'V-8eb60581990d', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 18:06:41', '2023-12-06 18:06:41', '2023-12-06 18:06:41', '2023-12-06 07:41:00', NULL),
(130, 'V-f866be7e42d2', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 18:06:52', '2023-12-06 18:06:52', '2023-12-06 18:06:52', '2023-12-06 07:52:00', NULL);
INSERT INTO `visitors` (`uid`, `guide`, `ip_address`, `session`, `user_agent`, `language`, `os`, `browser`, `device`, `country`, `first_visit_timestamp`, `last_visit_timestamp`, `created_at`, `updated_at`, `deleted_at`) VALUES
(131, 'V-3d2b06306cd0', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 18:08:54', '2023-12-06 18:08:54', '2023-12-06 18:08:54', '2023-12-06 07:54:00', NULL),
(132, 'V-a0cceac504a2', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 18:09:01', '2023-12-06 18:09:01', '2023-12-06 18:09:01', '2023-12-06 07:01:00', NULL),
(133, 'V-1ee5b1efcfda', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 18:09:02', '2023-12-06 18:09:02', '2023-12-06 18:09:02', '2023-12-06 07:02:00', NULL),
(134, 'V-2c69fe677514', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 18:09:06', '2023-12-06 18:09:06', '2023-12-06 18:09:06', '2023-12-06 07:06:00', NULL),
(135, 'V-3bc10743b5b5', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 18:09:07', '2023-12-06 18:09:07', '2023-12-06 18:09:07', '2023-12-06 07:07:00', NULL),
(136, 'V-940fbb4c196a', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 18:09:12', '2023-12-06 18:09:12', '2023-12-06 18:09:12', '2023-12-06 07:12:00', NULL),
(137, 'V-6a87badbe4af', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 18:09:14', '2023-12-06 18:09:14', '2023-12-06 18:09:14', '2023-12-06 07:14:00', NULL),
(138, 'V-af03923e4a44', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 18:12:55', '2023-12-06 18:12:55', '2023-12-06 18:12:55', '2023-12-06 07:55:00', NULL),
(139, 'V-4dc98ecc9874', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 18:12:58', '2023-12-06 18:12:58', '2023-12-06 18:12:58', '2023-12-06 07:58:00', NULL),
(140, 'V-cc9bfab89169', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 18:13:57', '2023-12-06 18:13:57', '2023-12-06 18:13:57', '2023-12-06 07:57:00', NULL),
(141, 'V-9a1ea64ab9f9', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 18:18:03', '2023-12-06 18:18:03', '2023-12-06 18:18:03', '2023-12-06 07:03:00', NULL),
(142, 'V-99ee459c5c6b', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 18:18:07', '2023-12-06 18:18:07', '2023-12-06 18:18:07', '2023-12-06 07:07:00', NULL),
(143, 'V-6fda3b7b1b74', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-06 18:20:53', '2023-12-06 18:20:53', '2023-12-06 18:20:53', '2023-12-06 07:53:00', NULL),
(144, 'V-e90cc10c2824', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-07 00:38:05', '2023-12-07 00:38:05', '2023-12-07 00:38:05', '2023-12-07 01:05:00', NULL),
(145, 'V-a6255e06925e', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-07 00:38:07', '2023-12-07 00:38:07', '2023-12-07 00:38:07', '2023-12-07 01:07:00', NULL),
(146, 'V-501da8645ed5', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-07 00:38:14', '2023-12-07 00:38:14', '2023-12-07 00:38:14', '2023-12-07 01:14:00', NULL),
(147, 'V-fc78f4ad9a59', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-07 00:38:27', '2023-12-07 00:38:27', '2023-12-07 00:38:27', '2023-12-07 01:27:00', NULL),
(148, 'V-8ddf60164153', '2a02:8388:a181:1a00:5436:7b3f:d7a', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-07 00:38:35', '2023-12-07 00:38:35', '2023-12-07 00:38:35', '2023-12-07 01:35:00', NULL),
(149, 'V-34f347d53ad8', '167.172.249.144', '-1', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) chrome/108.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'linux', 'chrome', 'desktop', NULL, '2023-12-07 06:19:51', '2023-12-07 06:19:51', '2023-12-07 06:19:51', '2023-12-07 07:51:00', NULL),
(150, 'V-711a7d204795', '188.130.129.194', '-1', 'mozilla/4.0 (compatible; msie 6.0; windows nt 5.1; sv1)', 'en-US,en;q=0.9', 'windows Vista', 'internet explorer', 'desktop', NULL, '2023-12-07 07:03:14', '2023-12-07 07:03:14', '2023-12-07 07:03:14', '2023-12-07 08:14:00', NULL),
(151, 'V-5241fbedf7b2', '129.226.158.26', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-07 07:28:24', '2023-12-07 07:28:24', '2023-12-07 07:28:24', '2023-12-07 08:24:00', NULL),
(152, 'V-9b1a2475a8b4', '209.97.149.186', '-1', 'mozilla/5.0 (macintosh; intel mac os x 10_10_1) applewebkit/537.36 (khtml, like gecko) chrome/41.0.2272.104 safari/537.36', 'en-US,en;q=0.8', 'mac os', 'chrome', 'desktop', NULL, '2023-12-07 14:19:11', '2023-12-07 14:19:11', '2023-12-07 14:19:11', '2023-12-07 03:11:00', NULL),
(153, 'V-1cfd593ecb20', '209.97.149.192', '-1', 'mozilla/5.0 (macintosh; intel mac os x 10_10_1) applewebkit/537.36 (khtml, like gecko) chrome/41.0.2272.104 safari/537.36', 'en-US,en;q=0.8', 'mac os', 'chrome', 'desktop', NULL, '2023-12-07 14:19:57', '2023-12-07 14:19:57', '2023-12-07 14:19:57', '2023-12-07 03:57:00', NULL),
(154, 'V-60723cb6ea4c', '159.203.126.100', '-1', 'mozilla/5.0 (macintosh; intel mac os x 10_10_1) applewebkit/537.36 (khtml, like gecko) chrome/41.0.2272.104 safari/537.36', 'en-US,en;q=0.8', 'mac os', 'chrome', 'desktop', NULL, '2023-12-07 14:20:15', '2023-12-07 14:20:15', '2023-12-07 14:20:15', '2023-12-07 03:15:00', NULL),
(155, 'V-e34a4091a0eb', '209.97.146.120', '-1', 'mozilla/5.0 (macintosh; intel mac os x 10_10_1) applewebkit/537.36 (khtml, like gecko) chrome/41.0.2272.104 safari/537.36', 'en-US,en;q=0.8', 'mac os', 'chrome', 'desktop', NULL, '2023-12-07 14:20:47', '2023-12-07 14:20:47', '2023-12-07 14:20:47', '2023-12-07 03:47:00', NULL),
(156, 'V-d362f84b22ea', '101.91.148.219', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-07 14:45:31', '2023-12-07 14:45:31', '2023-12-07 14:45:31', '2023-12-07 03:31:00', NULL),
(157, 'V-73289116c4f9', '52.206.84.190', '-1', 'mozilla/5.0 (compatible; surdotlybot/1.0; +http://sur.ly/bot.html)', 'en-US,en;q=0.8', NULL, NULL, 'desktop', NULL, '2023-12-07 18:12:16', '2023-12-07 18:12:16', '2023-12-07 18:12:16', '2023-12-07 07:16:00', NULL),
(158, 'V-8382118bc7f7', '213.202.233.34', '-1', 'mozilla/6.4 (windows nt 11.1) gecko/2010102 firefox/99.0', 'en-US,en;q=0.9,fr;q=0.8', 'windows 10', 'firefox', 'desktop', NULL, '2023-12-07 22:19:12', '2023-12-07 22:19:12', '2023-12-07 22:19:12', '2023-12-07 11:12:00', NULL),
(159, 'V-866abb54ee4c', '43.134.37.211', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-08 08:38:44', '2023-12-08 08:38:44', '2023-12-08 08:38:44', '2023-12-08 09:44:00', NULL),
(160, 'V-91d9205364c0', '157.245.69.163', '-1', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) chrome/108.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'linux', 'chrome', 'desktop', NULL, '2023-12-08 08:50:37', '2023-12-08 08:50:37', '2023-12-08 08:50:37', '2023-12-08 09:37:00', NULL),
(161, 'V-de7e8b088737', '13.37.32.251', '-1', 'mozilla/5.0 (windows nt 6.3; wow64) applewebkit/537.36 (khtml, like gecko) chrome/38.0.2125.111 safari/537.36', '*', 'windows 8.1', 'chrome', 'desktop', NULL, '2023-12-08 09:19:16', '2023-12-08 09:19:16', '2023-12-08 09:19:16', '2023-12-08 10:16:00', NULL),
(162, 'V-d4a6b50705c3', '5.133.192.197', '-1', 'mozilla/5.0 (linux; android 7.1.2; 17mb150wb build/nzh54d; wv) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/72.0.3626.121 safari/537.36', 'en-US', 'android', 'chrome', 'tablet', NULL, '2023-12-08 17:23:52', '2023-12-08 17:23:52', '2023-12-08 17:23:52', '2023-12-08 06:52:00', NULL),
(163, 'V-d2b740fdbfd5', '64.185.105.149', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/114.0.0.0 safari/537.36 vivaldi/5.3.2679.68', 'en-US,en;q=0.5', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-08 17:44:41', '2023-12-08 17:44:41', '2023-12-08 17:44:41', '2023-12-08 06:41:00', NULL),
(164, 'V-66d72f5d0fd6', '43.159.141.180', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-08 23:19:00', '2023-12-08 23:19:00', '2023-12-08 23:19:00', '2023-12-09 12:00:00', NULL),
(165, 'V-85fbce59a0b3', '2a02:8388:a181:1a00:88ae:a4a5:ca1', '-1', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-09 01:46:48', '2023-12-09 01:46:48', '2023-12-09 01:46:48', '2023-12-09 02:48:00', NULL),
(166, 'V-fe84fa668f8f', '2a02:8388:a181:1a00:88ae:a4a5:ca1', 'fc8r4064mo44t3nol2gjdq2abp', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-09 01:46:56', '2023-12-09 01:46:56', '2023-12-09 01:46:56', '2023-12-09 02:56:00', NULL),
(167, 'V-26a693707fd6', '2a02:8388:a181:1a00:88ae:a4a5:ca1', 'fc8r4064mo44t3nol2gjdq2abp', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-09 01:47:02', '2023-12-09 01:47:02', '2023-12-09 01:47:02', '2023-12-09 02:02:00', NULL),
(168, 'V-296a8728b46f', '2a02:8388:a181:1a00:88ae:a4a5:ca1', 'fc8r4064mo44t3nol2gjdq2abp', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-09 01:47:20', '2023-12-09 01:47:20', '2023-12-09 01:47:20', '2023-12-09 02:20:00', NULL),
(169, 'V-6e90e5312333', '2a02:8388:a181:1a00:88ae:a4a5:ca1', 'jh1bhn5drmnqh2akf2sd2l7ab5', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.6045.193 mobile safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'android', 'chrome', 'mobile', NULL, '2023-12-09 01:47:35', '2023-12-09 01:47:35', '2023-12-09 01:47:35', '2023-12-09 02:35:00', NULL),
(170, 'V-954f0e0abbe5', '2a02:8388:a181:1a00:88ae:a4a5:ca1', 'jh1bhn5drmnqh2akf2sd2l7ab5', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.6045.193 mobile safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'android', 'chrome', 'mobile', NULL, '2023-12-09 01:47:40', '2023-12-09 01:47:40', '2023-12-09 01:47:40', '2023-12-09 02:40:00', NULL),
(171, 'V-42b79a281a38', '2a02:8388:a181:1a00:88ae:a4a5:ca1', 'jh1bhn5drmnqh2akf2sd2l7ab5', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.6045.193 mobile safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'android', 'chrome', 'mobile', NULL, '2023-12-09 01:47:49', '2023-12-09 01:47:49', '2023-12-09 01:47:49', '2023-12-09 02:49:00', NULL),
(172, 'V-bfef74e1a743', '2a02:8388:a181:1a00:88ae:a4a5:ca1', 'jh1bhn5drmnqh2akf2sd2l7ab5', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.6045.193 mobile safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'android', 'chrome', 'mobile', NULL, '2023-12-09 01:48:19', '2023-12-09 01:48:19', '2023-12-09 01:48:19', '2023-12-09 02:19:00', NULL),
(173, 'V-d8e904e82014', '2a02:8388:a181:1a00:88ae:a4a5:ca1', 'jh1bhn5drmnqh2akf2sd2l7ab5', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.6045.193 mobile safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'android', 'chrome', 'mobile', NULL, '2023-12-09 01:51:49', '2023-12-09 01:51:49', '2023-12-09 01:51:49', '2023-12-09 02:49:00', NULL),
(174, 'V-eb8fb2accffb', '2a02:8388:a181:1a00:88ae:a4a5:ca1', 'jh1bhn5drmnqh2akf2sd2l7ab5', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.6045.193 mobile safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'android', 'chrome', 'mobile', NULL, '2023-12-09 01:51:52', '2023-12-09 01:51:52', '2023-12-09 01:51:52', '2023-12-09 02:52:00', NULL),
(175, 'V-218629aa178d', '2a02:8388:a181:1a00:88ae:a4a5:ca1', 'fc8r4064mo44t3nol2gjdq2abp', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-09 01:51:56', '2023-12-09 01:51:56', '2023-12-09 01:51:56', '2023-12-09 02:56:00', NULL),
(176, 'V-c4dd2c80ea6f', '2a02:8388:a181:1a00:88ae:a4a5:ca1', 'fc8r4064mo44t3nol2gjdq2abp', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-09 01:52:01', '2023-12-09 01:52:01', '2023-12-09 01:52:01', '2023-12-09 02:01:00', NULL),
(177, 'V-b50ae534e62d', '2a02:8388:a181:1a00:88ae:a4a5:ca1', 'fc8r4064mo44t3nol2gjdq2abp', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-09 01:52:06', '2023-12-09 01:52:06', '2023-12-09 01:52:06', '2023-12-09 02:06:00', NULL),
(178, 'V-9ee692cec0ef', '2a02:8388:a181:1a00:88ae:a4a5:ca1', 'fc8r4064mo44t3nol2gjdq2abp', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-09 01:52:08', '2023-12-09 01:52:08', '2023-12-09 01:52:08', '2023-12-09 02:08:00', NULL),
(179, 'V-d7478d67239a', '2a02:8388:a181:1a00:88ae:a4a5:ca1', 'fc8r4064mo44t3nol2gjdq2abp', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-09 01:52:28', '2023-12-09 01:52:28', '2023-12-09 01:52:28', '2023-12-09 02:28:00', NULL),
(180, 'V-881ab76afa44', '142.93.196.243', '-1', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) chrome/108.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'linux', 'chrome', 'desktop', NULL, '2023-12-09 08:36:34', '2023-12-09 08:36:34', '2023-12-09 08:36:34', '2023-12-09 09:34:00', NULL),
(181, 'V-450553ff97ed', '23.106.22.7', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/114.0.0.0 yabrowser/22.7.0 yowser/2.5 safari/537.36', 'en-US,en;q=0.5', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-09 12:21:23', '2023-12-09 12:21:23', '2023-12-09 12:21:23', '2023-12-09 01:23:00', NULL),
(182, 'V-9e161393d9bf', '24.199.110.16', '-1', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) chrome/108.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'linux', 'chrome', 'desktop', NULL, '2023-12-09 14:25:56', '2023-12-09 14:25:56', '2023-12-09 14:25:56', '2023-12-09 03:56:00', NULL),
(183, 'V-93c2999e2e72', '93.158.91.12', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/105.0.0.0 safari/537.36', 'en-US', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-09 14:44:37', '2023-12-09 14:44:37', '2023-12-09 14:44:37', '2023-12-09 03:37:00', NULL),
(184, 'V-672d19618381', '77.119.217.69', '-1', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-09 15:06:30', '2023-12-09 15:06:30', '2023-12-09 15:06:30', '2023-12-09 04:30:00', NULL),
(185, 'V-c917eb9f1520', '77.119.217.69', 'vadtimiuah14s41jv775r36tp6', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-09 15:06:43', '2023-12-09 15:06:43', '2023-12-09 15:06:43', '2023-12-09 04:43:00', NULL),
(186, 'V-bf94bbd99374', '77.119.217.69', 'jh1bhn5drmnqh2akf2sd2l7ab5', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.6045.193 mobile safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'android', 'chrome', 'mobile', NULL, '2023-12-09 15:14:13', '2023-12-09 15:14:13', '2023-12-09 15:14:13', '2023-12-09 04:13:00', NULL),
(187, 'V-2f3b4ff3ccb1', '43.130.62.164', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-09 16:38:03', '2023-12-09 16:38:03', '2023-12-09 16:38:03', '2023-12-09 05:03:00', NULL),
(188, 'V-646065abf857', '36.255.243.55', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/118.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-10 01:06:08', '2023-12-10 01:06:08', '2023-12-10 01:06:08', '2023-12-10 02:08:00', NULL),
(189, 'V-6cf59a7bd532', '35.231.64.134', 'k1h1k050uv2stfnqd0v67uhscf', 'zoominfobot (zoominfobot at zoominfo dot com)', 'en-us,en-gb,en;q=0.7,*;q=0.3', NULL, NULL, 'desktop', NULL, '2023-12-10 10:10:01', '2023-12-10 10:10:01', '2023-12-10 10:10:01', '2023-12-10 11:01:00', NULL),
(190, 'V-f30c9e068c5e', '35.231.64.134', 'sklmg8g1tsi8thosk6djfnpbeb', 'zoominfobot (zoominfobot at zoominfo dot com)', 'en-us,en-gb,en;q=0.7,*;q=0.3', NULL, NULL, 'desktop', NULL, '2023-12-10 10:10:20', '2023-12-10 10:10:20', '2023-12-10 10:10:20', '2023-12-10 11:20:00', NULL),
(191, 'V-18bf2608debf', '34.148.222.172', 'v4hr7fmoqd14totd7tqr6tihde', 'zoominfobot (zoominfobot at zoominfo dot com)', 'en-us,en-gb,en;q=0.7,*;q=0.3', NULL, NULL, 'desktop', NULL, '2023-12-10 10:45:37', '2023-12-10 10:45:37', '2023-12-10 10:45:37', '2023-12-10 11:37:00', NULL),
(192, 'V-999ba904fd26', '2a02:8388:a181:1a00:88ae:a4a5:ca1', 'jh1bhn5drmnqh2akf2sd2l7ab5', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.6045.193 mobile safari/537.36', 'en-GB,en-US;q=0.9,en;q=0.8', 'android', 'chrome', 'mobile', NULL, '2023-12-10 11:59:37', '2023-12-10 11:59:37', '2023-12-10 11:59:37', '2023-12-10 12:37:00', NULL),
(193, 'V-c863e4395d65', '34.148.222.172', 'plf607d3en9j51alqsheft1rjn', 'zoominfobot (zoominfobot at zoominfo dot com)', 'en-us,en-gb,en;q=0.7,*;q=0.3', NULL, NULL, 'desktop', NULL, '2023-12-10 12:25:50', '2023-12-10 12:25:50', '2023-12-10 12:25:50', '2023-12-10 01:50:00', NULL),
(194, 'V-3f6fb6325876', '34.148.222.172', 'eacj2c6kn0behonpvjoqr74k8f', 'zoominfobot (zoominfobot at zoominfo dot com)', 'en-us,en-gb,en;q=0.7,*;q=0.3', NULL, NULL, 'desktop', NULL, '2023-12-10 14:06:06', '2023-12-10 14:06:06', '2023-12-10 14:06:06', '2023-12-10 03:06:00', NULL),
(195, 'V-329373e6c4f6', '54.80.196.115', '-1', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) chrome/58.0.3029.110 safari/537.36', 'en-US,en;q=0.5', 'linux', 'chrome', 'desktop', NULL, '2023-12-10 17:46:23', '2023-12-10 17:46:23', '2023-12-10 17:46:23', '2023-12-10 06:23:00', NULL),
(196, 'V-a0d74c38d62c', '43.133.77.230', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-10 18:02:43', '2023-12-10 18:02:43', '2023-12-10 18:02:43', '2023-12-10 07:43:00', NULL),
(197, 'V-4149d875e026', '135.148.195.6', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/114.0.0.0 safari/537.36 edg/114.0.1823.86', 'zh-CN,zh;q=0.9,en;q=0.8', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-10 18:55:43', '2023-12-10 18:55:43', '2023-12-10 18:55:43', '2023-12-10 07:43:00', NULL),
(198, 'V-c6e4da076e5b', '54.198.69.194', '-1', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) chrome/58.0.3029.110 safari/537.36', 'en-US,en;q=0.5', 'linux', 'chrome', 'desktop', NULL, '2023-12-11 02:37:51', '2023-12-11 02:37:51', '2023-12-11 02:37:51', '2023-12-11 03:51:00', NULL),
(199, 'V-3d1dfb274dc3', '2a02:8388:a181:1a00:6167:3bd7:dff', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-11 04:21:22', '2023-12-11 04:21:22', '2023-12-11 04:21:22', '2023-12-11 05:22:00', NULL),
(200, 'V-438c5965bf2b', '2a02:8388:a181:1a00:6167:3bd7:dff', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-11 04:21:25', '2023-12-11 04:21:25', '2023-12-11 04:21:25', '2023-12-11 05:25:00', NULL),
(201, 'V-e3f9f6cf6449', '2a02:8388:a181:1a00:6167:3bd7:dff', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-11 04:21:32', '2023-12-11 04:21:32', '2023-12-11 04:21:32', '2023-12-11 05:32:00', NULL),
(202, 'V-f9b66f87fc39', '2a02:8388:a181:1a00:6167:3bd7:dff', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-11 04:21:36', '2023-12-11 04:21:36', '2023-12-11 04:21:36', '2023-12-11 05:36:00', NULL),
(203, 'V-97054e37c05f', '2a02:8388:a181:1a00:6167:3bd7:dff', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-11 04:23:00', '2023-12-11 04:23:00', '2023-12-11 04:23:00', '2023-12-11 05:00:00', NULL),
(204, 'V-b7e0bff11025', '2a02:8388:a181:1a00:6167:3bd7:dff', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-11 04:23:51', '2023-12-11 04:23:51', '2023-12-11 04:23:51', '2023-12-11 05:51:00', NULL),
(205, 'V-0537c14a5e41', '2a02:8388:a181:1a00:6167:3bd7:dff', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-11 04:24:51', '2023-12-11 04:24:51', '2023-12-11 04:24:51', '2023-12-11 05:51:00', NULL),
(206, 'V-282017b0fd70', '2a02:8388:a181:1a00:6167:3bd7:dff', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-11 04:25:49', '2023-12-11 04:25:49', '2023-12-11 04:25:49', '2023-12-11 05:49:00', NULL),
(207, 'V-34009e8ba326', '2a02:8388:a181:1a00:6167:3bd7:dff', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-11 04:25:53', '2023-12-11 04:25:53', '2023-12-11 04:25:53', '2023-12-11 05:53:00', NULL),
(208, 'V-df048a77f1b7', '159.223.226.49', '-1', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) chrome/108.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'linux', 'chrome', 'desktop', NULL, '2023-12-11 07:58:15', '2023-12-11 07:58:15', '2023-12-11 07:58:15', '2023-12-11 08:15:00', NULL),
(209, 'V-c56ca178e57b', '43.157.66.187', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-11 11:22:08', '2023-12-11 11:22:08', '2023-12-11 11:22:08', '2023-12-11 12:08:00', NULL),
(210, 'V-055fe5a2e567', '2a02:8388:a181:1a00:6167:3bd7:dff', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-12 02:16:00', '2023-12-12 02:16:00', '2023-12-12 02:16:00', '2023-12-12 03:00:00', NULL),
(211, 'V-48997ff56719', '2a02:8388:a181:1a00:6167:3bd7:dff', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-12 02:16:02', '2023-12-12 02:16:02', '2023-12-12 02:16:02', '2023-12-12 03:02:00', NULL),
(212, 'V-194f1c66009b', '2a02:8388:a181:1a00:6167:3bd7:dff', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-12 02:16:14', '2023-12-12 02:16:14', '2023-12-12 02:16:14', '2023-12-12 03:14:00', NULL),
(213, 'V-2838cd5a71b1', '2a02:8388:a181:1a00:6167:3bd7:dff', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-12 02:17:12', '2023-12-12 02:17:12', '2023-12-12 02:17:12', '2023-12-12 03:12:00', NULL),
(214, 'V-8edcb8a5002a', '2a02:8388:a181:1a00:6167:3bd7:dff', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-12 02:17:20', '2023-12-12 02:17:20', '2023-12-12 02:17:20', '2023-12-12 03:20:00', NULL),
(215, 'V-16a0a60c0aa1', '2a02:8388:a181:1a00:6167:3bd7:dff', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-12 02:17:23', '2023-12-12 02:17:23', '2023-12-12 02:17:23', '2023-12-12 03:23:00', NULL),
(216, 'V-d40d34e6546c', '2a02:8388:a181:1a00:6167:3bd7:dff', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-12 02:17:26', '2023-12-12 02:17:26', '2023-12-12 02:17:26', '2023-12-12 03:26:00', NULL),
(217, 'V-a1a780a8132c', '2a02:8388:a181:1a00:6167:3bd7:dff', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-12 02:17:31', '2023-12-12 02:17:31', '2023-12-12 02:17:31', '2023-12-12 03:31:00', NULL),
(218, 'V-543743c90637', '2a02:8388:a181:1a00:6167:3bd7:dff', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-12 02:18:41', '2023-12-12 02:18:41', '2023-12-12 02:18:41', '2023-12-12 03:41:00', NULL),
(219, 'V-293550f09ff8', '80.65.211.59', '-1', 'scrapy/1.7.3 (+https://scrapy.org)', 'en', NULL, NULL, 'desktop', NULL, '2023-12-12 03:09:14', '2023-12-12 03:09:14', '2023-12-12 03:09:14', '2023-12-12 04:14:00', NULL),
(220, 'V-1e25333136ec', '58.49.233.126', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-12 04:00:50', '2023-12-12 04:00:50', '2023-12-12 04:00:50', '2023-12-12 05:50:00', NULL),
(221, 'V-dbcb55cf9df6', '43.153.110.177', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-12 11:55:36', '2023-12-12 11:55:36', '2023-12-12 11:55:36', '2023-12-12 12:36:00', NULL),
(222, 'V-2cd3fb02737e', '182.44.9.147', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-12 19:49:36', '2023-12-12 19:49:36', '2023-12-12 19:49:36', '2023-12-12 08:36:00', NULL),
(223, 'V-a4d031976e47', '35.188.38.177', '-1', 'scrapy/2.11.0 (+https://scrapy.org)', 'en', NULL, NULL, 'desktop', NULL, '2023-12-13 04:21:44', '2023-12-13 04:21:44', '2023-12-13 04:21:44', '2023-12-13 05:44:00', NULL),
(224, 'V-aa8f8b33388b', '142.93.34.9', '-1', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) chrome/108.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'linux', 'chrome', 'desktop', NULL, '2023-12-13 07:56:43', '2023-12-13 07:56:43', '2023-12-13 07:56:43', '2023-12-13 08:43:00', NULL),
(225, 'V-b08f4679a542', '51.15.252.187', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64; rv:102.0) gecko/20100101 firefox/102.0', 'en-US', 'windows 10', 'firefox', 'desktop', NULL, '2023-12-13 09:39:57', '2023-12-13 09:39:57', '2023-12-13 09:39:57', '2023-12-13 10:57:00', NULL),
(226, 'V-15ba1d7c7695', '43.159.129.209', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-13 12:49:05', '2023-12-13 12:49:05', '2023-12-13 12:49:05', '2023-12-13 01:05:00', NULL),
(227, 'V-6eb0858658ed', '52.53.164.97', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36 edg/120.0.0.0', 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-13 13:19:40', '2023-12-13 13:19:40', '2023-12-13 13:19:40', '2023-12-13 02:40:00', NULL),
(228, 'V-09ac56536e32', '52.53.164.97', 'norntavhu1v7q3jc60eg3bvh44', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 safari/537.36', 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7', 'linux', 'chrome', 'desktop', NULL, '2023-12-13 13:19:44', '2023-12-13 13:19:44', '2023-12-13 13:19:44', '2023-12-13 02:44:00', NULL),
(229, 'V-fadb03b86e23', '51.158.97.141', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/91.0.4472.124 safari/537.36', 'en-US', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-13 16:26:48', '2023-12-13 16:26:48', '2023-12-13 16:26:48', '2023-12-13 05:48:00', NULL),
(230, 'V-34b2a58b2cc0', '45.55.69.56', '-1', 'lynx/2.9.0dev.5 libwww-fm/2.14 ssl-mm/1.4.1 gnutls/3.6.13', 'en', NULL, NULL, 'desktop', NULL, '2023-12-13 19:15:22', '2023-12-13 19:15:22', '2023-12-13 19:15:22', '2023-12-13 08:22:00', NULL),
(231, 'V-2e1d0116be47', '163.172.183.49', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.0.0 safari/537.36', 'en-US', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-13 20:38:18', '2023-12-13 20:38:18', '2023-12-13 20:38:18', '2023-12-13 09:18:00', NULL),
(232, 'V-16592f6910b4', '51.158.68.158', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/114.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-13 20:43:32', '2023-12-13 20:43:32', '2023-12-13 20:43:32', '2023-12-13 09:32:00', NULL),
(233, 'V-050d9c38cab3', '51.158.68.158', 'or0p01c8jdui3dmagi8aot9p5l', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) headlesschrome/118.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'linux', 'chrome', 'desktop', NULL, '2023-12-13 20:43:35', '2023-12-13 20:43:35', '2023-12-13 20:43:35', '2023-12-13 09:35:00', NULL),
(234, 'V-63ddc58927f2', '51.158.104.186', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/114.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-13 20:44:24', '2023-12-13 20:44:24', '2023-12-13 20:44:24', '2023-12-13 09:24:00', NULL),
(235, 'V-a17afb08cc13', '51.158.104.186', 'rlqmv3b1fmvpc05bt8s0c02qev', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) headlesschrome/118.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'linux', 'chrome', 'desktop', NULL, '2023-12-13 20:44:24', '2023-12-13 20:44:24', '2023-12-13 20:44:24', '2023-12-13 09:24:00', NULL),
(236, 'V-c5b5a94971a3', '51.15.247.82', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/114.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-13 20:45:06', '2023-12-13 20:45:06', '2023-12-13 20:45:06', '2023-12-13 09:06:00', NULL),
(237, 'V-e2fd88f7e589', '51.15.247.82', 'pnh8he8ubftorn0p3boe9g4l0i', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) headlesschrome/118.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'linux', 'chrome', 'desktop', NULL, '2023-12-13 20:45:07', '2023-12-13 20:45:07', '2023-12-13 20:45:07', '2023-12-13 09:07:00', NULL),
(238, 'V-f1f74272f20d', '43.159.128.68', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-13 20:49:45', '2023-12-13 20:49:45', '2023-12-13 20:49:45', '2023-12-13 09:45:00', NULL),
(239, 'V-97c441281918', '51.15.134.34', '-1', 'mozilla/5.0 (macintosh; intel mac os x 10_15_7) applewebkit/605.1.15 (khtml, like gecko) version/16.5.1 safari/605.1.15', 'en-US,en;q=0.9', 'mac os catalina', 'safari', 'desktop', NULL, '2023-12-13 20:59:50', '2023-12-13 20:59:50', '2023-12-13 20:59:50', '2023-12-13 09:50:00', NULL),
(240, 'V-4213af9ed072', '51.15.134.34', 'g67r6eo3i4cor7n05cf70heone', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) headlesschrome/118.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'linux', 'chrome', 'desktop', NULL, '2023-12-13 20:59:50', '2023-12-13 20:59:50', '2023-12-13 20:59:50', '2023-12-13 09:50:00', NULL),
(241, 'V-e8cac96a3756', '51.158.106.51', '-1', 'mozilla/5.0 (macintosh; intel mac os x 10_15_7) applewebkit/537.36 (khtml, like gecko) chrome/114.0.0.0 safari/537.36 edg/114.0.1823.67', 'en-US,en;q=0.9', 'mac os catalina', 'chrome', 'desktop', NULL, '2023-12-13 21:06:12', '2023-12-13 21:06:12', '2023-12-13 21:06:12', '2023-12-13 10:12:00', NULL),
(242, 'V-9c9796e28ba6', '51.158.106.51', 't1h27lqq7nkg43r9ehes5jts05', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) headlesschrome/118.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'linux', 'chrome', 'desktop', NULL, '2023-12-13 21:06:14', '2023-12-13 21:06:14', '2023-12-13 21:06:14', '2023-12-13 10:14:00', NULL),
(243, 'V-d9260ccdd0f6', '51.15.223.53', '-1', 'mozilla/5.0 (macintosh; intel mac os x 10_15_7) applewebkit/537.36 (khtml, like gecko) chrome/114.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'mac os catalina', 'chrome', 'desktop', NULL, '2023-12-13 21:09:36', '2023-12-13 21:09:36', '2023-12-13 21:09:36', '2023-12-13 10:36:00', NULL),
(244, 'V-e004f908f000', '51.15.223.53', '167s1lt18e2sag1ht3tsjtbuse', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) headlesschrome/118.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'linux', 'chrome', 'desktop', NULL, '2023-12-13 21:09:36', '2023-12-13 21:09:36', '2023-12-13 21:09:36', '2023-12-13 10:36:00', NULL),
(245, 'V-fd61b448f158', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:38:00', '2023-12-14 01:38:00', '2023-12-14 01:38:00', '2023-12-14 02:00:00', NULL),
(246, 'V-3e2c5c1a8fbe', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:38:04', '2023-12-14 01:38:04', '2023-12-14 01:38:04', '2023-12-14 02:04:00', NULL),
(247, 'V-04286d8ce752', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:38:09', '2023-12-14 01:38:09', '2023-12-14 01:38:09', '2023-12-14 02:09:00', NULL),
(248, 'V-78889c22e8be', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:38:12', '2023-12-14 01:38:12', '2023-12-14 01:38:12', '2023-12-14 02:12:00', NULL),
(249, 'V-7a016ab919cd', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:38:28', '2023-12-14 01:38:28', '2023-12-14 01:38:28', '2023-12-14 02:28:00', NULL),
(250, 'V-4550a1520f6a', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:38:30', '2023-12-14 01:38:30', '2023-12-14 01:38:30', '2023-12-14 02:30:00', NULL),
(251, 'V-fc87e0051f14', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:38:31', '2023-12-14 01:38:31', '2023-12-14 01:38:31', '2023-12-14 02:31:00', NULL),
(252, 'V-e2ff0940524d', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:38:35', '2023-12-14 01:38:35', '2023-12-14 01:38:35', '2023-12-14 02:35:00', NULL),
(253, 'V-cc52c7c7361d', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:38:37', '2023-12-14 01:38:37', '2023-12-14 01:38:37', '2023-12-14 02:37:00', NULL),
(254, 'V-5ca892aa0f52', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:38:38', '2023-12-14 01:38:38', '2023-12-14 01:38:38', '2023-12-14 02:38:00', NULL),
(255, 'V-90525d66ff6d', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:38:39', '2023-12-14 01:38:39', '2023-12-14 01:38:39', '2023-12-14 02:39:00', NULL),
(256, 'V-c1b67f4fa383', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:38:43', '2023-12-14 01:38:43', '2023-12-14 01:38:43', '2023-12-14 02:43:00', NULL),
(257, 'V-0a8ef24a9f37', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:38:44', '2023-12-14 01:38:44', '2023-12-14 01:38:44', '2023-12-14 02:44:00', NULL),
(258, 'V-978ca1d3b992', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:38:59', '2023-12-14 01:38:59', '2023-12-14 01:38:59', '2023-12-14 02:59:00', NULL),
(259, 'V-f9bf10d1bf19', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:39:03', '2023-12-14 01:39:03', '2023-12-14 01:39:03', '2023-12-14 02:03:00', NULL),
(260, 'V-1d43da590e85', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:39:14', '2023-12-14 01:39:14', '2023-12-14 01:39:14', '2023-12-14 02:14:00', NULL),
(261, 'V-602076d8ecac', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:39:20', '2023-12-14 01:39:20', '2023-12-14 01:39:20', '2023-12-14 02:20:00', NULL),
(262, 'V-8c079964e4dd', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:39:21', '2023-12-14 01:39:21', '2023-12-14 01:39:21', '2023-12-14 02:21:00', NULL),
(263, 'V-8daec7bb622d', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:39:28', '2023-12-14 01:39:28', '2023-12-14 01:39:28', '2023-12-14 02:28:00', NULL),
(264, 'V-880b16beba5c', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:39:30', '2023-12-14 01:39:30', '2023-12-14 01:39:30', '2023-12-14 02:30:00', NULL),
(265, 'V-3c25f6516506', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:39:32', '2023-12-14 01:39:32', '2023-12-14 01:39:32', '2023-12-14 02:32:00', NULL),
(266, 'V-960b6723a7fa', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:40:18', '2023-12-14 01:40:18', '2023-12-14 01:40:18', '2023-12-14 02:18:00', NULL),
(267, 'V-1338ae72fa4e', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:41:04', '2023-12-14 01:41:04', '2023-12-14 01:41:04', '2023-12-14 02:04:00', NULL),
(268, 'V-275184ce9308', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 01:44:53', '2023-12-14 01:44:53', '2023-12-14 01:44:53', '2023-12-14 02:53:00', NULL),
(269, 'V-256738000805', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:40:11', '2023-12-14 05:40:11', '2023-12-14 05:40:11', '2023-12-14 06:11:00', NULL),
(270, 'V-0fd66d7ad6da', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:41:10', '2023-12-14 05:41:10', '2023-12-14 05:41:10', '2023-12-14 06:10:00', NULL),
(271, 'V-f0548b44ccb2', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:41:25', '2023-12-14 05:41:25', '2023-12-14 05:41:25', '2023-12-14 06:25:00', NULL);
INSERT INTO `visitors` (`uid`, `guide`, `ip_address`, `session`, `user_agent`, `language`, `os`, `browser`, `device`, `country`, `first_visit_timestamp`, `last_visit_timestamp`, `created_at`, `updated_at`, `deleted_at`) VALUES
(272, 'V-8e2cbfb5ca0b', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:41:34', '2023-12-14 05:41:34', '2023-12-14 05:41:34', '2023-12-14 06:34:00', NULL),
(273, 'V-876dfc7650d4', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (ipad; cpu os 13_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) crios/87.0.4280.77 mobile/15e148 safari/604.1', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'iOS', 'safari', 'tablet', NULL, '2023-12-14 05:41:38', '2023-12-14 05:41:38', '2023-12-14 05:41:38', '2023-12-14 06:38:00', NULL),
(274, 'V-f9692a29b55b', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:41:44', '2023-12-14 05:41:44', '2023-12-14 05:41:44', '2023-12-14 06:44:00', NULL),
(275, 'V-5dfe179e4c62', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:42:06', '2023-12-14 05:42:06', '2023-12-14 05:42:06', '2023-12-14 06:06:00', NULL),
(276, 'V-305e02b91550', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:42:16', '2023-12-14 05:42:16', '2023-12-14 05:42:16', '2023-12-14 06:16:00', NULL),
(277, 'V-68e6dcf3f1a1', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:43:02', '2023-12-14 05:43:02', '2023-12-14 05:43:02', '2023-12-14 06:02:00', NULL),
(278, 'V-ea40229a86f5', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:43:07', '2023-12-14 05:43:07', '2023-12-14 05:43:07', '2023-12-14 06:07:00', NULL),
(279, 'V-9e5efdd35e6f', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:43:28', '2023-12-14 05:43:28', '2023-12-14 05:43:28', '2023-12-14 06:28:00', NULL),
(280, 'V-33927c5392cf', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:43:31', '2023-12-14 05:43:31', '2023-12-14 05:43:31', '2023-12-14 06:31:00', NULL),
(281, 'V-709dcd280c35', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:43:33', '2023-12-14 05:43:33', '2023-12-14 05:43:33', '2023-12-14 06:33:00', NULL),
(282, 'V-860932c5bbdd', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:43:34', '2023-12-14 05:43:34', '2023-12-14 05:43:34', '2023-12-14 06:34:00', NULL),
(283, 'V-bea375afff5f', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:43:37', '2023-12-14 05:43:37', '2023-12-14 05:43:37', '2023-12-14 06:37:00', NULL),
(284, 'V-36a0ed2022fb', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:51:03', '2023-12-14 05:51:03', '2023-12-14 05:51:03', '2023-12-14 06:03:00', NULL),
(285, 'V-898589c40c3c', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:51:07', '2023-12-14 05:51:07', '2023-12-14 05:51:07', '2023-12-14 06:07:00', NULL),
(286, 'V-5c2fbd94bbc2', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:51:11', '2023-12-14 05:51:11', '2023-12-14 05:51:11', '2023-12-14 06:11:00', NULL),
(287, 'V-8a089de6ffda', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:51:12', '2023-12-14 05:51:12', '2023-12-14 05:51:12', '2023-12-14 06:12:00', NULL),
(288, 'V-1f4f5dccc98a', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:52:42', '2023-12-14 05:52:42', '2023-12-14 05:52:42', '2023-12-14 06:42:00', NULL),
(289, 'V-dfc0f415cbc6', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:53:05', '2023-12-14 05:53:05', '2023-12-14 05:53:05', '2023-12-14 06:05:00', NULL),
(290, 'V-2cce5af3c8a1', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:58:19', '2023-12-14 05:58:19', '2023-12-14 05:58:19', '2023-12-14 06:19:00', NULL),
(291, 'V-9a1f60dea5b1', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:58:34', '2023-12-14 05:58:34', '2023-12-14 05:58:34', '2023-12-14 06:34:00', NULL),
(292, 'V-18afb7ab9465', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:58:37', '2023-12-14 05:58:37', '2023-12-14 05:58:37', '2023-12-14 06:37:00', NULL),
(293, 'V-381450e48963', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:58:50', '2023-12-14 05:58:50', '2023-12-14 05:58:50', '2023-12-14 06:50:00', NULL),
(294, 'V-063781b48463', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:58:53', '2023-12-14 05:58:53', '2023-12-14 05:58:53', '2023-12-14 06:53:00', NULL),
(295, 'V-f34891f8cbb2', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:58:56', '2023-12-14 05:58:56', '2023-12-14 05:58:56', '2023-12-14 06:56:00', NULL),
(296, 'V-e661571191ae', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:59:29', '2023-12-14 05:59:29', '2023-12-14 05:59:29', '2023-12-14 06:29:00', NULL),
(297, 'V-532b0ffe7958', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:59:31', '2023-12-14 05:59:31', '2023-12-14 05:59:31', '2023-12-14 06:31:00', NULL),
(298, 'V-f45c7c974083', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:59:32', '2023-12-14 05:59:32', '2023-12-14 05:59:32', '2023-12-14 06:32:00', NULL),
(299, 'V-f17055f1e139', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:59:38', '2023-12-14 05:59:38', '2023-12-14 05:59:38', '2023-12-14 06:38:00', NULL),
(300, 'V-d76c77ec1a3a', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:59:41', '2023-12-14 05:59:41', '2023-12-14 05:59:41', '2023-12-14 06:41:00', NULL),
(301, 'V-6354d418e478', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:59:43', '2023-12-14 05:59:43', '2023-12-14 05:59:43', '2023-12-14 06:43:00', NULL),
(302, 'V-f8856770c6ee', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:59:47', '2023-12-14 05:59:47', '2023-12-14 05:59:47', '2023-12-14 06:47:00', NULL),
(303, 'V-9dc249a84796', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:59:49', '2023-12-14 05:59:49', '2023-12-14 05:59:49', '2023-12-14 06:49:00', NULL),
(304, 'V-39a81ebaa885', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:59:52', '2023-12-14 05:59:52', '2023-12-14 05:59:52', '2023-12-14 06:52:00', NULL),
(305, 'V-4e8d2a8b7314', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 05:59:59', '2023-12-14 05:59:59', '2023-12-14 05:59:59', '2023-12-14 06:59:00', NULL),
(306, 'V-9c4cb1cfe891', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:00:08', '2023-12-14 06:00:08', '2023-12-14 06:00:08', '2023-12-14 07:08:00', NULL),
(307, 'V-659b85cb94fb', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:00:14', '2023-12-14 06:00:14', '2023-12-14 06:00:14', '2023-12-14 07:14:00', NULL),
(308, 'V-69a55fb46e45', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:00:28', '2023-12-14 06:00:28', '2023-12-14 06:00:28', '2023-12-14 07:28:00', NULL),
(309, 'V-c344246a4a8a', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:00:32', '2023-12-14 06:00:32', '2023-12-14 06:00:32', '2023-12-14 07:32:00', NULL),
(310, 'V-00ceb17d3877', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:00:35', '2023-12-14 06:00:35', '2023-12-14 06:00:35', '2023-12-14 07:35:00', NULL),
(311, 'V-677e6a26e5b2', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:00:39', '2023-12-14 06:00:39', '2023-12-14 06:00:39', '2023-12-14 07:39:00', NULL),
(312, 'V-d97bc35e9ad8', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:00:42', '2023-12-14 06:00:42', '2023-12-14 06:00:42', '2023-12-14 07:42:00', NULL),
(313, 'V-c470a495ceb7', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:00:44', '2023-12-14 06:00:44', '2023-12-14 06:00:44', '2023-12-14 07:44:00', NULL),
(314, 'V-a7e10088c58d', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:01:32', '2023-12-14 06:01:32', '2023-12-14 06:01:32', '2023-12-14 07:32:00', NULL),
(315, 'V-b57ebb95642d', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:02:24', '2023-12-14 06:02:24', '2023-12-14 06:02:24', '2023-12-14 07:24:00', NULL),
(316, 'V-76cdd5675708', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:05:52', '2023-12-14 06:05:52', '2023-12-14 06:05:52', '2023-12-14 07:52:00', NULL),
(317, 'V-2f1f6238b2fb', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:06:44', '2023-12-14 06:06:44', '2023-12-14 06:06:44', '2023-12-14 07:44:00', NULL),
(318, 'V-3687b03edfca', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:08:05', '2023-12-14 06:08:05', '2023-12-14 06:08:05', '2023-12-14 07:05:00', NULL),
(319, 'V-aa2f6a49acad', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:09:25', '2023-12-14 06:09:25', '2023-12-14 06:09:25', '2023-12-14 07:25:00', NULL),
(320, 'V-be61e13f891c', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:09:28', '2023-12-14 06:09:28', '2023-12-14 06:09:28', '2023-12-14 07:28:00', NULL),
(321, 'V-af64ed9512ca', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:09:29', '2023-12-14 06:09:29', '2023-12-14 06:09:29', '2023-12-14 07:29:00', NULL),
(322, 'V-d05a82b12ab8', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:09:31', '2023-12-14 06:09:31', '2023-12-14 06:09:31', '2023-12-14 07:31:00', NULL),
(323, 'V-09019c8b862f', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:09:38', '2023-12-14 06:09:38', '2023-12-14 06:09:38', '2023-12-14 07:38:00', NULL),
(324, 'V-e653039587ff', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:09:44', '2023-12-14 06:09:44', '2023-12-14 06:09:44', '2023-12-14 07:44:00', NULL),
(325, 'V-ad2a304035bc', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:09:56', '2023-12-14 06:09:56', '2023-12-14 06:09:56', '2023-12-14 07:56:00', NULL),
(326, 'V-767d744b06b5', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:09:58', '2023-12-14 06:09:58', '2023-12-14 06:09:58', '2023-12-14 07:58:00', NULL),
(327, 'V-da1e4c8ae1ed', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:10:06', '2023-12-14 06:10:06', '2023-12-14 06:10:06', '2023-12-14 07:06:00', NULL),
(328, 'V-ff4852e750cf', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:10:09', '2023-12-14 06:10:09', '2023-12-14 06:10:09', '2023-12-14 07:09:00', NULL),
(329, 'V-041de80b64b8', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:10:14', '2023-12-14 06:10:14', '2023-12-14 06:10:14', '2023-12-14 07:14:00', NULL),
(330, 'V-b5128ed4f91f', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:10:17', '2023-12-14 06:10:17', '2023-12-14 06:10:17', '2023-12-14 07:17:00', NULL),
(331, 'V-4c35ed4bf1b1', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:10:19', '2023-12-14 06:10:19', '2023-12-14 06:10:19', '2023-12-14 07:19:00', NULL),
(332, 'V-03e253f31b62', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:10:22', '2023-12-14 06:10:22', '2023-12-14 06:10:22', '2023-12-14 07:22:00', NULL),
(333, 'V-42371337bb3d', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:10:31', '2023-12-14 06:10:31', '2023-12-14 06:10:31', '2023-12-14 07:31:00', NULL),
(334, 'V-6e0d9cc53703', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:10:33', '2023-12-14 06:10:33', '2023-12-14 06:10:33', '2023-12-14 07:33:00', NULL),
(335, 'V-a33c2e0e4ac2', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:10:36', '2023-12-14 06:10:36', '2023-12-14 06:10:36', '2023-12-14 07:36:00', NULL),
(336, 'V-c70643c2c3c4', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:10:40', '2023-12-14 06:10:40', '2023-12-14 06:10:40', '2023-12-14 07:40:00', NULL),
(337, 'V-a3400a36f6d4', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:10:46', '2023-12-14 06:10:46', '2023-12-14 06:10:46', '2023-12-14 07:46:00', NULL),
(338, 'V-0d82ece9c504', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:10:51', '2023-12-14 06:10:51', '2023-12-14 06:10:51', '2023-12-14 07:51:00', NULL),
(339, 'V-665503cb6e5b', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:10:54', '2023-12-14 06:10:54', '2023-12-14 06:10:54', '2023-12-14 07:54:00', NULL),
(340, 'V-2276077ef935', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:10:58', '2023-12-14 06:10:58', '2023-12-14 06:10:58', '2023-12-14 07:58:00', NULL),
(341, 'V-221cac6d1b69', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:11:00', '2023-12-14 06:11:00', '2023-12-14 06:11:00', '2023-12-14 07:00:00', NULL),
(342, 'V-6463298f3410', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:11:04', '2023-12-14 06:11:04', '2023-12-14 06:11:04', '2023-12-14 07:04:00', NULL),
(343, 'V-3986e8a86a0a', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:11:10', '2023-12-14 06:11:10', '2023-12-14 06:11:10', '2023-12-14 07:10:00', NULL),
(344, 'V-8205f85c8dc2', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:11:13', '2023-12-14 06:11:13', '2023-12-14 06:11:13', '2023-12-14 07:13:00', NULL),
(345, 'V-5dd43cfd630d', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:11:17', '2023-12-14 06:11:17', '2023-12-14 06:11:17', '2023-12-14 07:17:00', NULL),
(346, 'V-ca36bab87890', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:12:57', '2023-12-14 06:12:57', '2023-12-14 06:12:57', '2023-12-14 07:57:00', NULL),
(347, 'V-92ca85553d49', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:13:02', '2023-12-14 06:13:02', '2023-12-14 06:13:02', '2023-12-14 07:02:00', NULL),
(348, 'V-04c8261a5b8a', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:13:08', '2023-12-14 06:13:08', '2023-12-14 06:13:08', '2023-12-14 07:08:00', NULL),
(349, 'V-3a4ff4b32aa4', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:13:12', '2023-12-14 06:13:12', '2023-12-14 06:13:12', '2023-12-14 07:12:00', NULL),
(350, 'V-21031502aac4', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:13:13', '2023-12-14 06:13:13', '2023-12-14 06:13:13', '2023-12-14 07:13:00', NULL),
(351, 'V-bf1d1ba5ad2f', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:13:14', '2023-12-14 06:13:14', '2023-12-14 06:13:14', '2023-12-14 07:14:00', NULL),
(352, 'V-c3d3c219fb74', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:13:16', '2023-12-14 06:13:16', '2023-12-14 06:13:16', '2023-12-14 07:16:00', NULL),
(353, 'V-7884257c8a64', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:13:18', '2023-12-14 06:13:18', '2023-12-14 06:13:18', '2023-12-14 07:18:00', NULL),
(354, 'V-f1dda997eb80', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:13:20', '2023-12-14 06:13:20', '2023-12-14 06:13:20', '2023-12-14 07:20:00', NULL),
(355, 'V-0e0c0c8b6a1b', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:13:22', '2023-12-14 06:13:22', '2023-12-14 06:13:22', '2023-12-14 07:22:00', NULL),
(356, 'V-1c7b6336c18f', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:13:35', '2023-12-14 06:13:35', '2023-12-14 06:13:35', '2023-12-14 07:35:00', NULL),
(357, 'V-0f6de532418f', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:13:36', '2023-12-14 06:13:36', '2023-12-14 06:13:36', '2023-12-14 07:36:00', NULL),
(358, 'V-cb002c511aa6', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:13:38', '2023-12-14 06:13:38', '2023-12-14 06:13:38', '2023-12-14 07:38:00', NULL),
(359, 'V-a0a928eede71', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:13:39', '2023-12-14 06:13:39', '2023-12-14 06:13:39', '2023-12-14 07:39:00', NULL),
(360, 'V-1d7a35bae5cd', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:13:40', '2023-12-14 06:13:40', '2023-12-14 06:13:40', '2023-12-14 07:40:00', NULL),
(361, 'V-8bc91adb0890', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:13:43', '2023-12-14 06:13:43', '2023-12-14 06:13:43', '2023-12-14 07:43:00', NULL),
(362, 'V-2cc27b0dce4e', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:13:46', '2023-12-14 06:13:46', '2023-12-14 06:13:46', '2023-12-14 07:46:00', NULL),
(363, 'V-3c8c409603ed', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:13:47', '2023-12-14 06:13:47', '2023-12-14 06:13:47', '2023-12-14 07:47:00', NULL),
(364, 'V-4a1f08983376', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:13:48', '2023-12-14 06:13:48', '2023-12-14 06:13:48', '2023-12-14 07:48:00', NULL),
(365, 'V-11136ba0890b', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:13:56', '2023-12-14 06:13:56', '2023-12-14 06:13:56', '2023-12-14 07:56:00', NULL),
(366, 'V-721403f9f20e', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:14:00', '2023-12-14 06:14:00', '2023-12-14 06:14:00', '2023-12-14 07:00:00', NULL),
(367, 'V-213fb7b169e9', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:14:02', '2023-12-14 06:14:02', '2023-12-14 06:14:02', '2023-12-14 07:02:00', NULL),
(368, 'V-94e2688e153f', '2a02:8388:a181:1a00:c862:b9ec:9c7', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 06:14:04', '2023-12-14 06:14:04', '2023-12-14 06:14:04', '2023-12-14 07:04:00', NULL),
(369, 'V-eff7d841f92b', '60.188.57.0', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-14 06:29:52', '2023-12-14 06:29:52', '2023-12-14 06:29:52', '2023-12-14 07:52:00', NULL),
(370, 'V-d828fcdaecd4', '188.23.142.99', '-1', 'mozilla/5.0 (macintosh; intel mac os x 10_15_7) applewebkit/605.1.15 (khtml, like gecko) version/15.6.1 safari/605.1.15', 'de-DE,de;q=0.9', 'mac os catalina', 'safari', 'desktop', NULL, '2023-12-14 06:29:53', '2023-12-14 06:29:53', '2023-12-14 06:29:53', '2023-12-14 07:53:00', NULL),
(371, 'V-3ca312c437da', '51.15.130.65', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.0.0 safari/537.36 edg/117.0.2045.43', 'en-US', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 10:26:01', '2023-12-14 10:26:01', '2023-12-14 10:26:01', '2023-12-14 11:01:00', NULL),
(372, 'V-81de45d52622', '51.158.108.40', '-1', 'mozilla/5.0 (macintosh; intel mac os x 10_15_7) applewebkit/537.36 (khtml, like gecko) chrome/114.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'mac os catalina', 'chrome', 'desktop', NULL, '2023-12-14 11:12:42', '2023-12-14 11:12:42', '2023-12-14 11:12:42', '2023-12-14 12:42:00', NULL),
(373, 'V-a8ae3cf9747c', '51.158.108.40', 'cnpt82lf4eqr9tb79v320l70sd', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) headlesschrome/118.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'linux', 'chrome', 'desktop', NULL, '2023-12-14 11:12:45', '2023-12-14 11:12:45', '2023-12-14 11:12:45', '2023-12-14 12:45:00', NULL),
(374, 'V-3dc950bd9d31', '51.158.99.215', '-1', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/114.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9', 'android', 'chrome', 'mobile', NULL, '2023-12-14 11:24:44', '2023-12-14 11:24:44', '2023-12-14 11:24:44', '2023-12-14 12:44:00', NULL),
(375, 'V-10fee15f7cf3', '51.158.99.215', 's42csmnear80qs10ib7gtu7nqc', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) headlesschrome/118.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'linux', 'chrome', 'desktop', NULL, '2023-12-14 11:24:44', '2023-12-14 11:24:44', '2023-12-14 11:24:44', '2023-12-14 12:44:00', NULL),
(376, 'V-a92a481d48d3', '51.158.70.151', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/114.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 11:29:44', '2023-12-14 11:29:44', '2023-12-14 11:29:44', '2023-12-14 12:44:00', NULL),
(377, 'V-e2c712e50e82', '51.158.70.151', 'caljlc8h65mp555jjrmlqhouqj', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) headlesschrome/118.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'linux', 'chrome', 'desktop', NULL, '2023-12-14 11:29:45', '2023-12-14 11:29:45', '2023-12-14 11:29:45', '2023-12-14 12:45:00', NULL),
(378, 'V-0f3dd486b6c4', '2a02:8388:a181:1a00:79bd:6c13:32f', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 14:41:03', '2023-12-14 14:41:03', '2023-12-14 14:41:03', '2023-12-14 03:03:00', NULL),
(379, 'V-7500e09bef6f', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 14:54:35', '2023-12-14 14:54:35', '2023-12-14 14:54:35', '2023-12-14 03:35:00', NULL),
(380, 'V-1f8d8423d95d', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 14:54:53', '2023-12-14 14:54:53', '2023-12-14 14:54:53', '2023-12-14 03:53:00', NULL),
(381, 'V-601d921a64af', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 14:55:32', '2023-12-14 14:55:32', '2023-12-14 14:55:32', '2023-12-14 03:32:00', NULL),
(382, 'V-44aedbd79cd5', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 14:55:43', '2023-12-14 14:55:43', '2023-12-14 14:55:43', '2023-12-14 03:43:00', NULL),
(383, 'V-15c92a92a15e', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 14:57:17', '2023-12-14 14:57:17', '2023-12-14 14:57:17', '2023-12-14 03:17:00', NULL),
(384, 'V-930bc89050c0', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:09:00', '2023-12-14 15:09:00', '2023-12-14 15:09:00', '2023-12-14 04:00:00', NULL),
(385, 'V-20be7af47844', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:09:09', '2023-12-14 15:09:09', '2023-12-14 15:09:09', '2023-12-14 04:09:00', NULL),
(386, 'V-8fb8fee4f24f', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:09:12', '2023-12-14 15:09:12', '2023-12-14 15:09:12', '2023-12-14 04:12:00', NULL),
(387, 'V-e10ce6f46e9b', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:09:20', '2023-12-14 15:09:20', '2023-12-14 15:09:20', '2023-12-14 04:20:00', NULL),
(388, 'V-91333b2c1927', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:09:24', '2023-12-14 15:09:24', '2023-12-14 15:09:24', '2023-12-14 04:24:00', NULL),
(389, 'V-8335a6b0574e', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:09:40', '2023-12-14 15:09:40', '2023-12-14 15:09:40', '2023-12-14 04:40:00', NULL),
(390, 'V-52fef23854a4', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:09:43', '2023-12-14 15:09:43', '2023-12-14 15:09:43', '2023-12-14 04:43:00', NULL),
(391, 'V-1d02f3b7ec27', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:09:51', '2023-12-14 15:09:51', '2023-12-14 15:09:51', '2023-12-14 04:51:00', NULL),
(392, 'V-9c35b5f737c7', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:10:05', '2023-12-14 15:10:05', '2023-12-14 15:10:05', '2023-12-14 04:05:00', NULL),
(393, 'V-28368ef32cb5', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:10:08', '2023-12-14 15:10:08', '2023-12-14 15:10:08', '2023-12-14 04:08:00', NULL),
(394, 'V-64cc4747afda', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:10:12', '2023-12-14 15:10:12', '2023-12-14 15:10:12', '2023-12-14 04:12:00', NULL),
(395, 'V-91313bbe3454', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:10:34', '2023-12-14 15:10:34', '2023-12-14 15:10:34', '2023-12-14 04:34:00', NULL),
(396, 'V-1ab875415487', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:10:39', '2023-12-14 15:10:39', '2023-12-14 15:10:39', '2023-12-14 04:39:00', NULL),
(397, 'V-7c560a84fef9', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:10:52', '2023-12-14 15:10:52', '2023-12-14 15:10:52', '2023-12-14 04:52:00', NULL),
(398, 'V-01703da257d4', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:11:10', '2023-12-14 15:11:10', '2023-12-14 15:11:10', '2023-12-14 04:10:00', NULL),
(399, 'V-d6073caca901', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:11:17', '2023-12-14 15:11:17', '2023-12-14 15:11:17', '2023-12-14 04:17:00', NULL);
INSERT INTO `visitors` (`uid`, `guide`, `ip_address`, `session`, `user_agent`, `language`, `os`, `browser`, `device`, `country`, `first_visit_timestamp`, `last_visit_timestamp`, `created_at`, `updated_at`, `deleted_at`) VALUES
(400, 'V-1f282ad8a90f', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:12:31', '2023-12-14 15:12:31', '2023-12-14 15:12:31', '2023-12-14 04:31:00', NULL),
(401, 'V-2e085ea753dc', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:12:34', '2023-12-14 15:12:34', '2023-12-14 15:12:34', '2023-12-14 04:34:00', NULL),
(402, 'V-dca5ab8ecf75', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:12:48', '2023-12-14 15:12:48', '2023-12-14 15:12:48', '2023-12-14 04:48:00', NULL),
(403, 'V-b10ada9b89d8', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:13:41', '2023-12-14 15:13:41', '2023-12-14 15:13:41', '2023-12-14 04:41:00', NULL),
(404, 'V-ae93f5d8afd0', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:15:27', '2023-12-14 15:15:27', '2023-12-14 15:15:27', '2023-12-14 04:27:00', NULL),
(405, 'V-063e2073f484', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:15:32', '2023-12-14 15:15:32', '2023-12-14 15:15:32', '2023-12-14 04:32:00', NULL),
(406, 'V-16391f16b766', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:15:37', '2023-12-14 15:15:37', '2023-12-14 15:15:37', '2023-12-14 04:37:00', NULL),
(407, 'V-969f0cf4cadf', '2a02:8388:a181:1a00:79bd:6c13:32f', 'hafgt6qn9mtb6o18056nsq649d', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:15:47', '2023-12-14 15:15:47', '2023-12-14 15:15:47', '2023-12-14 04:47:00', NULL),
(408, 'V-5264ab978300', '2a02:8388:a181:1a00:79bd:6c13:32f', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:17:19', '2023-12-14 15:17:19', '2023-12-14 15:17:19', '2023-12-14 04:19:00', NULL),
(409, 'V-fc3f2eec1d92', '2a02:8388:a181:1a00:79bd:6c13:32f', 'c1uufgj3bodkcdqe2rh2n1ihvf', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-14 15:40:46', '2023-12-14 15:40:46', '2023-12-14 15:40:46', '2023-12-14 04:46:00', NULL),
(410, 'V-cf2a2e672cdd', '2600:1900:2000:a4::1:1800', '-1', 'mozilla/5.0 (macintosh; intel mac os x 10_15_5) applewebkit/537.36 (khtml, like gecko) chrome/83.0.4103.97 safari/537.36', 'en-us,en;q=0.5', 'mac os catalina', 'chrome', 'desktop', NULL, '2023-12-14 18:32:49', '2023-12-14 18:32:49', '2023-12-14 18:32:49', '2023-12-14 07:49:00', NULL),
(411, 'V-38173879432e', '203.33.203.148', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-14 22:15:49', '2023-12-14 22:15:49', '2023-12-14 22:15:49', '2023-12-14 11:49:00', NULL),
(412, 'V-8acdca908b83', '185.12.149.40', '-1', 'mozilla/5.0 (linux; android 8.1.0; jhs561 build/giada.eng.zc.20200922.153858; wv) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/81.0.4044.138 safari/537.36', 'en-US', 'android', 'chrome', 'tablet', NULL, '2023-12-15 01:00:34', '2023-12-15 01:00:34', '2023-12-15 01:00:34', '2023-12-15 02:34:00', NULL),
(413, 'V-260f76253539', '2a02:8388:a181:1a00:1075:282b:bab', 'g97rg1q0vgddeomf3pqrvb9quh', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-15 04:22:58', '2023-12-15 04:22:58', '2023-12-15 04:22:58', '2023-12-15 05:58:00', NULL),
(414, 'V-ef711a56682b', '2a02:8388:a181:1a00:1075:282b:bab', 'g97rg1q0vgddeomf3pqrvb9quh', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-15 04:23:08', '2023-12-15 04:23:08', '2023-12-15 04:23:08', '2023-12-15 05:08:00', NULL),
(415, 'V-e21e9ab5df17', '2a02:8388:a181:1a00:1075:282b:bab', 'g97rg1q0vgddeomf3pqrvb9quh', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-15 04:23:14', '2023-12-15 04:23:14', '2023-12-15 04:23:14', '2023-12-15 05:14:00', NULL),
(416, 'V-809644ac197f', '2a02:8388:a181:1a00:1075:282b:bab', 'g97rg1q0vgddeomf3pqrvb9quh', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-15 04:23:21', '2023-12-15 04:23:21', '2023-12-15 04:23:21', '2023-12-15 05:21:00', NULL),
(417, 'V-82975e1d063c', '2a02:8388:a181:1a00:1075:282b:bab', 'g97rg1q0vgddeomf3pqrvb9quh', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-15 04:31:16', '2023-12-15 04:31:16', '2023-12-15 04:31:16', '2023-12-15 05:16:00', NULL),
(418, 'V-0e86ff0a2d86', '2a02:8388:a181:1a00:1075:282b:bab', 'g97rg1q0vgddeomf3pqrvb9quh', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-15 04:33:58', '2023-12-15 04:33:58', '2023-12-15 04:33:58', '2023-12-15 05:58:00', NULL),
(419, 'V-4195f8ede9db', '2a02:8388:a181:1a00:1075:282b:bab', 'g97rg1q0vgddeomf3pqrvb9quh', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-15 04:36:13', '2023-12-15 04:36:13', '2023-12-15 04:36:13', '2023-12-15 05:13:00', NULL),
(420, 'V-3fe289cba255', '2a02:8388:a181:1a00:4c:47aa:7e97:', '-1', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-15 05:22:17', '2023-12-15 05:22:17', '2023-12-15 05:22:17', '2023-12-15 06:17:00', NULL),
(421, 'V-1ae7d3d5ccf8', '2a02:8388:a181:1a00:4c:47aa:7e97:', 'fbucjn5oshu67fi4o3rru66jf2', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-15 05:22:21', '2023-12-15 05:22:21', '2023-12-15 05:22:21', '2023-12-15 06:21:00', NULL),
(422, 'V-05c85d73da24', '2a02:8388:a181:1a00:4c:47aa:7e97:', 'fbucjn5oshu67fi4o3rru66jf2', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-15 05:22:24', '2023-12-15 05:22:24', '2023-12-15 05:22:24', '2023-12-15 06:24:00', NULL),
(423, 'V-040c71854a9f', '2a02:8388:a181:1a00:4c:47aa:7e97:', 'fbucjn5oshu67fi4o3rru66jf2', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-15 05:22:27', '2023-12-15 05:22:27', '2023-12-15 05:22:27', '2023-12-15 06:27:00', NULL),
(424, 'V-ad7295c977a6', '2a02:8388:a181:1a00:4c:47aa:7e97:', 'fbucjn5oshu67fi4o3rru66jf2', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-15 05:22:37', '2023-12-15 05:22:37', '2023-12-15 05:22:37', '2023-12-15 06:37:00', NULL),
(425, 'V-bdf698a6e909', '2a02:8388:a181:1a00:4c:47aa:7e97:', 'fbucjn5oshu67fi4o3rru66jf2', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-15 05:23:00', '2023-12-15 05:23:00', '2023-12-15 05:23:00', '2023-12-15 06:00:00', NULL),
(426, 'V-63e797d6acd6', '2a02:8388:a181:1a00:4c:47aa:7e97:', 'fbucjn5oshu67fi4o3rru66jf2', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-15 05:23:03', '2023-12-15 05:23:03', '2023-12-15 05:23:03', '2023-12-15 06:03:00', NULL),
(427, 'V-77692339e051', '2a02:8388:a181:1a00:4c:47aa:7e97:', 'fbucjn5oshu67fi4o3rru66jf2', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-15 05:23:07', '2023-12-15 05:23:07', '2023-12-15 05:23:07', '2023-12-15 06:07:00', NULL),
(428, 'V-f75ed4cc2657', '2a02:8388:a181:1a00:4c:47aa:7e97:', 'fbucjn5oshu67fi4o3rru66jf2', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-15 05:23:10', '2023-12-15 05:23:10', '2023-12-15 05:23:10', '2023-12-15 06:10:00', NULL),
(429, 'V-608ea7515ba6', '165.227.150.217', '-1', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) chrome/108.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'linux', 'chrome', 'desktop', NULL, '2023-12-15 07:11:53', '2023-12-15 07:11:53', '2023-12-15 07:11:53', '2023-12-15 08:53:00', NULL),
(430, 'V-ef913c06f3d5', '154.28.229.44', '-1', 'mozilla/5.0 (macintosh; intel mac os x 10_15_7) applewebkit/537.36 (khtml, like gecko) chrome/116.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'mac os catalina', 'chrome', 'desktop', NULL, '2023-12-15 09:09:00', '2023-12-15 09:09:00', '2023-12-15 09:09:00', '2023-12-15 10:00:00', NULL),
(431, 'V-8c26f2aee9c4', '154.28.229.173', '-1', 'mozilla/5.0 (macintosh; intel mac os x 10_15_7) applewebkit/537.36 (khtml, like gecko) chrome/116.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'mac os catalina', 'chrome', 'desktop', NULL, '2023-12-15 09:09:08', '2023-12-15 09:09:08', '2023-12-15 09:09:08', '2023-12-15 10:08:00', NULL),
(432, 'V-72a18e904c6a', '154.28.229.173', 'e4bga0hegkkf0bn07co4b91orv', 'mozilla/5.0 (macintosh; intel mac os x 10_15_7) applewebkit/537.36 (khtml, like gecko) chrome/116.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'mac os catalina', 'chrome', 'desktop', NULL, '2023-12-15 09:09:09', '2023-12-15 09:09:09', '2023-12-15 09:09:09', '2023-12-15 10:09:00', NULL),
(433, 'V-1f150cd13fb8', '178.255.149.152', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/110.0.0.0 safari/537.36', 'en-US,en;q=0.9,de;q=0.8,fr;q=0.7,nl;q=0.6,lb;q=0.5,es;q=0.4,pt;q=0.3', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-15 09:10:10', '2023-12-15 09:10:10', '2023-12-15 09:10:10', '2023-12-15 10:10:00', NULL),
(434, 'V-f84c17b7d070', '195.181.170.226', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/76.0.3781.6 safari/537.36', 'de-DE,de;q=0.9,en-US;q=0.8,en;q=0.7', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-15 09:21:04', '2023-12-15 09:21:04', '2023-12-15 09:21:04', '2023-12-15 10:04:00', NULL),
(435, 'V-80ecf4c13f6b', '51.178.81.195', '-1', 'mozilla/5.0 (iphone; cpu iphone os 17_1_1 like mac os x) applewebkit/605.1.15 (khtml, like gecko) mobile/15e148 musical_ly_32.2.0 jssdk/2.0 nettype/4g channel/app store bytelocale/en region/us isdarkm', 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', NULL, 'mobile', NULL, '2023-12-15 09:21:04', '2023-12-15 09:21:04', '2023-12-15 09:21:04', '2023-12-15 10:04:00', NULL),
(436, 'V-a35e6e5c2dfb', '193.19.204.79', '-1', 'mozilla/5.0 (iphone; cpu iphone os 16_0_2 like mac os x) applewebkit/605.1.15 (khtml, like gecko) mobile/15e148 musical_ly_32.2.0 jssdk/2.0 nettype/wifi channel/app store bytelocale/en region/us isdar', 'el-CY,el;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', NULL, 'mobile', NULL, '2023-12-15 09:21:05', '2023-12-15 09:21:05', '2023-12-15 09:21:05', '2023-12-15 10:05:00', NULL),
(437, 'V-ff437a95dea7', '2605:6400:d814:1b8::4', '-1', 'android 11; pt_br; sm-a015m build/rp1a.200720.0121175667608181m-8540452573455618471', 'en-US,en;q=0.9', 'android', NULL, 'tablet', NULL, '2023-12-15 09:21:06', '2023-12-15 09:21:06', '2023-12-15 09:21:06', '2023-12-15 10:06:00', NULL),
(438, 'V-9adb3aab731e', '91.113.254.206', '-1', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 mobile safari/537.36', 'en-AT', 'android', 'chrome', 'mobile', NULL, '2023-12-15 11:34:12', '2023-12-15 11:34:12', '2023-12-15 11:34:12', '2023-12-15 12:12:00', NULL),
(439, 'V-f6b385838ee8', '91.113.254.206', 'kq7v0j5asqco104livkubpdvc5', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 mobile safari/537.36', 'en-AT,en;q=0.9,ar-SY;q=0.8,ar;q=0.7,de-AT;q=0.6,de;q=0.5,en-GB;q=0.4,en-US;q=0.3', 'android', 'chrome', 'mobile', NULL, '2023-12-15 11:34:13', '2023-12-15 11:34:13', '2023-12-15 11:34:13', '2023-12-15 12:13:00', NULL),
(440, 'V-86d98ad18f60', '133.242.174.119', 'ak6ako6eh7qbjjv61velbn0c9s', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/116.0.0.0 mobile safari/537.36', 'ja,en-US;q=0.9,en;q=0.8', 'android', 'chrome', 'mobile', NULL, '2023-12-15 12:09:16', '2023-12-15 12:09:16', '2023-12-15 12:09:16', '2023-12-15 01:16:00', NULL),
(441, 'V-d6c0d8ffc010', '5.133.192.105', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/105.0.0.0 safari/537.36', 'en-US', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-15 19:53:25', '2023-12-15 19:53:25', '2023-12-15 19:53:25', '2023-12-15 08:25:00', NULL),
(442, 'V-d6b00c727bd2', '104.164.173.71', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-15 21:46:22', '2023-12-15 21:46:22', '2023-12-15 21:46:22', '2023-12-15 10:22:00', NULL),
(443, 'V-6343b0fd4ab2', '154.28.229.46', '-1', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) chrome/116.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'linux', 'chrome', 'desktop', NULL, '2023-12-15 21:46:27', '2023-12-15 21:46:27', '2023-12-15 21:46:27', '2023-12-15 10:27:00', NULL),
(444, 'V-bee224cecb0b', '154.28.229.46', 'iaq8v59uorjmv8btspb65ikogi', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) chrome/116.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'linux', 'chrome', 'desktop', NULL, '2023-12-15 21:46:27', '2023-12-15 21:46:27', '2023-12-15 21:46:27', '2023-12-15 10:27:00', NULL),
(445, 'V-d87c49d211b8', '119.96.24.54', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-15 23:36:53', '2023-12-15 23:36:53', '2023-12-15 23:36:53', '2023-12-16 12:53:00', NULL),
(446, 'V-13d7764bf1b1', '144.217.135.250', '-1', 'mozilla/5.0 (compatible; dataprovider.com)', 'en-US,en;q=0.8', NULL, NULL, 'desktop', NULL, '2023-12-16 02:18:50', '2023-12-16 02:18:50', '2023-12-16 02:18:50', '2023-12-16 03:50:00', NULL),
(447, 'V-2e2948a05014', '144.217.135.229', '-1', 'mozilla/5.0 (compatible; dataprovider.com)', 'en-US', NULL, NULL, 'desktop', NULL, '2023-12-16 02:19:29', '2023-12-16 02:19:29', '2023-12-16 02:19:29', '2023-12-16 03:29:00', NULL),
(448, 'V-3cdec73e320b', '34.162.54.227', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/88.0.4240.193 safari/537.36', 'en-US,en;q=0.5', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-16 02:45:44', '2023-12-16 02:45:44', '2023-12-16 02:45:44', '2023-12-16 03:44:00', NULL),
(449, 'V-ed2e73ca9c65', '34.162.54.227', '517skog1mm7btrf0aiqtgpfrv0', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/88.0.4240.193 safari/537.36', 'en-US,en;q=0.5', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-16 02:45:44', '2023-12-16 02:45:44', '2023-12-16 02:45:44', '2023-12-16 03:44:00', NULL),
(450, 'V-848006ffcd24', '66.249.83.83', '-1', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/119.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9', 'android', 'chrome', 'mobile', NULL, '2023-12-16 02:51:09', '2023-12-16 02:51:09', '2023-12-16 02:51:09', '2023-12-16 03:09:00', NULL),
(451, 'V-30c6bea9646a', '49.7.227.204', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-16 09:04:22', '2023-12-16 09:04:22', '2023-12-16 09:04:22', '2023-12-16 10:22:00', NULL),
(452, 'V-718cc6c63868', '135.148.195.14', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/109.0.0.0 safari/537.36', 'zh-CN,zh;q=0.9,en;q=0.8', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-16 12:12:38', '2023-12-16 12:12:38', '2023-12-16 12:12:38', '2023-12-16 01:38:00', NULL),
(453, 'V-8b8526c08fe3', '175.6.217.4', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-16 16:29:56', '2023-12-16 16:29:56', '2023-12-16 16:29:56', '2023-12-16 05:56:00', NULL),
(454, 'V-2535718b6f9b', '2a02:8388:a181:1a00:50df:2fc8:d04', '-1', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-16 21:50:21', '2023-12-16 21:50:21', '2023-12-16 21:50:21', '2023-12-16 10:21:00', NULL),
(455, 'V-6464310da0e8', '2a02:8388:a181:1a00:50df:2fc8:d04', '53jf4raa05vfa6iera4pgfgvpv', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-16 21:50:25', '2023-12-16 21:50:25', '2023-12-16 21:50:25', '2023-12-16 10:25:00', NULL),
(456, 'V-462f6e7be1a1', '2a02:8388:a181:1a00:50df:2fc8:d04', '53jf4raa05vfa6iera4pgfgvpv', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-16 21:50:31', '2023-12-16 21:50:31', '2023-12-16 21:50:31', '2023-12-16 10:31:00', NULL),
(457, 'V-2ae21cdb007b', '2a02:8388:a181:1a00:1075:282b:bab', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-16 21:52:13', '2023-12-16 21:52:13', '2023-12-16 21:52:13', '2023-12-16 10:13:00', NULL),
(458, 'V-bb18c17f147e', '2a02:8388:a181:1a00:1075:282b:bab', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-16 21:52:18', '2023-12-16 21:52:18', '2023-12-16 21:52:18', '2023-12-16 10:18:00', NULL),
(459, 'V-601e7b2e72a8', '2a02:8388:a181:1a00:1075:282b:bab', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-16 21:52:23', '2023-12-16 21:52:23', '2023-12-16 21:52:23', '2023-12-16 10:23:00', NULL),
(460, 'V-6a03be2bda3c', '2a02:8388:a181:1a00:1075:282b:bab', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-16 21:52:25', '2023-12-16 21:52:25', '2023-12-16 21:52:25', '2023-12-16 10:25:00', NULL),
(461, 'V-89829f36f527', '206.189.133.216', '-1', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) chrome/108.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'linux', 'chrome', 'desktop', NULL, '2023-12-17 06:43:09', '2023-12-17 06:43:09', '2023-12-17 06:43:09', '2023-12-17 07:09:00', NULL),
(462, 'V-51a82791257f', '125.94.144.102', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-17 10:03:45', '2023-12-17 10:03:45', '2023-12-17 10:03:45', '2023-12-17 11:45:00', NULL),
(463, 'V-d74eb8908d9e', '223.244.35.77', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-17 17:24:19', '2023-12-17 17:24:19', '2023-12-17 17:24:19', '2023-12-17 06:19:00', NULL),
(464, 'V-a60fbea62f6a', '89.15.237.24', '-1', 'mozilla/5.0 (iphone; cpu iphone os 17_1_2 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/17.1.2 mobile/15e148 safari/604.1', 'en-CA,en-GB;q=0.9,en;q=0.8', 'iOS', 'safari', 'mobile', NULL, '2023-12-17 17:57:18', '2023-12-17 17:57:18', '2023-12-17 17:57:18', '2023-12-17 06:18:00', NULL),
(465, 'V-9ecbb5541175', '89.15.237.24', '3fg97sjbprsrtnenpvjeamjuev', 'mozilla/5.0 (iphone; cpu iphone os 17_1_2 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/17.1.2 mobile/15e148 safari/604.1', 'en-CA,en-GB;q=0.9,en;q=0.8', 'iOS', 'safari', 'mobile', NULL, '2023-12-17 17:57:21', '2023-12-17 17:57:21', '2023-12-17 17:57:21', '2023-12-17 06:21:00', NULL),
(466, 'V-69533ff52731', '182.44.67.97', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-18 02:30:37', '2023-12-18 02:30:37', '2023-12-18 02:30:37', '2023-12-18 03:37:00', NULL),
(467, 'V-0c9d841eb7ba', '2a02:8388:a181:1a00:50df:2fc8:d04', '-1', 'mozilla/5.0 (linux; android 10; k) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 mobile safari/537.36', 'en-US,en;q=0.9,ar-SY;q=0.8,ar;q=0.7', 'android', 'chrome', 'mobile', NULL, '2023-12-18 03:30:26', '2023-12-18 03:30:26', '2023-12-18 03:30:26', '2023-12-18 04:26:00', NULL),
(468, 'V-1ae470641cba', '110.166.71.39', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-19 04:08:19', '2023-12-19 04:08:19', '2023-12-19 04:08:19', '2023-12-19 05:19:00', NULL),
(469, 'V-07e4b75b68e8', '108.89.90.222', '-1', 'mozilla/5.0 (compatible; msie 10.0; windows nt 6.1; wow64; trident/7.0)', 'en-ZA', 'windows 10', 'internet explorer', 'desktop', NULL, '2023-12-19 05:03:41', '2023-12-19 05:03:41', '2023-12-19 05:03:41', '2023-12-19 06:41:00', NULL),
(470, 'V-20f972e91fb9', '2a02:8388:a181:1a00:1075:282b:bab', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-19 06:45:39', '2023-12-19 06:45:39', '2023-12-19 06:45:39', '2023-12-19 07:39:00', NULL),
(471, 'V-7d3c3a67152a', '2a02:8388:a181:1a00:1075:282b:bab', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-19 06:58:33', '2023-12-19 06:58:33', '2023-12-19 06:58:33', '2023-12-19 07:33:00', NULL),
(472, 'V-6be7e86b4dba', '2a02:8388:a181:1a00:1075:282b:bab', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-19 07:03:54', '2023-12-19 07:03:54', '2023-12-19 07:03:54', '2023-12-19 08:54:00', NULL),
(473, 'V-71fa23764dfc', '2a02:8388:a181:1a00:1075:282b:bab', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-19 07:06:06', '2023-12-19 07:06:06', '2023-12-19 07:06:06', '2023-12-19 08:06:00', NULL),
(474, 'V-9e8cc336f657', '2a02:8388:a181:1a00:1075:282b:bab', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-19 07:06:13', '2023-12-19 07:06:13', '2023-12-19 07:06:13', '2023-12-19 08:13:00', NULL),
(475, 'V-852815fe0285', '2a02:8388:a181:1a00:1075:282b:bab', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-19 07:06:15', '2023-12-19 07:06:15', '2023-12-19 07:06:15', '2023-12-19 08:15:00', NULL),
(476, 'V-8168bb359f3f', '46.101.74.54', '-1', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) chrome/108.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'linux', 'chrome', 'desktop', NULL, '2023-12-19 08:26:28', '2023-12-19 08:26:28', '2023-12-19 08:26:28', '2023-12-19 09:28:00', NULL),
(477, 'V-53a0e1379be3', '185.125.209.53', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36 edg/120.0.0.0', 'de,de-DE;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-19 12:19:50', '2023-12-19 12:19:50', '2023-12-19 12:19:50', '2023-12-19 01:50:00', NULL),
(478, 'V-0e2372d3d169', '185.125.209.53', '19qcuhts3he9pu3ndt52u46n9a', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36 edg/120.0.0.0', 'de,de-DE;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-19 12:19:53', '2023-12-19 12:19:53', '2023-12-19 12:19:53', '2023-12-19 01:53:00', NULL),
(479, 'V-ebfb58efadf2', '35.196.106.40', 'b32t87t2t6p9mtm29nv7msbbb1', 'zoominfobot (zoominfobot at zoominfo dot com)', 'en-us,en-gb,en;q=0.7,*;q=0.3', NULL, NULL, 'desktop', NULL, '2023-12-19 20:32:51', '2023-12-19 20:32:51', '2023-12-19 20:32:51', '2023-12-19 09:51:00', NULL),
(480, 'V-443f1cab37d4', '35.231.38.79', 'kbarm7418csu5ebvi26br0goah', 'zoominfobot (zoominfobot at zoominfo dot com)', 'en-us,en-gb,en;q=0.7,*;q=0.3', NULL, NULL, 'desktop', NULL, '2023-12-20 00:25:29', '2023-12-20 00:25:29', '2023-12-20 00:25:29', '2023-12-20 01:29:00', NULL),
(481, 'V-443041cc41fd', '35.185.94.153', 'a07r1qkb105q3p5aphhntt2sk3', 'zoominfobot (zoominfobot at zoominfo dot com)', 'en-us,en-gb,en;q=0.7,*;q=0.3', NULL, NULL, 'desktop', NULL, '2023-12-20 03:31:30', '2023-12-20 03:31:30', '2023-12-20 03:31:30', '2023-12-20 04:30:00', NULL),
(482, 'V-ac2ce0c618d2', '35.231.113.156', 'okjcbppverd144mh8sercqegl0', 'zoominfobot (zoominfobot at zoominfo dot com)', 'en-us,en-gb,en;q=0.7,*;q=0.3', NULL, NULL, 'desktop', NULL, '2023-12-20 04:58:15', '2023-12-20 04:58:15', '2023-12-20 04:58:15', '2023-12-20 05:15:00', NULL),
(483, 'V-9c49a44abf45', '34.74.104.122', 'bjqrqqddkr7ro1f7pu0d9ide8c', 'zoominfobot (zoominfobot at zoominfo dot com)', 'en-us,en-gb,en;q=0.7,*;q=0.3', NULL, NULL, 'desktop', NULL, '2023-12-20 06:37:22', '2023-12-20 06:37:22', '2023-12-20 06:37:22', '2023-12-20 07:22:00', NULL),
(484, 'V-d480c7523a69', '170.106.159.160', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-20 08:29:48', '2023-12-20 08:29:48', '2023-12-20 08:29:48', '2023-12-20 09:48:00', NULL),
(485, 'V-f9348452ed4f', '43.130.47.136', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-20 16:00:04', '2023-12-20 16:00:04', '2023-12-20 16:00:04', '2023-12-20 05:04:00', NULL),
(486, 'V-4d0df7c0808b', '104.206.162.182', '-1', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) chrome/114.0.0.0 safari/537.36', 'en-US,en;q=0.5', 'linux', 'chrome', 'desktop', NULL, '2023-12-21 05:43:38', '2023-12-21 05:43:38', '2023-12-21 05:43:38', '2023-12-21 06:38:00', NULL),
(487, 'V-bae1550ecd9c', '107.158.118.229', 'rimcsqtgf85mm15rs8630rfnkg', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) chrome/114.0.0.0 safari/537.36', 'en-US,en;q=0.5', 'linux', 'chrome', 'desktop', NULL, '2023-12-21 05:43:39', '2023-12-21 05:43:39', '2023-12-21 05:43:39', '2023-12-21 06:39:00', NULL),
(488, 'V-0ff88790551a', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-21 05:53:47', '2023-12-21 05:53:47', '2023-12-21 05:53:47', '2023-12-21 06:47:00', NULL),
(489, 'V-6da179d25143', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-21 05:53:53', '2023-12-21 05:53:53', '2023-12-21 05:53:53', '2023-12-21 06:53:00', NULL),
(490, 'V-b493ead707f6', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-21 05:54:02', '2023-12-21 05:54:02', '2023-12-21 05:54:02', '2023-12-21 06:02:00', NULL),
(491, 'V-d396fd3be115', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-21 05:55:34', '2023-12-21 05:55:34', '2023-12-21 05:55:34', '2023-12-21 06:34:00', NULL),
(492, 'V-ecd8b0ecf56a', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-21 06:29:29', '2023-12-21 06:29:29', '2023-12-21 06:29:29', '2023-12-21 07:29:00', NULL),
(493, 'V-195e92375611', '146.190.128.82', '-1', 'mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) chrome/108.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'linux', 'chrome', 'desktop', NULL, '2023-12-21 07:37:51', '2023-12-21 07:37:51', '2023-12-21 07:37:51', '2023-12-21 08:51:00', NULL),
(494, 'V-78f1ec8a3083', '49.51.179.103', '-1', 'mozilla/5.0 (iphone; cpu iphone os 13_2_3 like mac os x) applewebkit/605.1.15 (khtml, like gecko) version/13.0.3 mobile/15e148 safari/604.1', 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7', 'iOS', 'safari', 'mobile', NULL, '2023-12-21 10:27:58', '2023-12-21 10:27:58', '2023-12-21 10:27:58', '2023-12-21 11:58:00', NULL),
(495, 'V-0c2585eafc38', '5.133.192.87', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/105.0.0.0 safari/537.36', 'en-US', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 00:37:26', '2023-12-22 00:37:26', '2023-12-22 00:37:26', '2023-12-22 01:26:00', NULL),
(496, 'V-8fe29cc33f6d', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:32:32', '2023-12-22 02:32:32', '2023-12-22 02:32:32', '2023-12-22 03:32:00', NULL),
(497, 'V-ddbd5c1d7e69', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:32:39', '2023-12-22 02:32:39', '2023-12-22 02:32:39', '2023-12-22 03:39:00', NULL),
(498, 'V-01c2a48bbdd1', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:38:37', '2023-12-22 02:38:37', '2023-12-22 02:38:37', '2023-12-22 03:37:00', NULL),
(499, 'V-2fc72f13b150', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:38:47', '2023-12-22 02:38:47', '2023-12-22 02:38:47', '2023-12-22 03:47:00', NULL),
(500, 'V-d92eaf996689', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:39:15', '2023-12-22 02:39:15', '2023-12-22 02:39:15', '2023-12-22 03:15:00', NULL),
(501, 'V-6b9d863b033a', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:39:16', '2023-12-22 02:39:16', '2023-12-22 02:39:16', '2023-12-22 03:16:00', NULL),
(502, 'V-58ed0fd86a4a', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:39:20', '2023-12-22 02:39:20', '2023-12-22 02:39:20', '2023-12-22 03:20:00', NULL),
(503, 'V-0abdf56e689e', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:39:23', '2023-12-22 02:39:23', '2023-12-22 02:39:23', '2023-12-22 03:23:00', NULL),
(504, 'V-c05d5e046445', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:39:24', '2023-12-22 02:39:24', '2023-12-22 02:39:24', '2023-12-22 03:24:00', NULL),
(505, 'V-bac5982dfc26', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:39:26', '2023-12-22 02:39:26', '2023-12-22 02:39:26', '2023-12-22 03:26:00', NULL),
(506, 'V-c960a14b704f', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:39:28', '2023-12-22 02:39:28', '2023-12-22 02:39:28', '2023-12-22 03:28:00', NULL),
(507, 'V-7695eed29f87', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:39:32', '2023-12-22 02:39:32', '2023-12-22 02:39:32', '2023-12-22 03:32:00', NULL),
(508, 'V-c2c42d3c898c', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:39:48', '2023-12-22 02:39:48', '2023-12-22 02:39:48', '2023-12-22 03:48:00', NULL),
(509, 'V-ec2718c26e60', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:39:51', '2023-12-22 02:39:51', '2023-12-22 02:39:51', '2023-12-22 03:51:00', NULL),
(510, 'V-73fa13598d07', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:39:53', '2023-12-22 02:39:53', '2023-12-22 02:39:53', '2023-12-22 03:53:00', NULL),
(511, 'V-1c3027ec2d0d', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:39:55', '2023-12-22 02:39:55', '2023-12-22 02:39:55', '2023-12-22 03:55:00', NULL),
(512, 'V-d6c12626d751', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:39:58', '2023-12-22 02:39:58', '2023-12-22 02:39:58', '2023-12-22 03:58:00', NULL),
(513, 'V-82c8ef0e0f35', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:40:01', '2023-12-22 02:40:01', '2023-12-22 02:40:01', '2023-12-22 03:01:00', NULL),
(514, 'V-323b5e97ada8', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:40:03', '2023-12-22 02:40:03', '2023-12-22 02:40:03', '2023-12-22 03:03:00', NULL),
(515, 'V-fb03033f8db3', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:40:05', '2023-12-22 02:40:05', '2023-12-22 02:40:05', '2023-12-22 03:05:00', NULL),
(516, 'V-0c9672198dca', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:40:11', '2023-12-22 02:40:11', '2023-12-22 02:40:11', '2023-12-22 03:11:00', NULL),
(517, 'V-f77f1fe479e4', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:40:14', '2023-12-22 02:40:14', '2023-12-22 02:40:14', '2023-12-22 03:14:00', NULL),
(518, 'V-04b35b49e29f', '2a02:8388:a181:1a00:3453:d4f5:542', 'aked9np0qu9l78j3gor6vr0c8c', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 02:40:21', '2023-12-22 02:40:21', '2023-12-22 02:40:21', '2023-12-22 03:21:00', NULL),
(519, 'V-57b6a9cc8c3b', '2a02:8388:a181:1a00:3453:d4f5:542', '-1', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 03:21:37', '2023-12-22 03:21:37', '2023-12-22 03:21:37', '2023-12-22 04:37:00', NULL),
(520, 'V-6b38627b7c6e', '2a02:8388:a181:1a00:3453:d4f5:542', 'og96a7ql314kfpdussv78ijpld', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 03:21:55', '2023-12-22 03:21:55', '2023-12-22 03:21:55', '2023-12-22 04:55:00', NULL),
(521, 'V-caa392ab128c', '2a02:8388:a181:1a00:3453:d4f5:542', 'og96a7ql314kfpdussv78ijpld', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 03:21:59', '2023-12-22 03:21:59', '2023-12-22 03:21:59', '2023-12-22 04:59:00', NULL),
(522, 'V-aab842233512', '74.125.208.7', '-1', 'mozilla/5.0 (macintosh; intel mac os x 10_15_7) applewebkit/537.36 (khtml, like gecko) chrome/94.0.4590.2 safari/537.36 chrome-lighthouse', 'en-US', 'mac os catalina', 'chrome', 'desktop', NULL, '2023-12-22 03:24:44', '2023-12-22 03:24:44', '2023-12-22 03:24:44', '2023-12-22 04:44:00', NULL),
(523, 'V-661182241e2b', '74.125.208.7', 'qpfuuqa9n33gl2h8568432sliq', 'mozilla/5.0 (macintosh; intel mac os x 10_15_7) applewebkit/537.36 (khtml, like gecko) chrome/94.0.4590.2 safari/537.36 chrome-lighthouse', 'en-US', 'mac os catalina', 'chrome', 'desktop', NULL, '2023-12-22 03:24:56', '2023-12-22 03:24:56', '2023-12-22 03:24:56', '2023-12-22 04:56:00', NULL),
(524, 'V-a30fa14a4394', '66.102.9.169', '-1', 'mozilla/5.0 (linux; android 7.0; moto g (4)) applewebkit/537.36 (khtml, like gecko) chrome/94.0.4590.2 mobile safari/537.36 chrome-lighthouse', 'en-US', 'android', 'chrome', 'mobile', NULL, '2023-12-22 03:25:28', '2023-12-22 03:25:28', '2023-12-22 03:25:28', '2023-12-22 04:28:00', NULL),
(525, 'V-14d3aaa63f52', '66.102.9.160', 'mu3s30aaf8b4fo0ieob0928k8v', 'mozilla/5.0 (linux; android 7.0; moto g (4)) applewebkit/537.36 (khtml, like gecko) chrome/94.0.4590.2 mobile safari/537.36 chrome-lighthouse', 'en-US', 'android', 'chrome', 'mobile', NULL, '2023-12-22 03:25:40', '2023-12-22 03:25:40', '2023-12-22 03:25:40', '2023-12-22 04:40:00', NULL),
(526, 'V-81b08d8b7800', '2a02:8388:a181:1a00:3453:d4f5:542', 'og96a7ql314kfpdussv78ijpld', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 03:27:53', '2023-12-22 03:27:53', '2023-12-22 03:27:53', '2023-12-22 04:53:00', NULL),
(527, 'V-7f8f707353c2', '2a02:8388:a181:1a00:3453:d4f5:542', 'og96a7ql314kfpdussv78ijpld', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/120.0.0.0 safari/537.36', 'en-US,en;q=0.9', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-22 03:30:12', '2023-12-22 03:30:12', '2023-12-22 03:30:12', '2023-12-22 04:12:00', NULL),
(528, 'V-dfc0312787b6', '45.128.160.157', '-1', 'mozilla/5.0 (macintosh; intel mac os x 10_15_4) applewebkit/537.36 (khtml, like gecko) chrome/83.0.4103.97 safari/537.36', 'en-US', 'mac os catalina', 'chrome', 'desktop', NULL, '2023-12-22 03:39:20', '2023-12-22 03:39:20', '2023-12-22 03:39:20', '2023-12-22 04:20:00', NULL),
(529, 'V-1760be159f39', '172.18.0.1', 'f763407acbed519d65dfa7da307f228f', 'mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/117.0.5938.150 safari/537.36', 'en-US,en;q=0.9,ar;q=0.8,de-AT;q=0.7,de;q=0.6', 'windows 10', 'chrome', 'desktop', NULL, '2023-12-23 17:58:42', '2023-12-23 17:58:42', '2023-12-23 17:58:42', '2023-12-23 06:42:00', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authentication`
--
ALTER TABLE `authentication`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `guide` (`guide`) USING BTREE,
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `owner` (`owner`);

--
-- Indexes for table `filestorage`
--
ALTER TABLE `filestorage`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `guide` (`guide`) USING BTREE;

--
-- Indexes for table `mailbox`
--
ALTER TABLE `mailbox`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `guide` (`guide`) USING BTREE;

--
-- Indexes for table `mailshistory`
--
ALTER TABLE `mailshistory`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `guide` (`guide`) USING BTREE;

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `guide` (`guide`) USING BTREE;

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `guide` (`guide`) USING BTREE;

--
-- Indexes for table `passwordreset`
--
ALTER TABLE `passwordreset`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `guide` (`guide`) USING BTREE,
  ADD UNIQUE KEY `verifiedcode` (`verifiedcode`),
  ADD KEY `owner` (`owner`);

--
-- Indexes for table `permissiongroups`
--
ALTER TABLE `permissiongroups`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `guide` (`guide`) USING BTREE;

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `guide` (`guide`) USING BTREE;

--
-- Indexes for table `projectcategories`
--
ALTER TABLE `projectcategories`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `guide` (`guide`) USING BTREE,
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `projectfile`
--
ALTER TABLE `projectfile`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `guide` (`guide`) USING BTREE,
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `projectmeta`
--
ALTER TABLE `projectmeta`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `guide` (`guide`) USING BTREE,
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `guide` (`guide`) USING BTREE;

--
-- Indexes for table `projecttags`
--
ALTER TABLE `projecttags`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `guide` (`guide`) USING BTREE,
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `guide` (`guide`) USING BTREE;

--
-- Indexes for table `traffic`
--
ALTER TABLE `traffic`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `guide` (`guide`) USING BTREE,
  ADD KEY `visitor_id` (`visitor_id`);

--
-- Indexes for table `usergroup`
--
ALTER TABLE `usergroup`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `guide` (`guide`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `guide` (`guide`) USING BTREE;

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `guide` (`guide`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authentication`
--
ALTER TABLE `authentication`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `filestorage`
--
ALTER TABLE `filestorage`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mailbox`
--
ALTER TABLE `mailbox`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mailshistory`
--
ALTER TABLE `mailshistory`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `passwordreset`
--
ALTER TABLE `passwordreset`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `permissiongroups`
--
ALTER TABLE `permissiongroups`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `projectcategories`
--
ALTER TABLE `projectcategories`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `projectfile`
--
ALTER TABLE `projectfile`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `projectmeta`
--
ALTER TABLE `projectmeta`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `projecttags`
--
ALTER TABLE `projecttags`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `records`
--
ALTER TABLE `records`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=671;

--
-- AUTO_INCREMENT for table `traffic`
--
ALTER TABLE `traffic`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=718;

--
-- AUTO_INCREMENT for table `usergroup`
--
ALTER TABLE `usergroup`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=530;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authentication`
--
ALTER TABLE `authentication`
  ADD CONSTRAINT `authentication_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `users` (`uid`) ON DELETE CASCADE;

--
-- Constraints for table `passwordreset`
--
ALTER TABLE `passwordreset`
  ADD CONSTRAINT `passwordreset_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `users` (`uid`) ON DELETE CASCADE;

--
-- Constraints for table `projectcategories`
--
ALTER TABLE `projectcategories`
  ADD CONSTRAINT `project_ibfk_3` FOREIGN KEY (`project_id`) REFERENCES `projects` (`uid`) ON DELETE CASCADE;

--
-- Constraints for table `projectfile`
--
ALTER TABLE `projectfile`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`uid`) ON DELETE CASCADE;

--
-- Constraints for table `projectmeta`
--
ALTER TABLE `projectmeta`
  ADD CONSTRAINT `project_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`uid`) ON DELETE CASCADE;

--
-- Constraints for table `projecttags`
--
ALTER TABLE `projecttags`
  ADD CONSTRAINT `project_ibfk_4` FOREIGN KEY (`project_id`) REFERENCES `projects` (`uid`) ON DELETE CASCADE;

--
-- Constraints for table `traffic`
--
ALTER TABLE `traffic`
  ADD CONSTRAINT `visitor_ibfk_1` FOREIGN KEY (`visitor_id`) REFERENCES `visitors` (`uid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
