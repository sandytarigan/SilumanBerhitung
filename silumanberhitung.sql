-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2019 at 10:24 PM
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
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `idGuru` int(10) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `idUser` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pelajar`
--

CREATE TABLE `pelajar` (
  `idPelajar` int(10) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `idUser` int(10) UNSIGNED NOT NULL,
  `idSkor` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelajar`
--

INSERT INTO `pelajar` (`idPelajar`, `nama`, `email`, `idUser`, `idSkor`) VALUES
(1, 'kapanpulang', 'hdsadadhsadh', 11, 3);

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
(3, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `soaldankuncijawaban`
--

CREATE TABLE `soaldankuncijawaban` (
  `idSoalDanKunJaw` int(10) UNSIGNED NOT NULL,
  `soal` varchar(200) NOT NULL,
  `jawaban` decimal(10,5) NOT NULL,
  `idGuru` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `idUser` int(10) UNSIGNED NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL,
  `peran` smallint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idUser`, `username`, `password`, `peran`) VALUES
(11, 'kapanpulang', '6fb9a162585aacd8ce2fe8e439e8ee13', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`idGuru`),
  ADD KEY `idUser` (`idUser`);

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
-- Indexes for table `soaldankuncijawaban`
--
ALTER TABLE `soaldankuncijawaban`
  ADD PRIMARY KEY (`idSoalDanKunJaw`),
  ADD KEY `idGuru` (`idGuru`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `idGuru` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pelajar`
--
ALTER TABLE `pelajar`
  MODIFY `idPelajar` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `skor`
--
ALTER TABLE `skor`
  MODIFY `idSkor` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `soaldankuncijawaban`
--
ALTER TABLE `soaldankuncijawaban`
  MODIFY `idSoalDanKunJaw` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `guru`
--
ALTER TABLE `guru`
  ADD CONSTRAINT `guru_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`);

--
-- Constraints for table `pelajar`
--
ALTER TABLE `pelajar`
  ADD CONSTRAINT `pelajar_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`),
  ADD CONSTRAINT `pelajar_ibfk_2` FOREIGN KEY (`idSkor`) REFERENCES `skor` (`idSkor`);

--
-- Constraints for table `soaldankuncijawaban`
--
ALTER TABLE `soaldankuncijawaban`
  ADD CONSTRAINT `soaldankuncijawaban_ibfk_1` FOREIGN KEY (`idGuru`) REFERENCES `guru` (`idGuru`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
