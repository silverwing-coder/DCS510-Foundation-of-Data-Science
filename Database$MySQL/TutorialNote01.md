<em><h5>Update: July-2022</h5></em>

<h2>MySql Tutorial Note</h2>

<h4>1. Installation</h4>
1. Community version
2. Environment variable $PATH to mysql-folder/bin is open by default

<h4>2. CLI command</h4>

-   `mysqlsh -u user-id (-p database-name): optional` -> enter password
-   `show databases`
    enter password

<h4>3. Basic SQL Statements</h4>

Use [W3School Online Web Tutorial](https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_where)

```sql
select * from customers;

select * from orders;

select *
from products
order by price;

select customerName, count(*) as 'number of orders'
from customers
inner join orders on orders.customerID = customers.customerID
group by customers.customerID;

/* Crazy */
select username, photos.id, photos.image_url, count(*) as total
from photos
inner join likes on likes.photo_id = photos.id
inner join users on photos.user_id = user.id
group by photos.id
order by total desc;

/* Crazier */
select first_name, last_name,
    count(rating) as COUNT,
    Ifnull(Min(rating), 0) as MIN,
    Ifnull(Max(rating), 0) as MAX,
    Round(Ifnull(Avg(rating), 0), 2) as AVG,
    case
        when count(rating) >= 10 then 'POWER USER'
        when count(rating) >=0 then 'ACTIVE'
        else 'INACTIVE'
    end
from reviewers
    left join reviews on reviewers.id = reviews.reviewer_id
group by reviews.id
```
