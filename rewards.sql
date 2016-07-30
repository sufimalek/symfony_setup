-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 30, 2016 at 12:25 PM
-- Server version: 5.5.49-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rewards`
--

-- --------------------------------------------------------

--
-- Table structure for table `giveaway`
--

CREATE TABLE IF NOT EXISTS `giveaway` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `admin_only` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `giveaway`
--

INSERT INTO `giveaway` (`id`, `name`, `price`, `slug`, `created`, `updated`, `deletedAt`, `admin_only`) VALUES
(1, 'Jecobs', 3000, 'jacobs', '2016-07-28 00:00:00', '2016-07-29 00:00:00', NULL, 1),
(2, 'Audi Q7', 50000, 'audi-q7', '2016-07-28 00:00:00', '2016-07-29 00:00:00', NULL, 0),
(3, 'Baleno', 4000, 'baleno', '2016-07-28 00:00:00', '2016-07-29 00:00:00', NULL, 1),
(4, 'Celerio', 3000, 'celerio', '2016-07-28 00:00:00', '2016-07-29 00:00:00', NULL, 0),
(5, 'Benz', 938399, 'benz', '2016-07-27 00:00:00', '2016-07-29 00:00:00', NULL, 0),
(6, 'Zeus', 4827, 'zeus', '2016-07-27 00:00:00', '2016-07-29 00:00:00', NULL, 0),
(7, 'Laura', 33738, 'laura', '2016-07-28 00:00:00', '2016-07-29 00:00:00', NULL, 0),
(8, 'Audi Q7', 60000, 'audi-q9', '2016-07-28 00:00:00', '2016-07-29 00:00:00', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D64992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_8D93D649A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`) VALUES
(1, 'test', 'test', 'test@mail.com', 'test@mail.com', 1, 'tg7fgmxv61w4wskswsccwgo4g80gows', '$2y$13$tg7fgmxv61w4wskswsccwecnYPurHOO7GVHdMBUasgjxOdMTxwJfO', '2016-07-30 11:43:14', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL),
(2, 'test2', 'test2', 'test2@mail.com', 'test2@mail.com', 1, 'f8uzwwxxgpsgo4kwoo4wogs0kk88ck0', '$2y$13$f8uzwwxxgpsgo4kwoo4woeQ.cUm3K19XuzDOHGUeo0ORw3ZgiUpxi', '2016-07-30 11:17:45', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(3, 'Sufiyan Malek', 'sufiyan malek', 'sufiyanmalek78@gmail.com', 'sufiyanmalek78@gmail.com', 1, 'h2wa621dgmgog08ckckgsoc88k440c4', '$2y$13$h2wa621dgmgog08ckckgseJjZN8wO872mjew2aUaR4fUIuhZynRe.', '2016-07-30 10:43:37', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL),
(4, 'Rewards', 'rewards', 'rewards@gg.gg', 'rewards@gg.gg', 1, 'gh6rwob0rp4w8wosgskc0ccwwwc4ccw', '$2y$13$gh6rwob0rp4w8wosgskc0OshYxd4Vbox2MqZ142hx/Lte7u7afcBC', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(5, 'Rewards2', 'rewards2', 'admin@example.com', 'admin@example.com', 1, 'evc3ubo38z4sgk4sggwwkgss4g0o4w0', '$2y$13$evc3ubo38z4sgk4sggwwkeoXyiuBGulTU0x4Y/CSxTCUqlTqsFh8.', '2016-07-30 11:45:00', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
