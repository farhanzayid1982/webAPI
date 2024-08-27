CREATE DEFINER=`root`@`localhost` FUNCTION `insertPerson`(`pnama` VARCHAR(255), `ptempat_lahir` VARCHAR(255), `ptanggal_lahir` DATE, `pjenis_kelamin` VARCHAR(1), `pmasuk` DATE, `pkeluar` DATE) RETURNS int(11)
BEGIN
INSERT INTO t_persons (nama,tempat_lahir, tanggal_lahir, jenis_kelamin, masuk, keluar) VALUES (`pnama`, `ptempat_lahir`, `ptanggal_lahir`, `pjenis_kelamin`, `pmasuk`, `pkeluar`);
return LAST_INSERT_ID();
END