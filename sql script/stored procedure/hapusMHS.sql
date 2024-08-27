CREATE DEFINER=`root`@`localhost` PROCEDURE `hapusMHS`(IN `kunci` VARCHAR(255))
delete from t_mhs where nim = `kunci`