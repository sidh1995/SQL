 Case Study #1: Dinner Resturent

Business Task
Owner wants to use the data to answer some basic questions about his customers:

When do they visit? He wants to understand their visiting patterns.
How much do they spend? He’s interested in knowing their spending habits.
What are their favorite menu items? He wants to find out which items they like the most.


**Question and Solution**


1.What is the total amount each customer spent at the restaurant?

SELECT 
  sales.customer_id, 
  SUM(menu.price) AS total_sales
FROM dannys_diner.sales
INNER JOIN dannys_diner.menu
  ON sales.product_id = menu.product_id
GROUP BY sales.customer_id
ORDER BY sales.customer_id ASC; 


2. How many days has each customer visited the restaurant?

   SELECT  customer_id, 
  COUNT(DISTINCT order_date) AS visit_count
FROM dannys_diner.sales
GROUP BY customer_id;




3. What was the first item from the menu purchased by each customer?

WITH orders AS (
  SELECT 
    sales.customer_id, sales.order_date, menu.product_name,
    DENSE_RANK() OVER (PARTITION BY sales.customer_id ORDER BY sales.order_date) AS ranking
  FROM dannys_diner.sales
  INNER JOIN dannys_diner.menu
    ON sales.product_id = menu.product_id
)
SELECT customer_id, product_name
FROM orders
WHERE ranking = 1
GROUP BY customer_id, product_name;



4. What is the most purchased item on the menu and how many times was it purchased by all customers?

  SELECT 
  menu.product_name,
  COUNT(sales.product_id) AS most_purchase
FROM dannys_diner.sales
INNER JOIN dannys_diner.menu
  ON sales.product_id = menu.product_id
GROUP BY menu.product_name
ORDER BY  COUNT(sales.product_id) DESC
LIMIT 1;


5. Which item was the most popular for each customer?

WITH popular_item AS (
  SELECT 
    sales.customer_id, 
    menu.product_name, 
    COUNT(menu.product_id) AS Total_order,
    DENSE_RANK() OVER (
      PARTITION BY sales.customer_id 
      ORDER BY COUNT(sales.customer_id) DESC) AS ranking
  FROM dannys_diner.menu
  INNER JOIN dannys_diner.sales
    ON menu.product_id = sales.product_id
  GROUP BY sales.customer_id, menu.product_name
)

SELECT 
  customer_id, 
  product_name, 
  Total_order
FROM  popular_item
WHERE ranking = 1;



6. Which item was purchased first by the customer after they became a member?
WITH member_joined_date AS (
  SELECT members.customer_id, sales.product_id,ROW_NUMBER() OVER (partition by  members.customer_id ORDER BY sales.order_date) AS rownumber
  FROM members
  INNER JOIN sales
    ON members.customer_id = sales.customer_id
    AND sales.order_date > members.join_date
)
SELECT  customer_id, product_name 
FROM member_joined_date
INNER JOIN menu
  ON member_joined_date.product_id = menu.product_id
WHERE rownumber = 1
ORDER BY customer_id ASC;


7. Which item was purchased just before the customer became a member?

 WITH item_before_member AS (
  SELECT members.customer_id, sales.product_id,ROW_NUMBER() OVER (PARTITION BY members.customer_id ORDER BY sales.order_date DESC) AS ranking
  FROM members
  INNER JOIN sales
    ON members.customer_id = sales.customer_id
    AND sales.order_date < members.join_date
)
SELECT item_before_member.customer_id, menu.product_name 
FROM item_before_member
INNER JOIN dannys_diner.menu
  ON item_before_member.product_id = menu.product_id
WHERE ranking = 1
ORDER BY item_before_member.customer_id ASC;**

8. What is the total items and amount spent for each member before they became a member?

 **SELECT sales.customer_id, COUNT(sales.product_id) AS total_items, SUM(menu.price) AS total_sales
FROM dannys_diner.sales
INNER JOIN dannys_diner.members
  ON sales.customer_id = members.customer_id
  AND sales.order_date < members.join_date
INNER JOIN dannys_diner.menu
  ON sales.product_id = menu.product_id
GROUP BY sales.customer_id
ORDER BY sales.customer_id;** 


9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier — how many points would each customer have?

WITH points_count AS (SELECT menu.product_id, 
    CASE
      WHEN product_id = 1 THEN price * 20
      ELSE price * 10 END AS points
  FROM dannys_diner.menu
)
SELECT 
  sales.customer_id, SUM(points_cte.points) AS total_points
FROM sales
INNER JOIN  points_coun
  ON sales.product_id = points_cte.product_id
GROUP BY sales.customer_id
ORDER BY sales.customer_id;



10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items,
not just sushi — how many points do customer A and B have at the end of January?

WITH dates AS (
SELECT customer_id, 
join_date, 
    DATE_ADD(join_date, INTERVAL 6 DAY) AS valid_date,
    LAST_DAY('2021-01-31') AS last_date
FROM members)

SELECT 
  sales.customer_id, SUM(CASE
    WHEN menu.product_name = 'sushi' THEN 2 * 10 * menu.price
    WHEN sales.order_date BETWEEN dates.join_date AND dates.valid_date THEN 2 * 10 * menu.price
    ELSE 10 * menu.price END) AS points
FROM sales
INNER JOIN dates
  ON sales.customer_id = dates.customer_id
  AND dates.join_date <= sales.order_date
  AND sales.order_date <= dates.last_date
INNER JOIN dannys_diner.menu
  ON sales.product_id = menu.product_id
GROUP BY sales.customer_id;




11.Recreate the table with: customer_id, order_date, product_name, price, member (Y/N)

SELECT sales.customer_id, sales.order_date, menu.product_name, menu.price,
  CASE
    WHEN members.join_date > sales.order_date THEN 'NO'
    WHEN members.join_date <= sales.order_date THEN 'YES'
    ELSE 'NO' END AS member_status
FROM sales
LEFT members
  ON sales.customer_id = members.customer_id
INNER JOIN dannys_diner.menu
  ON sales.product_id = menu.product_id
ORDER BY members.customer_id, sales.order_date



12. Danny also requires further information about the ranking of customer products, but he purposely does not need the ranking for non-member purchases so he expects null
ranking values for the records when customers are not yet part of the loyalty program

WITH DATA AS (
  SELECT sales.customer_id, sales.order_date,  menu.product_name, menu.price,
    CASE
      WHEN members.join_date > sales.order_date THEN 'NO'
      WHEN members.join_date <= sales.order_date THEN 'YES'
      ELSE 'NO' END AS member_status
  FROM sales
  LEFT JOIN members
    ON sales.customer_id = members.customer_id
  INNER JOIN menu
    ON sales.product_id = menu.product_id
)
SELECT *, 
  CASE
    WHEN member_status = 'NO' then NULL
    ELSE RANK () OVER (
      PARTITION BY customer_id, member_status
      ORDER BY order_date
  ) END AS ranking
FROM DATA;




