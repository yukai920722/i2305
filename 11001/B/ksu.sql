-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-11-04 09:20:53
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

DELIMITER $$
--
-- 程序
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `test1` ()  NO SQL
SELECT * FROM ksu_std_table$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `test2` (IN `p1` INT)  NO SQL
if p1 < 60 THEN
      SELECT *
      FROM ksu_std_table
      WHERE ksu_std_grade < 60 ;
ELSE
      SELECT *
      FROM ksu_std_table
      WHERE ksu_std_grade >=60 ;
END IF$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `test3` (IN `weight` INT, IN `height` INT)  NO SQL
BEGIN
DECLARE BMI INT;
SET BMI=weight/height*height;
IF BMI>24 THEN
SELECT CONCAT('Your BMI is ',BMI,' over heavy!');
ELSEIF BMI>18 THEN
SELECT CONCAT('Your BMI is ',BMI,' Normal.');
ELSE
SELECT CONCAT('YOUR BMI is ',BMI,' skinny!');
END if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `test4` (IN `p1` INT)  NO SQL
BEGIN
DECLARE p1by INT;
SET p1by=p1 *0.6;
if p1by < 6 THEN
      SELECT *
      FROM ksu_std_table
      WHERE ksu_std_grade < 60;
ELSE
      SELECT *
      FROM ksu_std_table
      WHERE ksu_std_grade < 60;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `test5` ()  NO SQL
BEGIN
SET AUTOCOMMIT=0;
DROP TABLE IF EXISTS test_table1, test_table2;
CREATE TABLE test_table1 (id int);
INSERT into test_table1 VALUES (100);
COMMIT;
CREATE TABLE test_table2(id int);
INSERT into test_table2 VALUES (100);
ROLLBACK;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 資料表結構 `advisor_detail`
--

CREATE TABLE `advisor_detail` (
  `std_advisor` varchar(3) NOT NULL,
  `advisor_name` varchar(15) NOT NULL,
  `advisor_cell` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `advisor_detail`
--

INSERT INTO `advisor_detail` (`std_advisor`, `advisor_name`, `advisor_cell`) VALUES
('T01', 'John Wick', 910123456),
('T02', 'Mary Win', 912345667),
('T03', 'Stephine Li', 12345612),
('T04', 'Mike Wang', 23441234),
('Mik', 'John Sieg', 910981212),
('M01', 'John Sieg', 910981212),
('M05', 'John Sieg', 910981212),
('M06', 'John Sier', 910981214),
('M07', 'John Sied', 910981215);

-- --------------------------------------------------------

--
-- 資料表結構 `city_detail`
--

CREATE TABLE `city_detail` (
  `std_city_id` char(2) NOT NULL,
  `std_city_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `city_detail`
--

INSERT INTO `city_detail` (`std_city_id`, `std_city_name`) VALUES
('A1', 'Taipei'),
('A2', 'Tainan'),
('A3', 'Kaoshiung'),
('A4', 'Taichung');

-- --------------------------------------------------------

--
-- 資料表結構 `customer`
--

CREATE TABLE `customer` (
  `First_Name` char(50) DEFAULT NULL,
  `Last_Name` char(50) DEFAULT NULL,
  `Addr` char(30) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Country` char(25) DEFAULT NULL,
  `Birth_Date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `dept_detail`
--

CREATE TABLE `dept_detail` (
  `dept_id` char(2) NOT NULL,
  `dept_name` varchar(26) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `dept_detail`
--

INSERT INTO `dept_detail` (`dept_id`, `dept_name`) VALUES
('IE', 'Information Engineer'),
('IM', 'Information Management'),
('ME', 'Mechanic Engineering');

-- --------------------------------------------------------

--
-- 資料表結構 `employee_salary_error`
--

CREATE TABLE `employee_salary_error` (
  `employee_no` varchar(20) NOT NULL,
  `employee_salary` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `employee_salary_error`
--

INSERT INTO `employee_salary_error` (`employee_no`, `employee_salary`) VALUES
('A001', '2000'),
('A002', '3000'),
('A003', '$1200'),
('A004', '$1300');

-- --------------------------------------------------------

--
-- 資料表結構 `geography`
--

CREATE TABLE `geography` (
  `Region_Name` varchar(20) NOT NULL,
  `store_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `geography`
--

INSERT INTO `geography` (`Region_Name`, `store_name`) VALUES
('East', 'Boston'),
('East', 'New York'),
('West', 'Los Angeles'),
('West', 'San Diego');

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

-- --------------------------------------------------------

--
-- 資料表結構 `product_detail`
--

CREATE TABLE `product_detail` (
  `product_name` varchar(20) NOT NULL,
  `product_price` double(12,2) NOT NULL,
  `product_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `product_detail`
--

INSERT INTO `product_detail` (`product_name`, `product_price`, `product_date`) VALUES
('洋芋片', 50.50, '2020-03-29 00:00:00'),
('可樂', 25.20, '2020-03-29 00:00:00'),
('洋芋片', 50.50, '2020-03-29 00:00:00'),
('可樂', 25.20, '2020-03-29 00:00:00'),
('洋芋片', 50.50, '2020-03-29 00:00:00'),
('可樂', 25.20, '2020-03-29 00:00:00'),
('洋芋片', 50.50, '2020-03-29 00:00:00'),
('可樂', 25.20, '2020-03-29 00:00:00');

-- --------------------------------------------------------

--
-- 資料表結構 `store_information`
--

CREATE TABLE `store_information` (
  `Store_Name` varchar(20) CHARACTER SET latin1 NOT NULL,
  `Sales` int(5) NOT NULL,
  `Txn_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `store_information`
--

INSERT INTO `store_information` (`Store_Name`, `Sales`, `Txn_Date`) VALUES
('Los Angeles', 1500, '1999-01-05'),
('San Diego', 250, '1999-01-07'),
('San Francisco', 300, '1999-01-08'),
('Boston', 700, '1999-01-08');

-- --------------------------------------------------------

--
-- 資料表結構 `store_information_1`
--

CREATE TABLE `store_information_1` (
  `Store_Name` varchar(20) CHARACTER SET latin1 NOT NULL,
  `Sales` int(5) NOT NULL,
  `Txn_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `store_information_1`
--

INSERT INTO `store_information_1` (`Store_Name`, `Sales`, `Txn_Date`) VALUES
('Los Angeles', 1500, '1999-01-05'),
('San Diego', 250, '1999-01-07'),
('Los Angeles', 300, '1999-01-08'),
('Boston', 700, '1999-01-08');

-- --------------------------------------------------------

--
-- 資料表結構 `student_detail`
--

CREATE TABLE `student_detail` (
  `std_id` char(8) NOT NULL,
  `std_name` varchar(10) NOT NULL,
  `std_city_id` char(2) NOT NULL,
  `std_cell` varchar(10) NOT NULL,
  `std_address` varchar(30) NOT NULL,
  `dept_id` char(2) NOT NULL,
  `std_grade` int(1) NOT NULL,
  `std_advisor` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `student_detail`
--

INSERT INTO `student_detail` (`std_id`, `std_name`, `std_city_id`, `std_cell`, `std_address`, `dept_id`, `std_grade`, `std_advisor`) VALUES
('AB001', 'John Mike', 'A1', '912345678', 'skyline Dr. no. 120', 'IE', 90, 'T01'),
('AB002', 'Wom  Try', 'A2', '912345689', 'station Dr. no. 11', 'IE', 45, 'T01'),
('AB003', 'Wuber Eat', 'A3', '92298753', 'Fire Dr. no 27', 'IE', 99, 'T01'),
('AB004', 'Mike Wu', 'A2', '91198983', 'Water Dr. no 25', 'IE', 22, 'T01'),
('AB005', 'Wuber Eat', 'A2', '92298765', 'Fire Dr. no 27', 'IM', 55, 'T02'),
('AB006', 'Mike Wu', 'A1', '91198987', 'Fire Dr. no 25', 'IE', 88, 'T01'),
('AB007', 'Dave Van', 'A3', '901233333', 'Make Street no. 22', 'ME', 77, 'T03'),
('AB008', 'Mike Fire', 'A1', '912123456', 'Fire Street no 11.', 'IM', 60, 'T02'),
('Q01', 'John Sieg', 'A0', '91076123', 'Merry Dr.', 'IE', 33, 'Wee'),
('Q02', 'Mike Fire', 'A0', '91234123', 'Make Dr.', 'IE', 35, 'We '),
('C001', 'Mike Sieg', 'A0', '', '', 'CS', 66, 'T02');

-- --------------------------------------------------------

--
-- 資料表結構 `test_table01`
--

CREATE TABLE `test_table01` (
  `student_no` varchar(10) NOT NULL,
  `student_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `test_table01`
--

INSERT INTO `test_table01` (`student_no`, `student_name`) VALUES
('A0001', 'John Sieg'),
('A0002', 'Mike Unite'),
('A0003', 'John Miner'),
('A0004', 'Fire John');

-- --------------------------------------------------------

--
-- 資料表結構 `test_table1`
--

CREATE TABLE `test_table1` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `test_table1`
--

INSERT INTO `test_table1` (`id`) VALUES
(100);

-- --------------------------------------------------------

--
-- 資料表結構 `test_table2`
--

CREATE TABLE `test_table2` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `tracing_log`
--

CREATE TABLE `tracing_log` (
  `追蹤碼` varchar(30) NOT NULL,
  `開始時間` datetime NOT NULL,
  `結束時間` datetime NOT NULL,
  `備註` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `tracing_log`
--

INSERT INTO `tracing_log` (`追蹤碼`, `開始時間`, `結束時間`, `備註`) VALUES
('4070E007-B-RED-x-I1W#D#', '2019-11-05 20:00:00', '2019-11-05 21:41:30', ''),
('4070E007-C-TH-U-I1W0D1', '2019-12-02 18:00:00', '2019-12-02 23:10:00', '注意:實作狀態超過3小時'),
('4070E007-C-TH-U-I1W1D1', '2019-12-06 09:30:00', '2019-12-07 11:30:00', '');

-- --------------------------------------------------------

--
-- 資料表結構 `議題意見討論版`
--

CREATE TABLE `議題意見討論版` (
  `學生學號` varchar(20) CHARACTER SET latin1 NOT NULL,
  `發佈時間` datetime NOT NULL,
  `實作名稱` varchar(20) CHARACTER SET latin1 NOT NULL,
  `執行錯誤的訊息` varchar(40) CHARACTER SET latin1 NOT NULL,
  `解決方法` varchar(50) CHARACTER SET latin1 NOT NULL,
  `錯誤來源` varchar(30) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `議題意見討論版`
--

INSERT INTO `議題意見討論版` (`學生學號`, `發佈時間`, `實作名稱`, `執行錯誤的訊息`, `解決方法`, `錯誤來源`) VALUES
('4070E0005', '2019-11-20 21:00:00', '???????Server', ' fatal error: Adafruit_Sensor.h: No such', '<Adafruit_Sensor.h>?????,???????! ', 'Node Mcu??-Arduino ??'),
('4070E0023', '2019-12-01 10:20:00', '???????Server', 'wrong column \"H_valu\" not defined', '\"H_value\" ??!', '?? HT_Detail_table ?????'),
('4070E0005', '2019-11-20 21:00:00', '???????Server', ' fatal error: Adafruit_Sensor.h: No such', '<Adafruit_Sensor.h>?????,???????! ', 'Node Mcu??-Arduino ??'),
('4070E0023', '2019-12-01 10:20:00', '???????Server', 'wrong column \"H_valu\" not defined', '\"H_value\" ??!', '?? HT_Detail_table ?????'),
('4070E0005', '2019-11-20 21:00:00', '???????Server', ' fatal error: Adafruit_Sensor.h: No such', '<Adafruit_Sensor.h>?????,???????! ', 'Node Mcu??-Arduino ??'),
('4070E0023', '2019-12-01 10:20:00', '???????Server', 'wrong column \"H_valu\" not defined', '\"H_value\" ??!', '?? HT_Detail_table ?????');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `dept_detail`
--
ALTER TABLE `dept_detail`
  ADD PRIMARY KEY (`dept_id`);

--
-- 資料表索引 `tracing_log`
--
ALTER TABLE `tracing_log`
  ADD PRIMARY KEY (`追蹤碼`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
