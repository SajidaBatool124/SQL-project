create schema if not exists `greenspot` default character set utf16;
use `greenspot`;

CREATE TABLE IF NOT EXISTS `GreenSpot`.`Product` (
  `Item_Number` INT NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(45) NOT NULL,
  `ItemType` VARCHAR(45) NOT NULL,
  `Unit` VARCHAR(45) NOT NULL,
  `Location` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Item_Number`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `GreenSpot`.`Orders` (
  `Order_Number` INT NOT NULL,
  `ItemNumOrder` INT NOT NULL,
  `Vendor` VARCHAR(99) NOT NULL,
  `Quantity` INT NOT NULL,
  `Cost` DECIMAL(4,2) NOT NULL,
  `PurchDate` DATE NOT NULL,
  PRIMARY KEY (`Order_Number`),
  INDEX `Item_Number_idx` (`ItemNumOrder` ASC) VISIBLE,
  CONSTRAINT `Item_Number_of_Order`
    FOREIGN KEY (`ItemNumOrder`)
    REFERENCES `GreenSpot`.`Product` (`Item_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

create table `greenspot`.`sales` (
`sale_Number` INT NOT NULL,
`ItemNumbSale` int not null,
`Customer` int not null,
`Datesold` Date not null,
`price` decimal (4,2) not null,
primary key (`sale_Number`),
INDEX `Item_Number_idx` (`ItemNumbSale` ASC) VISIBLE,
  CONSTRAINT `Item_Number_of_Sale`
    FOREIGN KEY (`ItemNumbSale`)
    REFERENCES `GreenSpot`.`Product` (`Item_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `GreenSpot`.`Stock` (
  `Stock_Number` INT NOT NULL,
  `ItemNumStock` INT NOT NULL,
  `QuantityOnHand` INT NOT NULL,
  PRIMARY KEY (`Stock_Number`),
  INDEX `Item_Number_idx` (`ItemNumStock` ASC) VISIBLE,
  CONSTRAINT `Stocked_Item_Number`
    FOREIGN KEY (`ItemNumStock`)
    REFERENCES `GreenSpot`.`Product` (`Item_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- data for table greenspot.product

START TRANSACTION;
USE `GreenSpot`;
INSERT INTO `GreenSpot`.`Product` (`Item_Number`, `Description`, `ItemType`, `Unit`, `Location`) VALUES (1000, 'Bennet Farm free-range eggs', 'Dairy', 'dozen', 'D12');
INSERT INTO `GreenSpot`.`Product` (`Item_Number`, `Description`, `ItemType`, `Unit`, `Location`) VALUES (1100, 'Freshness White beans', 'Canned', '12oz can', 'A2');
INSERT INTO `GreenSpot`.`Product` (`Item_Number`, `Description`, `ItemType`, `Unit`, `Location`) VALUES (1222, 'Freshness Green beans', 'Canned', '12oz can', 'A3');
INSERT INTO `GreenSpot`.`Product` (`Item_Number`, `Description`, `ItemType`, `Unit`, `Location`) VALUES (1223, 'Freshness Green beans', 'Canned', '36oz can', 'A7');
INSERT INTO `GreenSpot`.`Product` (`Item_Number`, `Description`, `ItemType`, `Unit`, `Location`) VALUES (1224, 'Freshness Wax beans', 'Canned', '12oz can', 'A3');
INSERT INTO `GreenSpot`.`Product` (`Item_Number`, `Description`, `ItemType`, `Unit`, `Location`) VALUES (2000, 'Ruby\'s Kale', 'Produce', 'bunch', 'P12');
INSERT INTO `GreenSpot`.`Product` (`Item_Number`, `Description`, `ItemType`, `Unit`, `Location`) VALUES (2001, 'Ruby\'s Organic Kale', 'Produce', 'bunch', 'PO2');

COMMIT;

-- data for greenspot.orders

START TRANSACTION;
USE `GreenSpot`;
INSERT INTO `GreenSpot`.`Orders` (`Order_Number`, `ItemNumOrder`, `Vendor`, `Quantity`, `Cost`, `PurchDate`) VALUES (1, 1000, 'Bennet Farms, Rt. 17 Evansville, IL 55446', 25, 2.35, '2022-02-01');
INSERT INTO `GreenSpot`.`Orders` (`Order_Number`, `ItemNumOrder`, `Vendor`, `Quantity`, `Cost`, `PurchDate`) VALUES (2, 1000, 'Bennet Farms, Rt. 17 Evansville, IL 55446', 2, 2.35, '2022-02-01');
INSERT INTO `GreenSpot`.`Orders` (`Order_Number`, `ItemNumOrder`, `Vendor`, `Quantity`, `Cost`, `PurchDate`) VALUES (3, 1000, 'Bennet Farms, Rt. 17 Evansville, IL 55446', 2, 2.35, '2022-02-01');
INSERT INTO `GreenSpot`.`Orders` (`Order_Number`, `ItemNumOrder`, `Vendor`, `Quantity`, `Cost`, `PurchDate`) VALUES (4, 1000, 'Bennet Farms, Rt. 17 Evansville, IL 55446', 4, 2.35, '2022-02-01');
INSERT INTO `GreenSpot`.`Orders` (`Order_Number`, `ItemNumOrder`, `Vendor`, `Quantity`, `Cost`, `PurchDate`) VALUES (5, 1100, 'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678', 2, 2.35, '2022-02-01');
INSERT INTO `GreenSpot`.`Orders` (`Order_Number`, `ItemNumOrder`, `Vendor`, `Quantity`, `Cost`, `PurchDate`) VALUES (6, 1100, 'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678', 40, 0.69, '2022-02-02');
INSERT INTO `GreenSpot`.`Orders` (`Order_Number`, `ItemNumOrder`, `Vendor`, `Quantity`, `Cost`, `PurchDate`) VALUES (7, 1100, 'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678', 8, 0.69, '2022-02-02');
INSERT INTO `GreenSpot`.`Orders` (`Order_Number`, `ItemNumOrder`, `Vendor`, `Quantity`, `Cost`, `PurchDate`) VALUES (8, 1100, 'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678', 4, 0.69, '2022-02-02');
INSERT INTO `GreenSpot`.`Orders` (`Order_Number`, `ItemNumOrder`, `Vendor`, `Quantity`, `Cost`, `PurchDate`) VALUES (9, 1222, 'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678', 40, 0.59, '2022-02-10');
INSERT INTO `GreenSpot`.`Orders` (`Order_Number`, `ItemNumOrder`, `Vendor`, `Quantity`, `Cost`, `PurchDate`) VALUES (10, 1222, 'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678', 12, 0.59, '2022-02-10');
INSERT INTO `GreenSpot`.`Orders` (`Order_Number`, `ItemNumOrder`, `Vendor`, `Quantity`, `Cost`, `PurchDate`) VALUES (11, 1223, 'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678', 10, 1.75, '2022-02-10');
INSERT INTO `GreenSpot`.`Orders` (`Order_Number`, `ItemNumOrder`, `Vendor`, `Quantity`, `Cost`, `PurchDate`) VALUES (12, 1223, 'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678', 5, 1.75, '2022-02-10');
INSERT INTO `GreenSpot`.`Orders` (`Order_Number`, `ItemNumOrder`, `Vendor`, `Quantity`, `Cost`, `PurchDate`) VALUES (21, 1223, 'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678', 10, 1.80, '2022-02-15');
INSERT INTO `GreenSpot`.`Orders` (`Order_Number`, `ItemNumOrder`, `Vendor`, `Quantity`, `Cost`, `PurchDate`) VALUES (13, 1224, 'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678', 30, 0.65, '2022-02-10');
INSERT INTO `GreenSpot`.`Orders` (`Order_Number`, `ItemNumOrder`, `Vendor`, `Quantity`, `Cost`, `PurchDate`) VALUES (14, 1224, 'Freshness, Inc., 202 E. Maple St., St. Joseph, MO 45678', 8, 0.65, '2022-02-10');
INSERT INTO `GreenSpot`.`Orders` (`Order_Number`, `ItemNumOrder`, `Vendor`, `Quantity`, `Cost`, `PurchDate`) VALUES (15, 2000, 'Ruby Redd Produce, LLC, 1212 Milam St., Kenosha, AL, 34567', 2, 0.65, '2022-02-10');
INSERT INTO `GreenSpot`.`Orders` (`Order_Number`, `ItemNumOrder`, `Vendor`, `Quantity`, `Cost`, `PurchDate`) VALUES (16, 2000, 'Ruby Redd Produce, LLC, 1212 Milam St., Kenosha, AL, 34567', 25, 1.29, '2022-02-12');
INSERT INTO `GreenSpot`.`Orders` (`Order_Number`, `ItemNumOrder`, `Vendor`, `Quantity`, `Cost`, `PurchDate`) VALUES (17, 2000, 'Ruby Redd Produce, LLC, 1212 Milam St., Kenosha, AL, 34567', 2, 1.29, '2022-02-12');
INSERT INTO `GreenSpot`.`Orders` (`Order_Number`, `ItemNumOrder`, `Vendor`, `Quantity`, `Cost`, `PurchDate`) VALUES (18, 2001, 'Ruby Redd Produce, LLC, 1212 Milam St., Kenosha, AL, 34567', 20, 2.19, '2022-02-12');
INSERT INTO `GreenSpot`.`Orders` (`Order_Number`, `ItemNumOrder`, `Vendor`, `Quantity`, `Cost`, `PurchDate`) VALUES (19, 2001, 'Ruby Redd Produce, LLC, 1212 Milam St., Kenosha, AL, 34567', 1, 2.19, '2022-02-12');
INSERT INTO `GreenSpot`.`Orders` (`Order_Number`, `ItemNumOrder`, `Vendor`, `Quantity`, `Cost`, `PurchDate`) VALUES (20, 2001, 'Ruby Redd Produce, LLC, 1212 Milam St., Kenosha, AL, 34567', 12, 2.19, '2022-02-12');

COMMIT;


-- data for greenspot.sales 

START TRANSACTION;
USE `GreenSpot`;
INSERT INTO `GreenSpot`.`Sales` (`Sale_Number`, `ItemNumbSale`, `Customer`, `DateSold`, `Price`) VALUES (1, 1000, 198765, '2022-02-02', 5.49);
INSERT INTO `GreenSpot`.`Sales` (`Sale_Number`, `ItemNumbSale`, `Customer`, `DateSold`, `Price`) VALUES (4, 1000, 196777, '2022-02-04', 5.49);
INSERT INTO `GreenSpot`.`Sales` (`Sale_Number`, `ItemNumbSale`, `Customer`, `DateSold`, `Price`) VALUES (6, 1000, 277177, '2022-02-11', 5.49);
INSERT INTO `GreenSpot`.`Sales` (`Sale_Number`, `ItemNumbSale`, `Customer`, `DateSold`, `Price`) VALUES (2, 1100, 202900, '2022-02-02', 1.49);
INSERT INTO `GreenSpot`.`Sales` (`Sale_Number`, `ItemNumbSale`, `Customer`, `DateSold`, `Price`) VALUES (5, 1100, 198765, '2022-02-07', 1.49);
INSERT INTO `GreenSpot`.`Sales` (`Sale_Number`, `ItemNumbSale`, `Customer`, `DateSold`, `Price`) VALUES (7, 1100, NULL, '2022-02-11', 1.49);
INSERT INTO `GreenSpot`.`Sales` (`Sale_Number`, `ItemNumbSale`, `Customer`, `DateSold`, `Price`) VALUES (8, 1222, 111000, '2022-02-12', 1.29);
INSERT INTO `GreenSpot`.`Sales` (`Sale_Number`, `ItemNumbSale`, `Customer`, `DateSold`, `Price`) VALUES (10, 1223, 198765, '2022-02-13', 3.49);
INSERT INTO `GreenSpot`.`Sales` (`Sale_Number`, `ItemNumbSale`, `Customer`, `DateSold`, `Price`) VALUES (9, 1224, NULL, '2022-02-12', 1.55);
INSERT INTO `GreenSpot`.`Sales` (`Sale_Number`, `ItemNumbSale`, `Customer`, `DateSold`, `Price`) VALUES (3, 2000, NULL, '2022-02-02', 3.99);
INSERT INTO `GreenSpot`.`Sales` (`Sale_Number`, `ItemNumbSale`, `Customer`, `DateSold`, `Price`) VALUES (13, 2000, 111000, '2022-02-15', 3.99);
INSERT INTO `GreenSpot`.`Sales` (`Sale_Number`, `ItemNumbSale`, `Customer`, `DateSold`, `Price`) VALUES (11, 2001, 100988, '2022-02-13', 6.99);
INSERT INTO `GreenSpot`.`Sales` (`Sale_Number`, `ItemNumbSale`, `Customer`, `DateSold`, `Price`) VALUES (12, 2001, 202900, '2022-02-14', 6.99);

COMMIT;

-- data for table greenspot.stock 

START TRANSACTION;
USE `GreenSpot`;
INSERT INTO `GreenSpot`.`Stock` (`Stock_Number`, `ItemNumStock`, `QuantityOnHand`) VALUES (1, 1000, 29);
INSERT INTO `GreenSpot`.`Stock` (`Stock_Number`, `ItemNumStock`, `QuantityOnHand`) VALUES (2, 1000, 27);
INSERT INTO `GreenSpot`.`Stock` (`Stock_Number`, `ItemNumStock`, `QuantityOnHand`) VALUES (3, 1000, 25);
INSERT INTO `GreenSpot`.`Stock` (`Stock_Number`, `ItemNumStock`, `QuantityOnHand`) VALUES (4, 1000, 21);
INSERT INTO `GreenSpot`.`Stock` (`Stock_Number`, `ItemNumStock`, `QuantityOnHand`) VALUES (5, 1100, 13);
INSERT INTO `GreenSpot`.`Stock` (`Stock_Number`, `ItemNumStock`, `QuantityOnHand`) VALUES (6, 1100, 53);
INSERT INTO `GreenSpot`.`Stock` (`Stock_Number`, `ItemNumStock`, `QuantityOnHand`) VALUES (7, 1100, 45);
INSERT INTO `GreenSpot`.`Stock` (`Stock_Number`, `ItemNumStock`, `QuantityOnHand`) VALUES (8, 1100, 41);
INSERT INTO `GreenSpot`.`Stock` (`Stock_Number`, `ItemNumStock`, `QuantityOnHand`) VALUES (9, 1222, 59);
INSERT INTO `GreenSpot`.`Stock` (`Stock_Number`, `ItemNumStock`, `QuantityOnHand`) VALUES (10, 1222, 47);
INSERT INTO `GreenSpot`.`Stock` (`Stock_Number`, `ItemNumStock`, `QuantityOnHand`) VALUES (11, 1223, 12);
INSERT INTO `GreenSpot`.`Stock` (`Stock_Number`, `ItemNumStock`, `QuantityOnHand`) VALUES (12, 1223, 7);
INSERT INTO `GreenSpot`.`Stock` (`Stock_Number`, `ItemNumStock`, `QuantityOnHand`) VALUES (13, 1223, 17);
INSERT INTO `GreenSpot`.`Stock` (`Stock_Number`, `ItemNumStock`, `QuantityOnHand`) VALUES (14, 1224, 31);
INSERT INTO `GreenSpot`.`Stock` (`Stock_Number`, `ItemNumStock`, `QuantityOnHand`) VALUES (15, 1224, 23);
INSERT INTO `GreenSpot`.`Stock` (`Stock_Number`, `ItemNumStock`, `QuantityOnHand`) VALUES (16, 2000, 3);
INSERT INTO `GreenSpot`.`Stock` (`Stock_Number`, `ItemNumStock`, `QuantityOnHand`) VALUES (17, 2000, 28);
INSERT INTO `GreenSpot`.`Stock` (`Stock_Number`, `ItemNumStock`, `QuantityOnHand`) VALUES (18, 2000, 26);
INSERT INTO `GreenSpot`.`Stock` (`Stock_Number`, `ItemNumStock`, `QuantityOnHand`) VALUES (19, 2001, 20);
INSERT INTO `GreenSpot`.`Stock` (`Stock_Number`, `ItemNumStock`, `QuantityOnHand`) VALUES (20, 2001, 19);
INSERT INTO `GreenSpot`.`Stock` (`Stock_Number`, `ItemNumStock`, `QuantityOnHand`) VALUES (21, 2001, 7);

COMMIT;

select * from stock 











