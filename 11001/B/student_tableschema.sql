-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-12-22 05:29:56
-- 伺服器版本： 10.4.19-MariaDB
-- PHP 版本： 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `ksu_database`
--

-- --------------------------------------------------------

--
-- 資料表結構 `student`
--

CREATE TABLE `student` (
  `Major` varchar(10) NOT NULL,
  `Student_ID` varchar(10) NOT NULL,
  `Name` varchar(10) NOT NULL,
  `Sex` varchar(1) NOT NULL,
  `Grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `student`
--

INSERT INTO `student` (`Major`, `Student_ID`, `Name`, `Sex`, `Grade`) VALUES
('\'IM\'', '\'4070M001\'', '\'Canning J', '\'', 0),
('\'IM\'', '\'4070M002\'', '\'Stracy Me', '\'', 0),
('\'IM\'', '\'4070M005\'', '\'Mike Trai', '\'', 0),
('CS', '4090E090', 'Mary Wong', 'F', 100),
('CS', '4090E092', 'Mary Chen', 'F', 70),
('CS', '4090E101', 'John Sieg', 'M', 90),
('CS', '4090E102', 'John Sieg', 'M', 90),
('IE', '4090I003', 'Mike Wu', 'M', 100),
('IE', '4090I009', 'Mike Li', 'M', 80),
('IE', '4090I099', 'Kathy Wu', 'F', 88);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Student_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
