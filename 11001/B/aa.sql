

--
-- Table structure for table `employee_salary_error`
--

CREATE TABLE `employee_salary_error` (
  `employee_no` varchar(20) NOT NULL,
  `employee_salary` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_salary_error`
--

INSERT INTO `employee_salary_error` (`employee_no`, `employee_salary`) VALUES
('A001', '2000'),
('A002', '3000'),
('A003', '$1200'),
('A004', '$1300');

