CREATE DEFINER=`root`@`localhost` PROCEDURE `tampilMHS`(IN `filter` VARCHAR(255))
if LENGTH(`filter`)=0 then
   select * from v_mhs;
ELSE
	SELECT * from v_mhs WHERE nama like CONCAT('%',`filter`,'%') or nim like CONCAT('%',`filter`,'%');
END IF