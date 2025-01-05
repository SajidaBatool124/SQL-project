use `greenspot`;

select * from product;
select * from orders;
select * from stock;
select * from sales;

-- Look up the price of each product unit.
select a.Item_Number, a.Description, a.unit, b.price 
from product a 
inner join sales b 
on a.Item_Number = b.ItemNumbSale 
group by a.Item_Number, a.Description, a.unit, b.price 
order by b.price;

-- look up total product in stock.
select a.Item_Number, a.Description, a.unit, a.location, 
sum(b.QuantityOnHand) as TotalOnHand 
from product a 
inner join stock b
on a.Item_Number = b.ItemNumStock
group by a.Item_Number, a.Description, a.unit, a.location
order by TotalOnHand ;

-- look up total cost of the purchased orders arranged by purchase data
select a.Item_Number, a.Description, a.unit, b.Vendor,
b.purchDate, sum(b.Quantity * b.Cost) as TotalCost 
from product a 
inner join Orders b
on a.Item_Number = b.ItemNumOrder
group by a.Item_Number, a.Description, a.unit, b.Vendor,
b.purchDate
order by b.purchDate;