/*
 Navicat Premium Data Transfer

 Source Server         : LocalMySQL
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : dblokal

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 27/08/2024 20:21:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_ampu
-- ----------------------------
DROP TABLE IF EXISTS `t_ampu`;
CREATE TABLE `t_ampu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dosen` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `id_matakuliah` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `periode` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `semester` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_dosen
-- ----------------------------
DROP TABLE IF EXISTS `t_dosen`;
CREATE TABLE `t_dosen`  (
  `id_dosen` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `id_persons` int NOT NULL,
  PRIMARY KEY (`id_dosen`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_krs
-- ----------------------------
DROP TABLE IF EXISTS `t_krs`;
CREATE TABLE `t_krs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tanggal` date NULL DEFAULT NULL,
  `nim` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `semester` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_krs_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_krs_detail`;
CREATE TABLE `t_krs_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_krs` int NOT NULL,
  `id_matakuliah` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tanggal` date NULL DEFAULT current_timestamp,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_matakuliah
-- ----------------------------
DROP TABLE IF EXISTS `t_matakuliah`;
CREATE TABLE `t_matakuliah`  (
  `id_matakuliah` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `nama_matakuliah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `sks` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_matakuliah`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_mhs
-- ----------------------------
DROP TABLE IF EXISTS `t_mhs`;
CREATE TABLE `t_mhs`  (
  `nim` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `id_persons` int NULL DEFAULT NULL,
  PRIMARY KEY (`nim`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_persons
-- ----------------------------
DROP TABLE IF EXISTS `t_persons`;
CREATE TABLE `t_persons`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `tempat_lahir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `tanggal_lahir` date NULL DEFAULT NULL,
  `jenis_kelamin` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `masuk` date NULL DEFAULT NULL,
  `keluar` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- View structure for v_ampu
-- ----------------------------
DROP VIEW IF EXISTS `v_ampu`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_ampu` AS SELECT a.id as id_ampu, a.id_dosen, d.`masuk`, d.`keluar`, d.nama, d.jenis_kelamin, d.tempat_lahir, d.tanggal_lahir, a.id_matakuliah, mk.nama_matakuliah, mk.sks FROM t_ampu AS A LEFT JOIN t_matakuliah AS mk on a.id_matakuliah = mk.id_matakuliah LEFT JOIN v_dosen as d on a.id_dosen = d.id_dosen ;

-- ----------------------------
-- View structure for v_dosen
-- ----------------------------
DROP VIEW IF EXISTS `v_dosen`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_dosen` AS SELECT
	*
FROM
	t_dosen AS d
	LEFT JOIN
	t_persons AS p
	ON 
		d.id_persons = p.id ;

-- ----------------------------
-- View structure for v_krs
-- ----------------------------
DROP VIEW IF EXISTS `v_krs`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_krs` AS SELECT k.id as id_krs, k.nim, k.semester, k.tanggal, m.`masuk`, m.`keluar`, m.id_persons, m.jenis_kelamin, m.nama, m.tempat_lahir, m.tanggal_lahir from t_krs as k LEFT JOIN v_mhs as m on k.nim = m.nim ;

-- ----------------------------
-- View structure for v_krs_detail
-- ----------------------------
DROP VIEW IF EXISTS `v_krs_detail`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_krs_detail` AS SELECT kd.id as id_detail, kd.id_krs, kd.id_matakuliah, mk.nama_matakuliah, mk.sks FROM t_krs_detail AS KD LEFT JOIN t_matakuliah as mk on kd.id_matakuliah = mk.id_matakuliah ;

-- ----------------------------
-- View structure for v_mhs
-- ----------------------------
DROP VIEW IF EXISTS `v_mhs`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_mhs` AS SELECT
	m.*, 
	p.*
FROM
	t_mhs AS M
	LEFT JOIN
	t_persons AS P
	ON 
		M.id_persons = P.id ;

-- ----------------------------
-- Procedure structure for hapusDOSEN
-- ----------------------------
DROP PROCEDURE IF EXISTS `hapusDOSEN`;
delimiter ;;
CREATE PROCEDURE `hapusDOSEN`(IN `kunci` VARCHAR(255))
DELETE from t_dosen WHERE id_dosen = `kunci`
;;
delimiter ;

-- ----------------------------
-- Procedure structure for hapusMHS
-- ----------------------------
DROP PROCEDURE IF EXISTS `hapusMHS`;
delimiter ;;
CREATE PROCEDURE `hapusMHS`(IN `kunci` VARCHAR(255))
delete from t_mhs where nim = `kunci`
;;
delimiter ;

-- ----------------------------
-- Function structure for insertPerson
-- ----------------------------
DROP FUNCTION IF EXISTS `insertPerson`;
delimiter ;;
CREATE FUNCTION `insertPerson`(`pnama` VARCHAR(255), `ptempat_lahir` VARCHAR(255), `ptanggal_lahir` DATE, `pjenis_kelamin` VARCHAR(1), `pmasuk` DATE, `pkeluar` DATE)
 RETURNS int(11)
BEGIN
INSERT INTO t_persons (nama,tempat_lahir, tanggal_lahir, jenis_kelamin, masuk, keluar) VALUES (`pnama`, `ptempat_lahir`, `ptanggal_lahir`, `pjenis_kelamin`, `pmasuk`, `pkeluar`);
return LAST_INSERT_ID();
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sisipDosen
-- ----------------------------
DROP PROCEDURE IF EXISTS `sisipDosen`;
delimiter ;;
CREATE PROCEDURE `sisipDosen`(IN `pid_dosen` varchar(16), IN pnama varchar(255),IN ptempat_lahir varchar(255),IN ptanggal_lahir date,IN pjenis_kelamin varchar(255),IN pmasuk date,IN pkeluar date)
BEGIN
	#Routine body goes here...
	
	INSERT INTO t_dosen (id_dosen,id_persons) VALUES (`pid_dosen`, insertPerson(`pnama`, `ptempat_lahir`, `ptanggal_lahir`, `pjenis_kelamin`, `pmasuk`, `pkeluar`));
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sisipMHS
-- ----------------------------
DROP PROCEDURE IF EXISTS `sisipMHS`;
delimiter ;;
CREATE PROCEDURE `sisipMHS`(IN `pnim` varchar(16), IN pnama varchar(255),IN ptempat_lahir varchar(255),IN ptanggal_lahir date,IN pjenis_kelamin varchar(255),IN pmasuk date,IN pkeluar date)
BEGIN
	#Routine body goes here...
	
	INSERT INTO t_mhs (nim,id_persons) VALUES (`pnim`, insertPerson(`pnama`, `ptempat_lahir`, `ptanggal_lahir`, `pjenis_kelamin`, `pmasuk`, `pkeluar`));
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for tampilDOSEN
-- ----------------------------
DROP PROCEDURE IF EXISTS `tampilDOSEN`;
delimiter ;;
CREATE PROCEDURE `tampilDOSEN`(IN `filter` VARCHAR(255))
select * from v_dosen
;;
delimiter ;

-- ----------------------------
-- Procedure structure for tampilMHS
-- ----------------------------
DROP PROCEDURE IF EXISTS `tampilMHS`;
delimiter ;;
CREATE PROCEDURE `tampilMHS`(IN `filter` VARCHAR(255))
select * from v_mhs
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ubahDOSEN
-- ----------------------------
DROP PROCEDURE IF EXISTS `ubahDOSEN`;
delimiter ;;
CREATE PROCEDURE `ubahDOSEN`(IN `poldid_dosen` VARCHAR(16), 
    IN `pid_dosen` VARCHAR(16), 
    IN `pnama` VARCHAR(255), 
    IN `ptempat_lahir` VARCHAR(255), 
    IN `ptanggal_lahir` DATE, 
    IN `pjenis_kelamin` VARCHAR(255), 
    IN `pmasuk` DATE, 
    IN `pkeluar` DATE)
BEGIN
    DECLARE jml INTEGER;

    SELECT COUNT(*) INTO jml FROM t_dosen WHERE id_dosen = pid_dosen;
    
    IF jml = 0 or pid_dosen = poldid_dosen THEN
        UPDATE t_dosen SET id_dosen = pid_dosen WHERE id_dosen = poldid_dosen;
        
        UPDATE t_persons SET
            nama = pnama,
            jenis_kelamin = pjenis_kelamin,
            tempat_lahir = ptempat_lahir,
            tanggal_lahir = ptanggal_lahir,
            masuk = pmasuk,
            keluar = pkeluar
        WHERE id = (SELECT id_persons FROM t_dosen WHERE id_dosen = pid_dosen);
        
        SELECT 'SUKSES' AS rstatus, 'Data sudah di ubah' AS rpesan;
				select * from v_mhs;
    ELSE
        SELECT 'ERROR' AS rstatus, 'ID DOSEN sudah digunakan' AS rpesan;
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ubahMHS
-- ----------------------------
DROP PROCEDURE IF EXISTS `ubahMHS`;
delimiter ;;
CREATE PROCEDURE `ubahMHS`(IN `poldnim` VARCHAR(16), 
    IN `pnim` VARCHAR(16), 
    IN `pnama` VARCHAR(255), 
    IN `ptempat_lahir` VARCHAR(255), 
    IN `ptanggal_lahir` DATE, 
    IN `pjenis_kelamin` VARCHAR(255), 
    IN `pmasuk` DATE, 
    IN `pkeluar` DATE)
BEGIN
    DECLARE jml INTEGER;

    SELECT COUNT(*) INTO jml FROM t_mhs WHERE nim = pnim;
    
    IF jml = 0 or pnim = poldnim THEN
        UPDATE t_mhs SET nim = pnim WHERE nim = poldnim;
        
        UPDATE t_persons SET
            nama = pnama,
            jenis_kelamin = pjenis_kelamin,
            tempat_lahir = ptempat_lahir,
            tanggal_lahir = ptanggal_lahir,
            masuk = pmasuk,
            keluar = pkeluar
        WHERE id = (SELECT id_persons FROM t_mhs WHERE nim = pnim);
        
        SELECT 'SUKSES' AS rstatus, 'Data sudah di ubah' AS rpesan;
				select * from v_mhs;
    ELSE
        SELECT 'ERROR' AS rstatus, 'NIM sudah digunakan' AS rpesan;
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table t_persons
-- ----------------------------
DROP TRIGGER IF EXISTS `jikaInsert`;
delimiter ;;
CREATE TRIGGER `jikaInsert` AFTER INSERT ON `t_persons` FOR EACH ROW INSERT INTO t_log (keterangan) VALUES (new.nama)
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table t_persons
-- ----------------------------
DROP TRIGGER IF EXISTS `jikaUpdate`;
delimiter ;;
CREATE TRIGGER `jikaUpdate` AFTER UPDATE ON `t_persons` FOR EACH ROW INSERT INTO t_log (keterangan) VALUES ( CONCAT(old.nama, ' menjadi ', new.nama))
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
