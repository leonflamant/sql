CREATE FUNCTION list_assistant_transactions(_assistant VARCHAR(64))
RETURNS TABLE (can VARCHAR(32), "timestamp" TIMESTAMP) AS $$
    SELECT can, timestamp
    FROM transaction
    WHERE assistant = $1
    ORDER BY timestamp, can;
$$ LANGUAGE SQL;
