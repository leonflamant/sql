SELECT destination_acronym as destination, customer_surname as customer, travelers, (end_date - start_date) as number_of_days FROM booking ORDER BY number_of_days DESC, destination, customer;
