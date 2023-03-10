drop view if exists OrdersView;
create view OrdersView as
select Order_Id as 'Order ID',Quantity as 'Quantity', total_cost as 'Total cost' from Orders
where Quantity > 1;

select * from OrdersView;

select s.Customer_ID,s.Full_Name,o.Order_Id, o.Total_Cost as 'Cost',
m.Menu_name as 'Menu name',m.Cuisine  from Customers s 
join Bookings b on s.Customer_ID=b.Customer_Id
join Orders o on o.Booking_id=b.Booking_Id
join Menus m on m.Menu_id=o.menu_id
join MenuItems mi on m.item_id=mi.item_id
where o.Total_cost > 40
order by o.Total_cost;

select mi.Name from Menus m
join Menuitems mi on m.item_id=mi.item_id
where m.menu_id = any (select o.Menu_Id from Orders o where o.Quantity > 1);

