SELECT customer_surname FROM booking join customer on customer.surname = booking.customer_surname WHERE '03-11-2019' >= start_date AND '03-11-2019' <= end_date ORDER BY customer_surname;
