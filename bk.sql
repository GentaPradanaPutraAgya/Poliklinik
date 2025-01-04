/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - db_obat
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_obat` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `db_obat`;

/*Table structure for table `tabel daftar_poli` */

DROP TABLE IF EXISTS `tabel daftar_poli`;

CREATE TABLE `tabel daftar_poli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pasien` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `keluahan` text NOT NULL,
  `no_antrian` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tabel daftar_poli` */

/*Table structure for table `tabel detail periksa` */

DROP TABLE IF EXISTS `tabel detail periksa`;

CREATE TABLE `tabel detail periksa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_periksa` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tabel detail periksa` */

/*Table structure for table `tabel dokter` */

DROP TABLE IF EXISTS `tabel dokter`;

CREATE TABLE `tabel dokter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(150) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_hp` int(10) unsigned NOT NULL,
  `id_poli` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_poli` (`id_poli`),
  CONSTRAINT `tabel dokter_ibfk_1` FOREIGN KEY (`id_poli`) REFERENCES `tabel poli` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tabel dokter` */

/*Table structure for table `tabel jadwal periksa` */

DROP TABLE IF EXISTS `tabel jadwal periksa`;

CREATE TABLE `tabel jadwal periksa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_dokter` int(11) NOT NULL,
  `hari` varchar(10) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tabel jadwal periksa` */

/*Table structure for table `tabel obat` */

DROP TABLE IF EXISTS `tabel obat`;

CREATE TABLE `tabel obat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_obat` varchar(50) NOT NULL,
  `kemasan` varchar(35) DEFAULT NULL,
  `harga` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tabel obat` */

/*Table structure for table `tabel pasien` */

DROP TABLE IF EXISTS `tabel pasien`;

CREATE TABLE `tabel pasien` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(150) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `no_ktp` int(10) unsigned NOT NULL,
  `no_hp` int(10) unsigned NOT NULL,
  `no_rm` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tabel pasien` */

/*Table structure for table `tabel periksa` */

DROP TABLE IF EXISTS `tabel periksa`;

CREATE TABLE `tabel periksa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_daftar_poli` int(11) NOT NULL,
  `tgl_periksa` date NOT NULL,
  `catatan` text NOT NULL,
  `biaya_periksa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tabel periksa` */

/*Table structure for table `tabel poli` */

DROP TABLE IF EXISTS `tabel poli`;

CREATE TABLE `tabel poli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_poli` varchar(25) NOT NULL,
  `keterangan` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tabel poli` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
