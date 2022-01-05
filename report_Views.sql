CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `report` AS
    SELECT 
        `d`.`OrderID` AS `OrderID`,
        ROUND((SUM((`d`.`Quantity` * `p`.`Price`)) / SUM(`d`.`Quantity`)),
                1) AS `price`
    FROM
        (`orderdetails` `d`
        JOIN `products` `p`)
    WHERE
        (`d`.`ProductID` = `p`.`ProductID`)
    GROUP BY `d`.`OrderID`