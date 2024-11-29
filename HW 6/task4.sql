/* 1-- */

SELECT DISTINCT cust_name 
FROM restBill T1
INNER JOIN restStaff T2 ON T1.waiter_no = T2.staff_no 
INNER JOIN restStaff T3 ON T2.Headwaiter = (SELECT DISTINCT staff_no FROM restStaff WHERE first_name = 'Charles')
WHERE bill_total > 450;

/* 2-- */

SELECT first_name, surname FROM restStaff WHERE staff_no = (SELECT Headwaiter FROM restBill T2
INNER JOIN restStaff T3 ON T2.waiter_no = T3.staff_no
WHERE T2.cust_name LIKE 'Nerida%' AND T2.bill_date = '160111');

/* 3-- */

SELECT cust_name FROM restBill WHERE bill_total = (SELECT MIN(bill_total) FROM restBill) ;

/* 4-- */

SELECT first_name, surname FROM restStaff 
WHERE staff_no NOT IN (
  SELECT DISTINCT staff_no 
  FROM restStaff T1 
  INNER JOIN restBill T2 ON T2.waiter_no = T1.staff_no
  WHERE T2.waiter_no IS NOT NULL)

/* 5-- */

SELECT cust_name, T3.first_name, T3.surname, T4.room_name FROM restBill T1
INNER JOIN restStaff T2 ON T1.waiter_no = T2.staff_no
INNER JOIN restStaff T3 ON T2.headwaiter = T3.staff_no
INNER JOIN restRest_table T4 ON T1.table_no = T4.table_no
WHERE bill_total = (SELECT MAX(bill_total) FROM restBill)
