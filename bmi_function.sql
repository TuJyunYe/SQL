CREATE DEFINER=`root`@`localhost` FUNCTION `bmi`(w decimal(3,1), h decimal(3,1)) RETURNS decimal(3,1)
BEGIN

RETURN w / pow(h, 2);
END