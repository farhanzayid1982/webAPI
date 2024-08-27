CREATE DEFINER=`root`@`localhost` PROCEDURE `sisipMHS`(IN `pnim` varchar(16), IN pnama varchar(255),IN ptempat_lahir varchar(255),IN ptanggal_lahir date,IN pjenis_kelamin varchar(255),IN pmasuk date,IN pkeluar date)
BEGIN
	#Routine body goes here...
	
	INSERT INTO t_mhs (nim,id_persons) VALUES (`pnim`, insertPerson(`pnama`, `ptempat_lahir`, `ptanggal_lahir`, `pjenis_kelamin`, `pmasuk`, `pkeluar`));
END