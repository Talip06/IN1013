-- 1

SELECT sum(bill_total) AS Income FROM restBill;

-- 2

SELECT sum(bill_total) AS 'Feb Income' FROM restBill where bill_date LIKE '1602%';

-- 3

SELECT AVG(bill_total) FROM restBill;

-- 4 

SELECT Min(no_of_seats) AS Min, Max(no_of_seats) AS Max, Avg(no_of_seats) AS Avg FROM restRest_table WHERE room_name = "Blue";

-- 5

SELECT COUNT(DISTINCT table_no) AS distinct_tables_served FROM restBill WHERE waiter_no IN (004, 002);