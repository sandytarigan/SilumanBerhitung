-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 01, 2019 at 10:32 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `silumanberhitung`
--

-- --------------------------------------------------------

--
-- Table structure for table `pelajar`
--

CREATE TABLE `pelajar` (
  `idPelajar` int(10) UNSIGNED NOT NULL,
  `nama` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `idUser` int(10) UNSIGNED NOT NULL,
  `idSkor` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelajar`
--

INSERT INTO `pelajar` (`idPelajar`, `nama`, `email`, `idUser`, `idSkor`) VALUES
(1, 'Pra Tama Yoga Mulu Ah', 'PTYMA@tama.com', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `skor`
--

CREATE TABLE `skor` (
  `idSkor` int(10) UNSIGNED NOT NULL,
  `nilai` int(3) NOT NULL,
  `benar` int(4) UNSIGNED NOT NULL,
  `salah` int(4) UNSIGNED NOT NULL,
  `menang` int(3) UNSIGNED NOT NULL,
  `kalah` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skor`
--

INSERT INTO `skor` (`idSkor`, `nilai`, `benar`, `salah`, `menang`, `kalah`) VALUES
(1, 9999, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `idUser` int(10) UNSIGNED NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `peran` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idUser`, `username`, `password`, `peran`) VALUES
(1, 'haydar', 'sdjhadas', 'Pelajar'),
(2, 'iday', 'fsdalkjfsfj', 'Guru');

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `siluman berhitung`.`guru` ( 
    `idGuru` INT(10) UNSIGNED NOT NULL , 
    `nama` VARCHAR(30) NOT NULL , 
    `email` VARCHAR(30) NOT NULL , 
    `idUser` INT(10) UNSIGNED NOT NULL , 
    PRIMARY KEY (`idGuru`)
    ) ENGINE = InnoDB;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`idGuru`, `nama`, `email`, `idUser`) VALUES ('01', 'Bu Anissa', 'dosencantik@gmail.com', 'bunissa');

-- --------------------------------------------------------
--
-- Table structure for table `soal dan kunci jawaban`
--

CREATE TABLE `siluman berhitung`.`Soal Dan Kunci Jawaban` ( 
      `idSoalDanKunJaw` INT(10) UNSIGNED NOT NULL , 
      `soal` VARCHAR(1000) NOT NULL , 
      `jawaban` VARCHAR(1000) NOT NULL , 
      `idGuru` INT(10) UNSIGNED NOT NULL , 
      PRIMARY KEY (`idSoalDanKunJaw`)
      ) ENGINE = InnoDB;

--
-- Dumping data for table `soal dan kunci jawaban`
--

INSERT INTO `soal dan kunci jawaban` (`idSoalDanKunJaw`, `soal`, `jawaban`, `idGuru`) VALUES ('01', 'siapa saya?', 'gak peduli, next', '1');

-- --------------------------------------------------------
--
-- Indexes for dumped tables
--

--
-- Indexes for table `pelajar`
--
ALTER TABLE `pelajar`
  ADD PRIMARY KEY (`idPelajar`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idSkor` (`idSkor`);

--
-- Indexes for table `skor`
--
ALTER TABLE `skor`
  ADD PRIMARY KEY (`idSkor`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pelajar`
--
ALTER TABLE `pelajar`
  MODIFY `idPelajar` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `skor`
--
ALTER TABLE `skor`
  MODIFY `idSkor` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pelajar`
--
ALTER TABLE `pelajar`
  ADD CONSTRAINT `pelajar_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`),
  ADD CONSTRAINT `pelajar_ibfk_2` FOREIGN KEY (`idSkor`) REFERENCES `skor` (`idSkor`);
  
SELECT * FROM 'pelajar';
SELECT * FROM 'user';
COMMIT;

--
-- Table structure for table `skortertinggi`
--

CREATE TABLE `skortertinggi` (
  `peringkat` int(5) UNSIGNED NOT NULL,
  `benar` int(10) NOT NULL,
  `salah` int(10) NOT NULL,
  `total` int(10) NOT NULL,
  'skor' int (10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skortertinggi`
--

INSERT INTO `skortertinggi` (`peringkat`, `benar`, `salah`, `total`, 'skor') VALUES
(1, '5', '5', '5', '10', '300'),
(2, '3', '7', '3', '10', '500'),
(3, '2', '8', '2', '10', '800'),
(4, '1', '10', '0', '10', '1000');

--
-- Indexes for dumped tables
--

-- Indexes for table `skortertinggi`
--
ALTER TABLE `skortertinggi`
  ADD PRIMARY KEY (`peringkat`);

--
SELECT * FROM 'skortertinggi';
COMMIT;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
