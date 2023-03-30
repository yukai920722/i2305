-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-10-21 10:21:26
-- 伺服器版本： 10.4.17-MariaDB
-- PHP 版本： 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `ksu`
--

-- --------------------------------------------------------

--
-- 資料表結構 `ksu_std_table`
--

CREATE TABLE `ksu_std_table` (
  `ksu_std_id` varchar(6) NOT NULL,
  `ksu_std_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ksu_std_age` int(2) NOT NULL,
  `ksu_std_department` char(2) NOT NULL,
  `ksu_std_signin` date NOT NULL,
  `ksu_std_grade` int(1) NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `ksu_std_table`
--

INSERT INTO `ksu_std_table` (`ksu_std_id`, `ksu_std_name`, `ksu_std_age`, `ksu_std_department`, `ksu_std_signin`, `ksu_std_grade`) VALUES
('2323E1', 'John1', 33, 'QQ', '2020-04-01', 100),
('4040w1', 'John1', 22, 'CS', '2020-04-01', 100),
('D01', 'John Sieg', 22, 'CS', '2019-12-05', 100),
('D02', 'John Sieg', 44, 'IE', '2019-12-04', 99),
('IE01', 'Canning', 33, 'IE', '2019-11-12', 100),
('IE02', 'Mike Fire', 32, 'IE', '2019-12-11', 77),
('IE03', 'Mary Wee', 34, 'IM', '2019-12-02', 80),
('IM01', 'WuBer Eat', 22, 'IM', '2019-11-12', 33),
('IM02', 'Foot Penny', 27, 'CS', '2019-10-10', 44),
('IM05', 'John Sieg', 24, 'CS', '2019-12-16', 55),
('ss', '1John', 22, 'CS', '2020-04-01', 100),
('33', '33', 0, '', '0000-00-00', 100),
('9898', 'Mike', 0, '', '0000-00-00', 100),
('777', 'Taiwan', 0, '', '0000-00-00', 100),
('s', 'sss', 0, '', '0000-00-00', 100),
('ddd', 'dddd', 0, '', '0000-00-00', 100);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
