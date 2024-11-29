/* 1-- */

SELECT first_name FROM restStaff
INNER JOIN restBill ON restStaff.staff_no = restBill.waiter_no WHERE restBill.cust_name = "Tanya Singh";

/* 2-- */

SELECT room_date FROM restRoom_management INNER JOIN restStaff WHERE restStaff.staff_no = restRoom_management.headwaiter  AND room_date LIKE '1602%' AND room_name = 'Green';

/* 3-- */

SELECT first_name, surname FROM restStaff WHERE headwaiter = (SELECT headwaiter FROM restStaff WHERE first_name = 'Zoe' AND surname = 'Ball') AND first_name != 'Zoe';

/* 4-- */

SELECT cust_name, bill_total, CONCAT(restStaff.first_name, ' ', restStaff.surname) AS Waiter_Name
FROM restBill INNER JOIN restStaff WHERE waiter_no = staff_no ORDER BY bill_total DESC;

/* 5-- */

WITH BillWaiters AS ( SELECT DISTINCT waiter_no FROM restBill WHERE bill_no IN (14, 17))
SELECT DISTINCT restStaff.first_name AS Waiter_FirstName,restStaff.surname AS Waiter_Surname
FROM restBillINNER JOIN estStaff ON restBill.waiter_no = restStaff.staff_no
WHERE restBill.waiter_no IN (SELECT waiter_no FROM BillWaiters);

/* 6-- */

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no IN (
    -- Waiters serving on 160312 in Blue room
    SELECT DISTINCT b.waiter_no
    FROM restBill b
    JOIN restRest_table t ON b.table_no = t.table_no
    WHERE b.bill_date = 160312 AND t.room_name = 'Blue'
    UNION
    -- Include the headwaiter of Blue room on 160312
    SELECT rm.headwaiter
    FROM restRoom_management rm
    WHERE rm.room_name = 'Blue' AND rm.room_date = 160312
);
