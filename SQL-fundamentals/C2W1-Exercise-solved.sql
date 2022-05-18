--These exercises are from MODE at https://app.mode.com/editor, dsv1069 database

--exc 2
SELECT category, count(id) as num_of_items
FROM dsv1069.items
GROUP BY category
ORDER BY category

--exc 3 - select all from users and orders joined
SELECT * 
FROM dsv1069.users as u FULL OUTER JOIN dsv1069.orders as o
ON u.id=o.user_id

--exc 4 - modify query
SELECT COUNT(event_id) AS events
FROM dsv1069.events
WHERE event_name = 'view_item'

--exc 5 - correct query
SELECT COUNT(item_id) as item_count
FROM dsv1069.orders as o INNER JOIN dsv1069.items as i
on o.item_id=i.id

SELECT * --COUNT(item_id) as item_count
FROM dsv1069.items

SELECT * from dsv1069.items
SELECT * from dsv1069.orders

--exc 6
SELECT * from dsv1069.users

SELECT distinct (o.user_id), u.first_name, u.last_name, o.item_name, o.paid_at
FROM dsv1069.users as u inner JOIN dsv1069.orders as o
ON u.id=o.user_id
ORDER BY o.paid_at

SELECT distinct(user_id), item_name, paid_at
from dsv1069.orders
--GROUP BY user_id
--ORDER by paid_at
order by user_id

SELECT user_id,item_name, paid_at
from dsv1069.orders
WHERE user_id IN (SELECT distinct(user_id)
FROM dsv1069.orders)
ORDER by user_id ASC

SELECT user_id, MIN(paid_at) as min_paid
FROM dsv1069.orders as o
RIGHT JOIN dsv1069.users as u
on o.user_id=u.id
GROUP BY user_id