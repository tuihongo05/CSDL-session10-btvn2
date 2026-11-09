CREATE DATABASE session10_btvn2_InventoryManagement;
USE session10_btvn2_InventoryManagement;

CREATE TABLE products(
	productID INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(100) NOT NULL,
    quantity INT NOT NULL
);

CREATE TABLE inventoryChanges(
	changeID INT AUTO_INCREMENT PRIMARY KEY,
    oldQuantity INT NOT NULL,
    newQuantity INT NOT NULL,
    changeDate DATETIME,
    productID INT,
    FOREIGN KEY(productID) REFERENCES products(productID)
);

DELIMITER $$
CREATE TRIGGER BeforeProductDelete
BEFORE DELETE ON products
FOR EACH ROW
BEGIN
	IF OLD.quantity > 10 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'khong the xoa san pham';
    END IF;
END $$
DELIMITER ;

INSERT INTO products(productName, quantity)
VALUES 
	('milk', 12),
    ('apple', 7);

SELECT * FROM products;

-- bat safemode 
SET SQL_SAFE_UPDATES=1;

DELETE FROM products
WHERE productID = 1;

DELETE FROM products
WHERE productID =2;

	