CREATE FUNCTION can_price(_can VARCHAR(32))
RETURNS NUMERIC(3,2) AS $$
    SELECT price 
    FROM can
    WHERE name = can_price._can;
$$ LANGUAGE SQL;

CREATE FUNCTION can_stock(_can VARCHAR(32))
RETURNS INT AS $$
    SELECT stock
    FROM can
    WHERE name = can_stock._can;
$$ LANGUAGE SQL;

CREATE FUNCTION assistant_credit(_assistant VARCHAR(64))
RETURNS NUMERIC(3,2) AS $$
    SELECT credit
    FROM assistant
    WHERE login = _assistant;
$$ LANGUAGE SQL;

CREATE FUNCTION tran_id()
RETURNS INTEGER as $$
    SELECT MAX(id) + 1 AS id FROM transaction;
$$ LANGUAGE SQL;

CREATE FUNCTION buy_can(_assistant VARCHAR(64), _can VARCHAR(32))
RETURNS BOOLEAN AS $$
DECLARE
    prix float := can_price(_can);
    stk int := can_stock(_can);
    cred float := assistant_credit(_assistant);
BEGIN
    IF stk > 0 AND cred >= prix THEN
        UPDATE can SET stock = stock - 1
        WHERE name = buy_can._can;
        UPDATE assistant SET credit = credit - prix
        WHERE login = buy_can._assistant;
        INSERT INTO transaction VALUES(tran_id(), _assistant, _can, now());
    END IF;
    RETURN prix IS NOT NULL AND stk is NOT NULL and cred is NOT NULL AND stk > 0 AND cred >= prix;
END;
$$ LANGUAGE plpgsql;
