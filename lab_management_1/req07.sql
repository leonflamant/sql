SELECT assistant, sum(price) AS price FROM transaction JOIN can ON transaction.can = can.name GROUP BY assistant ORDER BY price DESC LIMIT 3;
