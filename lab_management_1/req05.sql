SELECT * FROM transaction WHERE (SELECT MAX(timestamp) FROM transaction) = timestamp;
