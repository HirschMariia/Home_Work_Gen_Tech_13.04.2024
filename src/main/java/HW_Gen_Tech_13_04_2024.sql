-- 1.Вывести компании-перевозчиков, которые доставили клиентам
-- более 250 заказов (проекция: название_компании, ко-во заказов)

SELECT
Shippers.ShipperName,
COUNT(OrderID) as Quantity
FROM Shippers
JOIN Orders ON Shippers.ShipperID = Orders.ShipperID
GROUP BY ShipperName
HAVING COUNT(OrderID) > 250

-- 2.Вывести заказы, где ко-во товаров 3 и более
-- (проекция: номерзаказа, ко-вотовароввзаказе)


SELECT
OrderID,
COUNT(OrderID) AS Quantity
FROM OrderDetails
GROUP BY OrderID
HAVING COUNT(ProductID) >= 3


-- 3.Вывести минимальную стоимость товара для каждой категории,
-- кроме категории 2 (проекция: названиекатегории, минстоимость_товара)

SELECT
Categories.categoryName,
MIN(Products.Price) AS Min_Price
FROM Categories
JOIN Products ON Categories.CategoryID = Products.CategoryID
WHERE Categories.CategoryID != 2
GROUP BY Categories.CategoryName


-- 4.Вывести менеджера, который находится на 4 месте
-- по ко-ву созданных заказов (проекция: фамилияменеджера, к-восозданных_заказов)

SELECT
Employees.LastName AS LastName,
COUNT(Orders.OrderID) AS Created_Order
FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Employees.EmployeeID
ORDER BY Created_Order DESC
LIMIT 1 OFFSET 3

--5.Вывести данные о товарах от поставщиков 4 и 8 (проекция:
--всеимеющиесяполя, ценасоскидкой1.5процента, ценаснаценкой0.5процента)

SELECT
ProductID,
ProductName,
SupplierID,
CategoryID,
Unit,
Price,
Price * 0.985 AS PriceWithDiscount,
Price * 1.005 AS PriceWithMarkup
FROM Products
WHERE SupplierID IN (4, 8)
