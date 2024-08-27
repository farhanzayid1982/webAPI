CREATE DEFINER=`root`@`localhost` PROCEDURE `ubahMHS`(
    IN `poldnim` VARCHAR(16), 
    IN `pnim` VARCHAR(16), 
    IN `pnama` VARCHAR(255), 
    IN `ptempat_lahir` VARCHAR(255), 
    IN `ptanggal_lahir` DATE, 
    IN `pjenis_kelamin` VARCHAR(255), 
    IN `pmasuk` DATE, 
    IN `pkeluar` DATE
)
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